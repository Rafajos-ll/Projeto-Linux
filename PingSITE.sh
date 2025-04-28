#!/bin/bash

# URL do site a checar
URL="http://localhost"

# Webhook do Discord 
DISCORD_WEBHOOK="https://discord.com/api/webhooks/"

# Obtem data/hora atual
DATA=$(date '+%Y-%m-%d %H:%M:%S')

# Verifica status HTTP do site
STATUS=$(curl -o /dev/null -s -w "%{http_code}" "$URL")

# Checa se o site está fora do ar (qualquer código diferente de 200)
if [ "$STATUS" -ne 200 ]; then
    echo "$DATA - Site está OFFLINE! (Status: $STATUS)"

    # Monta mensagem para o Discord
    MENSG="🚨 [$DATA] ALERTA: O site está fora do ar! Status HTTP: $STATUS"

    # Envia alerta via Webhook
    curl -H "Content-Type: application/json" \
         -X POST \
         -d "{\"content\": \"$MENSG\"}" \
         "$DISCORD_WEBHOOK"
else
    echo "$DATA - Site OK (Status: $STATUS)"
fi
