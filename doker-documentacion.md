# Documentacion de contenedores Doker de Sistemas Gestores de Base de Datos

![Imagen Doker](./img/image_ef393ec2.png)

## Contenedor de Tutorial de Docker
docker pull docker/getting-started

docker run -d -p 80:80 docker/getting-started

- -d detach (El proceso del contenedor se ejuecuta en background)
- -p (port, publish) (Mapea el puerto)
- docker/getting-started (Nombre de la imagen)

## Contenedor del DBMS MariaBD
docker pull mariadb
## Contenedor de MariaDB con volumen 
docker run --name ServerMariaDBG2  -e MARIADB_ROOT_PASSWORD=123456 \
-d -p 3345:3306 e0236 

## contenedor de MariaDB sin volumen 
docker run --name ServerMariaDBG2  -e MARIADB_ROOT_PASSWORD=123456 \
-d -v -p 3345:3306 e0236  

## Comandos Docker
| Comando | Descripción |
| :--- | :--- |
| docker pull nombre_imagen | **Descarga una imagen de DockerHub** [Docker Hub](https://hub.docker.com/) |
| docker images | **Visualizar las imagenes que se encuentran en el docker** |
