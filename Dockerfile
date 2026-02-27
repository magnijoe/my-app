# Use a lightweight Node.js image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first for caching
COPY package*.json ./

# Install dependencies including devDependencies (adapter-node is usually a devDependency)
RUN npm install --include=dev

# Copy the rest of the project files
COPY . .

# Build the SvelteKit app
RUN npm run build

# Environment variables to allow external access
ENV HOST=0.0.0.0
ENV PORT=3000

# Expose port 3000
EXPOSE 3000

# Run the built Node server
CMD ["node", "build"]