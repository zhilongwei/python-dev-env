# Use Python 3.11 slim as the base (which defaults to root)
FROM python:3.11-slim

# Environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8 \
    PIP_NO_CACHE_DIR=1

# Install system dependencies including Git
RUN apt-get update && apt-get install -y \
build-essential \
python3-dev \
libatlas-base-dev \
libopenblas-dev \
liblapack-dev \
gfortran \
git \
curl \
&& rm -rf /var/lib/apt/lists/*

# Create a working directory
WORKDIR /workspace

# Create a virtual environment under /workspace/.venv
RUN python -m venv /workspace/.venv

# Make the venv active for subsequent steps
ENV VIRTUAL_ENV=/workspace/.venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Copy requirements
COPY requirements.txt .

# Install dependencies (with an option to silence the root warning)
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Default command
CMD ["bash"]
