FROM nginx:alpine

# Serve the prebuilt static site (Vite/React client bundle).
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY dist/ /usr/share/nginx/html/

# Railway routes the generated domain to this port.
EXPOSE 8080
