# Use a lightweight base image
FROM alpine:latest
MAINTAINER Amal.Dev@catalyzrs.com
# Set the command to execute when the container starts
CMD ["echo", "Hello, Docker World!"]
EXPOSE 80


