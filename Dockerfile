caddy:
    image: caddy:latest
    container_name: caddy
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./configs/caddy/Caddyfile:/etc/caddy/Caddyfile
      - ./configs/caddy/data:/data
      - ./configs/caddy/config:/config
    restart: unless-stopped