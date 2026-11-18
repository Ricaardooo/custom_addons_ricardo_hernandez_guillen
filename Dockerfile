
FROM odoo:20.0

USER root

# Copiar nuestro módulo personalizado
COPY --chown=odoo:odoo ventas_unicah /mnt/extra-addons/ventas_unicah

# Incorporar el script de inicio
COPY start.sh /start.sh

RUN chmod +x /start.sh && chown odoo:odoo /start.sh

USER odoo

# Puerto HTTP utilizado por Render
EXPOSE 10000

ENTRYPOINT ["/bin/bash", "/start.sh"]
