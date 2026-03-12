FROM node:22
ENV NODE_OPTIONS="--max-old-space-size=4096"
ENV HOST="0.0.0.0"

RUN npm install -g pnpm
RUN git clone https://github.com/openclaw/openclaw.git /app
WORKDIR /app
RUN pnpm install --child-concurrency=1 --network-concurrency=1

EXPOSE 10000
CMD ["node", "scripts/run-node.mjs", "gateway", "--port", "10000", "--host", "0.0.0.0", "--allow-unconfigured"]
