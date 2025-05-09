FROM node:20

RUN corepack enable && corepack prepare pnpm@latest --activate

WORKDIR /app

COPY . .

RUN pnpm install
RUN pnpm build

EXPOSE 5678

CMD ["pnpm", "start"]
