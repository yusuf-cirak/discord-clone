# Stage 1: Build Stage
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Install dependencies (first package.json to leverage Docker cache)
COPY package*.json ./

# Install only production dependencies for optimizing the image size
RUN npm ci --only=production

# Install development dependencies separately
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js app
RUN npm run build:prod

# Stage 2: Production Stage
FROM node:18-alpine AS runner

# Set NODE_ENV environment variable to production
ENV NODE_ENV=production

# Learn more here: https://nextjs.org/telemetry
ENV NEXT_TELEMETRY_DISABLED 1

# Ensure the node user has ownership and necessary permissions
RUN mkdir -p /app/.next/cache/images \
    && chown -R node:node /app \
    && chmod -R 775 /app/.next/cache

# Set working directory
WORKDIR /app

# Copy the Next.js app
COPY --from=builder /app .

# Expose port 3000 to access the Next.js app
EXPOSE 3000

# Run the Next.js app as a non-root user for security
USER node

# Command to run the Next.js app
CMD ["./run.sh"]
