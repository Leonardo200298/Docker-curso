#Indica el nombre de la imagen
FROM ubuntu

#Sirve para ejecutar comandos dentro del contenedor
RUN apt-get update && apt-get install -y \
    nano\
    curl\
    $PYTHON

#tambien podemos definir variables de entorno
ENV EJEMPLO = hola 

#son como las variables de entorno pero puedes usarlas para que se ejecuten en el RUN
#eso si a la hora de hacer el build se debera usar un flag especial
ARG PYTHON=python3

#La directiva COPY nos va a permitir copiar un archivo o una carpeta
#hacia un path del contenedor 
COPY . /app

WORKDIR /app

#para ejecucion de servicios
CMD [ "nginx", "-g", "daemon off;" ]