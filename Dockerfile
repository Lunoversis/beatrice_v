# Use an official Debian-based image with Free Pascal installed
FROM debian:bullseye-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    fpc \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy your Pascal source code into the container
COPY ./src /app

# Set the entrypoint to FPC (you can change this depending on your needs)
CMD ["fpc", "test.pas"]
