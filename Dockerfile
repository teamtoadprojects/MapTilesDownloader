FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    python3-dev \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-pip \
    libopenjp2-7-dev \
    libtiff6 \
    libjpeg-dev

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

RUN pip3 install -r ./src/requirements.txt

WORKDIR /app/src

ENTRYPOINT ["python3", "server.py"]
