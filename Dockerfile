# Hi, here is a Docker build file for your convenience in building a private Docker image.
# Please make sure to configure the .env file in this project's root directory before proceeding.
# It is important to note that this Docker image will include your .env file, so do not publicly share your Docker image.

# Please follow the steps below:
# 1. Install Docker
# 2. Configure .env file
# 3. Build Docker image

# > Step 1 build NextJs
FROM node:alpine AS builder
WORKDIR /app
COPY . .
RUN pnpm install

ENV POSTGRES_URL=postgres://USER:PASSWORD@HOST/DB
ENV WEB_BASE_URI=http://localhost:3000
ENV PORT 3000


EXPOSE ${PORT}
CMD ["node_modules/.bin/next", "start"]

