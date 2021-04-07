FROM nothinux/node-alpine:latest as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nothinux/go-httpserver:latest
COPY --from=builder /app/dist /static
EXPOSE 8080
