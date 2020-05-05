---
layout: post
title: Proxy API requests in development
date: 2020-05-05T21:01:36+02:00
tags: javascript
---

Create React App [proxies API requests in development](https://create-react-app.dev/docs/proxying-api-requests-in-development/).

## Alternatives

### NGINX

I've previously used NGINX to serve as a proxy. The following nginx configuration illustrates a setup where you bind frontend and backend services to port 8080 on the local machine:

```config
upstream api-service {
  server	127.0.0.1:5000;
}
upstream frontend-service {
  server	127.0.0.1:3000;
}

server {
  listen       8080;
  server_name  localhost;


  location / {
    proxy_pass http://frontend-service;
    proxy_redirect off;
  }

  location /api {

    rewrite ^/api/?(.*) /$1 break;

    proxy_pass http://api-service;
    proxy_redirect off;
  }
}
```

You can avoid having NGINX installed by using [docker-compose.yml](https://docs.docker.com/compose/compose-file/):

```yaml
  nginx:
    image: nginx
  volumes:
    - ./nginx.conf:/etc/nginx/nginx.conf:ro
  ports:
    - "8080:8080"
```

The main reason to go with NGINX is the available documentation compared with the other alternatives.

### Envoy

Envoy is a new kid on the block. It has some features around HTTP/2 and possibility for more advanced configuration. In order to use some of the features you might need to dig through github issues and envoy source code. Though since envoy has type specification for the configuration, you should be able to get a better experience if you use something like [skycfg](https://skycfg.fun/) to avoid yaml-overload.

In order to get to know envoy you probably want to start out simple with [these docs](https://www.envoyproxy.io/learn/on-your-laptop).

### IIS

If you instead work on a Windows machine you can use IIS as a proxy. Hanselman has a [nice introduction](https://www.hanselman.com/blog/ASPNETMVCAndTheNewIIS7RewriteModule.aspx). When in a Windows shop you generally want to go with IIS for webserver and proxy needs.

## How has it been useful

In most of the recent projects I've worked in there isn't a mix of frontend and backend. Some of the people work as frontend specialists and are more effective when they can work in a known environment (operating system, editor, et.c.). By having a remote hosted test service you can let frontend specialists focus on clientside work. There is a lot of complexity in modern frontend development when writing JavaScript applications with modern styling making it difficult to be master of all.
