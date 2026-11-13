# Use a Python base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Install necessary dependencies including git
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

# Copy the contents of the project to the /app directory
COPY . /app

# Ensure the entrypoint script exists and is executable
# (sed strips Windows line endings, which break bash scripts)
RUN sed -i 's/\r$//' /app/.github/scripts/*.sh && \
    chmod +x /app/.github/scripts/entrypoint.sh /app/.github/scripts/update_readme.sh

# Set the entrypoint to the entrypoint script
ENTRYPOINT ["bash", "/app/.github/scripts/entrypoint.sh"]
