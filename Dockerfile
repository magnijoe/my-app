FROM node:20-alpine

WORKDIR /app

# Copy only package files first for caching
COPY package*.json ./

# Install dependencies including devDependencies
RUN npm install --include=dev

# Copy rest of the code
COPY . .

# Build SvelteKit
RUN npm run build

# Expose environment variables for Coolify
ENV HOST=0.0.0.0
ENV PORT=3000
EXPOSE 3000

# Use npm start instead of node build
CMD ["npm", "run", "start"]