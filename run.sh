echo "Applying Prisma migrations..."
npx prisma migrate deploy

echo "Starting the Next.js app..."
npm run start
