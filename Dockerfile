FROM node:20

# Включаем поддержку pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Задаём рабочую директорию
WORKDIR /app

# Копируем файлы проекта
COPY . .

# Устанавливаем зависимости
RUN pnpm install --frozen-lockfile

# Собираем проект
RUN pnpm build

# Указываем порт
EXPOSE 5678

# Запускаем n8n
CMD ["pnpm", "start"]
