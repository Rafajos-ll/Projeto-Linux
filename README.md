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
