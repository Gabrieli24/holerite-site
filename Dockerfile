FROM php:8.2-cli

# Instala extensões e dependências
RUN apt-get update && \
    apt-get install -y unzip sqlite3 libsqlite3-dev && \
    docker-php-ext-install pdo pdo_sqlite

# Copia os arquivos da aplicação
COPY . /app
WORKDIR /app

# Porta padrão
EXPOSE 80

# Inicia o servidor embutido do PHP
CMD ["php", "-S", "0.0.0.0:80", "-t", "/app"] 
