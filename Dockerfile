# Installs Node.js image
FROM node:18-alpine

# sets the working directory for any RUN, CMD, COPY command
# all files we put in the Docker container running the server will be in /usr/src/app (e.g. /usr/src/app/package.json)
WORKDIR /usr/src/app

RUN npm install -g pnpm

# Copies package.json, package-lock.json, tsconfig.json, .env to the root of WORKDIR
COPY ["package*.json", "pnpm-lock.yaml", "tsconfig.json", ".env", "./"]

# Copies everything in the src directory to WORKDIR/src
COPY ./src ./src

# Installs all packages
RUN pnpm install

# Runs the dev npm script to build & start the server
CMD pnpm run dev