---
layout: post
title: Running minikube on M1 and K8S tutorial
date: 2023-04-05T20:00:00+03:00
---

As previously [mentioned in the blog I use a M1 mac](https://assertfail.gewalli.se/2023/02/06/Running-SQL-Server-on-Docker-with-an-M1ARM-CPU.html).

In order to help introduce others to Kubernetes I have done some testing of the [K8S tutorial](https://kubernetes.io/docs/tutorials/kubernetes-basics/).

In order to try it out I first tried using the qemu driver for minikube. First gotcha was that the image `gcr.io/google-samples/kubernetes-bootcamp:v1` does not work on ARM natively.

## Let the Yac Shaving begin

### Running minikube in docker

In order to get around this limitation you can [run minikube in docker](https://minikube.sigs.k8s.io/docs/drivers/docker/). Either by using [colima](https://github.com/abiosoft/colima) or Docker Desktop with experimental Rosetta emulation.

```sh
minikube start --driver docker
```

Running the first part part of the tutorial works fine. You can [create a deployment](https://kubernetes.io/docs/tutorials/kubernetes-basics/deploy-app/deploy-intro/), you can [view pods and nodes](https://kubernetes.io/docs/tutorials/kubernetes-basics/explore/explore-intro/). The weird part starts when you forget that minikube is now running in a docker container instance and run:

{% raw %}

```sh
kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080
#...
export NODE_PORT="$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort }}')"
echo "NODE_PORT=$NODE_PORT"
```

{% endraw %}

Then try to do:

```sh
curl http://"$(minikube ip):$NODE_PORT"
```

[expose intro](https://kubernetes.io/docs/tutorials/kubernetes-basics/expose/expose-intro/)

Since we are not binding all of the ports for minikube docker instance, the exposed port is not bound.

Instead you can do:

```sh
minikube service kubernetes-bootcamp --url
```

to get the url to the service.

### Using qemu and building your own docker images

Since I started out with a simple qemu install I wanted to go all in the next round. I installed socket_vmnet and used:

```sh
brew install socket_vmnet
brew tap homebrew/services
HOMEBREW=$(which brew) && sudo ${HOMEBREW} services start socket_vmnet
#...
minikube start --driver qemu --network socket_vmnet
```

I then built images that uses both arm and x86:

First the Dockerfile:

```Dockerfile
FROM node:slim
EXPOSE 8080
COPY server.js .
CMD node server.js
```

based on [kubernetes bootcamp Dockerfile](https://github.com/jocatalin/bootcamp/blob/gh-pages/code/docker/Dockerfile)

server.js:

```js
var http = require('http');
var requests=0;
var podname= process.env.HOSTNAME;
var startTime;
var host;
var handleRequest = function(request, response) {
  response.setHeader('Content-Type', 'text/plain');
  response.writeHead(200);
  response.write("Hello Kubernetes bootcamp! | Running on: ");
  response.write(host);
  response.end(" | v=1\n");
  console.log("Running On:" ,host, "| Total Requests:", ++requests,"| App Uptime:", (new Date() - startTime)/1000 , "seconds", "| Log Time:",new Date());
}
var www = http.createServer(handleRequest);
www.listen(8080,function () {
    startTime = new Date();;
    host = process.env.HOSTNAME;
    console.log ("Kubernetes Bootcamp App Started At:",startTime, "| Running On: " ,host, "\n" );
});
```

based on [kubernetes bootcamp server.js](https://github.com/wallymathieu/k8s-bootcamp/blob/gh-pages/code/docker/v1/server.js)

My first instinct was to simply build the image and be done with it. But that is not as fun as going deeper. To take it further I wanted to grow the bananas to be used in the smoothie!

First I tried:

```sh
rsion='v1'
name="wallymathieu/kubernetes-bootcamp:$version"

docker buildx build -t $name ./$version -f Dockerfile --platform=linux/arm64,linux/amd64 --push && echo "Image $name built"
```

I got `Error: multiple platforms feature is currently not supported for docker driver`.

When running The buildx ls environment looked like it could handle amd64:

```sh
> docker buildx ls
NAME/NODE       DRIVER/ENDPOINT STATUS  BUILDKIT PLATFORMS
default *       docker
  default       default         running 20.10.23 linux/arm64, linux/amd64, linux/riscv64, linux/ppc64le, linux/s390x, linux/386, linux/arm/v7, linux/arm/v6
desktop-linux   docker
  desktop-linux desktop-linux   running 20.10.23 linux/arm64, linux/amd64, linux/riscv64, linux/ppc64le, linux/s390x, linux/386, linux/arm/v7, linux/arm/v6
```

I then found that others had solved this issue by simply creating a [new buildx multiarch with docker container driver](https://forums.docker.com/t/error-multiple-platforms-feature-is-currently-not-supported-for-docker-driver/124811/11):

```sh
docker buildx create --name multiarch --driver docker-container --use
```

I could then build the images and push them to docker hub, as can be [seen here](https://hub.docker.com/repository/docker/wallymathieu/kubernetes-bootcamp/general).

Now I could continue on the kubernetes bootcamp tutorial using the custom images.

So instead of using the default 7 year old image (gcr.io/google-samples/kubernetes-bootcamp:v1) I wanted my shining new multi platform image built using the same code as in [jocatalin/kubernetes-bootcamp](https://github.com/jocatalin/bootcamp):

```sh
kubectl create deployment kubernetes-bootcamp --image=wallymathieu/kubernetes-bootcamp:v1
```

And instead of [upgrade your app](https://kubernetes.io/docs/tutorials/kubernetes-basics/update/update-intro/) using the old image, I used the custom built v2 image:

```sh
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=wallymathieu/kubernetes-bootcamp:v2
```

### Sidenote

One thing that struck me was that why did they use `gcr.io/google-samples/kubernetes-bootcamp:v1` instead of `jocatalin/kubernetes-bootcamp:v1`, I did get my answer when I tried using that image and could not connect to port 8080 on that image since the [code assumes port 8081](https://github.com/jocatalin/bootcamp/blob/gh-pages/code/docker/v1/server.js#L15) while the [dockerfile says port 8080](https://github.com/jocatalin/bootcamp/blob/gh-pages/code/docker/Dockerfile) perhaps to have a reason to patch the image?

## Conclusion

Successfully shaved the Yak! I got the tutorial working and only had to do a few smallish things in order to finish it.
