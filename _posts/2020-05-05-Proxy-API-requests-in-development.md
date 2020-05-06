---
layout: post
title: Proxy API requests in development
date: 2020-05-05T21:01:36+02:00
tags: javascript
---

## The road towards frontend and backend separation

Or at least why you should care about proxies when dealing with web applications.

### Around 2005

I studied computer science at Lund university. One of the professors warned us about two things: JavaScript and Sharepoint. The web programming I got aquinted with at university was mainly Java servlets and Python CGI apps.

I started working at MaCom in Denmark as a system developer. The amount of JavaScript needed could easily fit in a small single file. Most of the application was written in asp.net using aspx and c#. Pages written in aspx is a mix of HTML and c# code and composed as into components called "pages" and "user controls".

There was no need for a separation of frontend and backend since most of the code executed on the server.

### Around 2010

At Lundalogik I was part of a team writing a web CRM system. The amount of code in the codebase was around half c# and half JavaScript. In order to structure the code we had a large amount of JavaScript files. The server parts was developed in tandem with the clientside parts. As we expanded the team we got a frontend specialist that wanted to focus on JavaScript only. From that persons point of view it was a hassle to be forced to use Visual Studio to edit the frontend code.

If you instead work on a Windows machine you can use IIS as a proxy. Hanselman has a [nice introduction](https://www.hanselman.com/blog/ASPNETMVCAndTheNewIIS7RewriteModule.aspx). When in a Windows shop you usually go with IIS for webserver and proxy needs. Since there wasn't any need for any proxy-configuration we used IIS only to rewrite urls.

### Around 2017

At the startup Boolean & Brace we worked in two teams, backend and frontend. The codebase was split up into backend and frontend. The structure of the frontend was completely separated from the backend. The frontend code was structured into React components where some have routes and some components are used from other components. This mimics more the experience of developing desktop applications and was the goal of aspx (before JavaScript had matured).

Most of the frontenders used an Azure hosted test environment. For local dev environment we used NGINX proxy to different services.

The following nginx configuration illustrates a setup where you bind frontend and backend services to port 8080 on the local machine:

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

Our setup was for the frontenders to use CORS to be able to develop against remotely hosted API. The main benefit was that they didn't need to setup services or nginx locally.

### Around 2019

At Decerno I'm again working with teams dealing with React frontend applications. The new thing I've seen so far has been the use of an integrated proxy in the frontend code to [proxy API requests in development](https://create-react-app.dev/docs/proxying-api-requests-in-development/). This means that as a frontend developer you only need to install browser, NodeJS and an editor. The nice thing about this setup is that you also get rid of the CORS-requests you otherwise get if you have frontend and backend hosted separately.

## How has it been useful

In most of the recent projects (since 2017) I've worked in there isn't a mix of frontend and backend. Some of the people work as frontend specialists and are more effective when they can work in a known environment (operating system, editor, et.c.). By having a remote hosted test service you can let frontend specialists focus on clientside work. There is a lot of complexity in modern frontend development when writing JavaScript applications with modern styling making it difficult to be master of all. As can be seen you are not forced to adopt one technology to use the concept if you want your pure frontend developers to be happy.
