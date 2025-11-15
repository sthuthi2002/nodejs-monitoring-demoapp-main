FROM node:16-alpine
LABEL Name="Node.js Demo App" Version=4.8.5
LABEL org.opencontainers.image.source="https://github.com/benc-uk/nodejs-demoapp"

ENV NODE_ENV=production
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install --production --silent

# Copy app code
COPY . .

# Expose port for Kubernetes
EXPOSE 3000

ENTRYPOINT ["npm", "start"]
