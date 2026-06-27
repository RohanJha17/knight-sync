# Use Node.js 20 LTS base image
FROM node:20

# Create and set the working directory
WORKDIR /app

# Copy package.json and package-lock.json first to cache npm install step
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Rebuild the CSS file using Tailwind
RUN npm run build:css

# Hugging Face Spaces runs on port 7860 by default
ENV PORT=7860
EXPOSE 7860

# Start the application
CMD ["npm", "start"]
