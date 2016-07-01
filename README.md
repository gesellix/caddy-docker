# Caddy
The Caddy HTTP/2 web server in Docker

## Usage

Given a directory with your Caddyfile and your static files, this Dockerfile will be all you need:

````
FROM gesellix/caddy
COPY ./ /site/
````

By default, port 8080 is exposed, so you should consider to bind to that port inside the Docker container. See the example Caddyfile.

The default image already ships with a minimal Caddyfile to let you access files inside the `/site` directory of the Docker container. If that minimal config is enough for your needs, you can skip your own Dockerfile and simply run:

````
docker run --rm -it -v `pwd`:/site -p 8080:8080 gesellix/caddy
````
