# Use Node.js LTS Alpine
FROM node:18-alpine

RUN apk add --no-cache python3 g++ make bash git libc6-compat

WORKDIR /app

# Copy package files
COPY package*.json ./src/

# Install dependencies in src/
WORKDIR /app/src
RUN npm install --production

# Copy all source code
COPY src/ ./ 

# Expose the app port
EXPOSE 3000

# Start the app
CMD ["node", "server.mjs"]
