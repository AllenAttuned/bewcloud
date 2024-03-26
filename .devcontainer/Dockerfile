# Start with Ubuntu base image
FROM ubuntu:latest

# Install curl
RUN apt-get update && apt-get install -y curl unzip

# Use the standard Deno install script
RUN curl -fsSL https://deno.land/x/install/install.sh | sh

# Make sure deno is available in the PATH
ENV DENO_INSTALL="/root/.deno"
ENV PATH="$DENO_INSTALL/bin:$PATH"

# Expose port 8080 since Deno applications usually run on this port
EXPOSE 8080