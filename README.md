# Projeto-Linux 

 Nesse projeto eu configuro um site e monitoro se ele está online ou offline 
 
## Instalação do Ubuntu 

 Primeiro de tudo utilizei do powershell do windows para instalar o ubuntu.

 ```bash
 wsl --install 
```
 Permite a instalação de distribuiçoes diversas no windows
## No Ubuntu

```bash
sudo apt install nginx
```
Para baixar o host do nosso servidor na web

Agora vamos utilizar o seguinte comando 
```bash
sudo nano index.html
```
dentro do diretorio /var/www

 ## Script do Site 
```html
 <!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Site Exemplo com Nginx</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>🚀 Servidor Nginx em funcionamento!</h1>
        <p>Se você está vendo esta página, seu servidor Nginx está configurado corretamente!</p>
        <p>Esta página está sendo servida por <strong>Nginx</strong>.</p>
    </div>
</body>
</html>
```
para estilizar criei um outro arquivo chamado Style.css segue o script do mesmo:
 
```css

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    color: #333;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 800px;
    margin: 100px auto;
    background: white;
    padding: 40px;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    text-align: center;
}

h1 {
    color: #009578;
}
```
para testar a sintaxe do arquivo de configuração nginx você pode utilizar este comando:
```bash
sudo nginx -t
```
## Como configurar o webhook pelo Discord

1.Crie um servidor aonde queira receber as mensagens
2.Clique no nome do canal no seu servidor e va em "Editar canal"
3.vã em integrações  → webhooks  → Novo webhook
4.Dê um nome como ("Alerta de Site"),escolha o canal e copie a URL do webhook

## Script para checar o SITE
```bash
#!/bin/bash

# URL do site a checar
URL="http://localhost"

# Webhook do Discord
DISCORD_WEBHOOK="https://discord.com/api/webhooks/
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
 ```
Aqui nesse script ele verifica se o site esta online.(checkando se 200 quer dizer ok) se ocorrer de qualquer numero ser diferente de 200 ele envia a mensagem via webhook do Discord.

## Comando para instalar o cron
```bash
sudo apt install cron
```
Coloquei como instalar o cron caso não venha instalado

## Script do cron para pingar se esta off
```bash
* * * * * /home/rafas/PingSITE.sh >> /var/log/monitor_site.log 2>&1
```
aqui ele verifica de 1 em 1 minuto e salva tambem os arquivos na pasta que denominei de monitor_site.log no diretorio /var/log
