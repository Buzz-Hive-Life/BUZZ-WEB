# BUZZ-WEB

Standalone static deployment of the Buzz (Nostr) member-facing web client.

This repository contains a **prebuilt** Vite/React/Tauri web bundle (the `dist/`
output of `/opt/data/buzz-src/desktop`) plus a minimal Dockerfile that serves it
with nginx. No build step runs on the server.

## Layout

- `dist/` — the prebuilt static bundle (index.html, assets/, onboarding/, ...).
- `nginx.conf` — static file server config with SPA fallback, asset caching and gzip.
- `Dockerfile` — `nginx:alpine` serving `dist/` on port 8080.

## Deploying

Railway builds the Dockerfile remotely and routes the generated domain to port 8080.

## Notes

- Deployed as its own Railway service in its own Railway project, deliberately
  isolated from the live HIVE-PWA member page so it cannot affect it.
- The client's `<title>` is set at runtime by the application; the raw
  `index.html` ships an empty `<title></title>`.
