# Base: Python 3.12 para Windows Server Core LTSC 2019
FROM python:3.12.10-windowsservercore-1809

# Definir o diretório de trabalho dentro do container
WORKDIR /app

# Copiar o arquivo de requirements
COPY requirements.txt .

# Instalar as dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todo o restante do código
COPY . .

# Expor a porta usada pelo Streamlit
EXPOSE 8501

# Comando para rodar o app Streamlit
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
