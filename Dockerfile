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
    latexmk \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-science \
    dvipng \
    ghostscript \
    cm-super \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set global Matplotlib settings in matplotlibrc
RUN mkdir -p /etc/matplotlib && echo "\
text.usetex: True\n\
font.family: serif\n\
font.size: 10\n\
text.latex.preamble: \\usepackage{amsmath,amssymb,bm,siunitx}\n\
" > /etc/matplotlib/matplotlibrc

# Ensure Matplotlib uses this configuration
ENV MATPLOTLIBRC="/etc/matplotlib"

# Create a working directory
WORKDIR /workspace

# Create a virtual environment under /opt/venv
RUN python -m venv /opt/venv

# Make the venv active for subsequent steps
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Copy requirements
COPY requirements.txt .

# Install dependencies (with an option to silence the root warning)
RUN pip install --upgrade pip && \
    pip install -r requirements.txt \
    && pip install ipykernel \
    && python -m ipykernel install \
         --prefix=$VIRTUAL_ENV \
         --name python-dev \
         --display-name "Python (devcontainer)"

# Default command
CMD ["bash"]
