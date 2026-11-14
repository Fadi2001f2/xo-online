FROM node:20-alpine
RUN apk add --no-cache unzip
WORKDIR /src
COPY xo-online.zip .
RUN unzip -q xo-online.zip && cd xo-online/client && npm install && npm run build && cd ../server && npm install --omit=dev
WORKDIR /src/xo-online/server
ENV NODE_ENV=production
CMD ["node", "src/index.js"]
