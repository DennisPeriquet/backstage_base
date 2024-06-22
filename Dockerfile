# Stage 1: Install yarn, and prepare the build environment
FROM node:18-bookworm-slim AS build-env

# Install necessary build dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 g++ build-essential git && \
    yarn set version 1.x

# Set the working directory
WORKDIR /app

RUN echo "Current version of @backstage/create-app:" && npm show @backstage/create-app version

# Create the Backstage application using a specific version
# since we have to fixup one of the source files (App.tsx)
RUN BACKSTAGE_APP_NAME=build-backstage npx @backstage/create-app@0.5.16

