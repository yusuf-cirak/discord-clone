# Run migrations
echo "Applying Prisma migrations..."
npx prisma migrate deploy

# Start the Next.js app
echo "Starting the Next.js app..."
npm run start
