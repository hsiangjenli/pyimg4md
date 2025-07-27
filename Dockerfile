FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

# Install Node.js and npm
RUN apt-get update &&     apt-get install -y nodejs npm &&     rm -rf /var/lib/apt/lists/*

# Install picgo
RUN npm install -g picgo

# Copy application code
COPY . /app
WORKDIR /app

# Install Python dependencies
RUN uv pip install --system -r requirements.txt
RUN uv pip install --system -e .
