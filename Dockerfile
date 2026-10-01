# Primera etapa 
FROM python:3.10 AS builder

RUN mkdir /src
COPY requirements.txt /src

# Segunda etapa
FROM python:3.10-slim

# Copiar de la primera etapa las dependencias 
COPY --from=builder /src /src

# Instalar dependencias
WORKDIR /src
RUN pip install --no-cache-dir -r requirements.txt

# Iniciar fastapi
COPY main.py /src
WORKDIR /src
CMD [ "uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "9300" ]