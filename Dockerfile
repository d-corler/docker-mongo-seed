FROM alpine
LABEL maintainer="Damien CORLER"

# Declare workspace
WORKDIR /usr/local/docker-mongo-seed

# Install dependencies
RUN apk add --update --no-cache bash mongodb-tools

# Copy waiting script
COPY ./wait-for-it/wait-for-it.sh .
RUN chmod +x ./wait-for-it.sh

# Copy startup script
COPY ./startup.sh .
RUN chmod +x ./startup.sh

# Run this script on starting
ENTRYPOINT ["/bin/sh", "./startup.sh"]
