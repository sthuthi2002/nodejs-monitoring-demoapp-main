FROM node:16-alpine
LABEL Name="Node.js Demo App" Version=4.9.7

ENV NODE_ENV=production
WORKDIR /app

# Copy package files first for layer caching
COPY package*.json ./
RUN npm install --production --silent

# Copy the rest of the project
COPY . .

# Expose port
EXPOSE 3000

ENTRYPOINT ["npm", "start"]
