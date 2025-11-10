# 1. Use an official lightweight Node.js image
FROM node:18-alpine

# 2. Set working directory inside the container
WORKDIR /app

# 3. Copy only package files first (better cache)
COPY package*.json ./

# 4. Install dependencies
RUN npm install --omit=dev

# 5. Copy all remaining source code
COPY . .

# 6. Expose port 3000 to the outside world
EXPOSE 3000

# 7. Define the command to run your app
CMD ["node", "server.js"]
