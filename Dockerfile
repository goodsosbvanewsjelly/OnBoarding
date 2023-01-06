FROM node:18-alpine AS builder

RUN mkdir -p /home/node/app
WORKDIR /home/node/app

COPY ./frontend/package.json ./frontend/package-lock.json ./
RUN npm ci

COPY ./frontend .

RUN npm run build

FROM python:3.9-slim AS runner

ENV FLASK_APP=semantle

RUN mkdir /app
WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

COPY ./requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

COPY --from=builder /home/node/app/dist /app/frontend/dist

ENTRYPOINT [ "gunicorn", "semantle:app", "--bind", "0.0.0.0:80" ]