# ST2SCL-Book-rental

Microservice Project with kubernetes

## Steps

Build the project

```bash
cd booksCatalogue
./gradlew build
```

Build the docker image

```bash
docker build -t books-catalogue .
```

You can use this image or the one I pushed to docker hub

```bash
docker pull alex6f/books-catalogue:1
```

Start the minikube cluster

```bash
minikube start --driver=docker
kubectl create namespace project
```

Go back to the root folder and apply the deployment to your kubernetes cluster

```bash
cd ..
kubectl apply -f global-deployment.yaml -n project
```

You can get the url of the service with

```bash
minikube service books-catalogue-service -n project --url
```

or you can forward the port

```bash
kubectl port-forward service/books-catalogue-service -n project 8080:8080
```