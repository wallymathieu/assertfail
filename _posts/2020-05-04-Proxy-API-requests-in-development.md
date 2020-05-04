---
layout: post
title: Proxy API requests in development
date: 2020-05-04T21:01:36+02:00
tags: javascript
---

## Usage

One of the nice things my coworkers showed me was a tool to [proxy API requests in development](https://create-react-app.dev/docs/proxying-api-requests-in-development/).

### NGINX

I've previously used NGINX to serve as a development proxy. The following nginx configuration illustrates a setup where you bind two different services to port 80 on the local machine:

```config
worker_processes  1;

events {
  worker_connections  1024;
}


http {
  include       mime.types;
  default_type  application/octet-stream;
  sendfile        on;
  keepalive_timeout  65;
  proxy_set_header    Host             $host;
  proxy_set_header    X-Real-IP        $remote_addr;
  proxy_set_header    X-Forwarded-For  $proxy_add_x_forwarded_for;
  proxy_set_header    X-Client-Verify  SUCCESS;
  proxy_set_header    X-Client-DN      $ssl_client_s_dn;
  proxy_set_header    X-SSL-Subject    $ssl_client_s_dn;
  proxy_set_header    X-SSL-Issuer     $ssl_client_i_dn;
  proxy_read_timeout 30s;
  proxy_connect_timeout 30s;
  proxy_http_version 1.1;
  
  server {
    listen       80;
    server_name  svc1.company.*;
    location / {
      proxy_pass          http://localhost:8112;
    }
  }
  server {
    listen       80;
    server_name  svc2.company.*;
    location / {
      proxy_pass          http://localhost:8113;
    }
  }
  include servers/*;
}

```

So then your hosts file would be something like:

```config
127.0.0.1	svc1.api.test
::1         svc1.api.test

127.0.0.1	svc2.api.test
::1         svc2.api.test
```

### Docker compose

You can avoid having an installed NGINX by using [docker-compose.yml](https://docs.docker.com/compose/compose-file/):

```yaml
  nginx:
    image: nginx
  volumes:
    - ./nginx.conf:/etc/nginx/nginx.conf:ro
  ports:
    - "80:80"
```

### IIS

If you instead work on a Windows machine you can use IIS as a proxy.

## When can it be of use

When your system is composed of multiple services

## How has it been of use

Simplified local development

