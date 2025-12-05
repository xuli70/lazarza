# Imagen ligera de nginx para servir archivos estáticos
FROM nginx:alpine

# Copiar archivos del dashboard
COPY index.html /usr/share/nginx/html/
COPY styles/ /usr/share/nginx/html/styles/
COPY scripts/ /usr/share/nginx/html/scripts/

# Configuración personalizada de nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exponer puerto 80
EXPOSE 80

# nginx se ejecuta en primer plano
CMD ["nginx", "-g", "daemon off;"]
