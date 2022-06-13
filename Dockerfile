FROM node:14.17.0

COPY . .

ENV NODE_OPTIONS=--max_old_space_size=8192
ENV DATABASE_URL="postgres://doadmin:3TfPHMUJtuYznpzd@db-postgresql-blr1-07596-do-user-9368613-0.b.db.ondigitalocean.com:25060/defaultdb?sslmode=require"

ENV PORT 8080
RUN apt-get update && \
    apt-get -y install netcat && \
    rm -rf /var/lib/apt/lists/* 


RUN yarn 

RUN yarn build
  


COPY ./scripts ./scripts

EXPOSE 8080
CMD ["./scripts/start.sh"]
