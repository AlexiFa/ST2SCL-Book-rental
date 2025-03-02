# ST2SCL-Book-rental

Microservice Project with kubernetes

## TODO (maybe)

- [ ] GitHub actions

## Steps

### Books Catalogue service

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
kubectl apply -f global-deployment.yml -n project
```

You can get the url of the service with

```bash
minikube service books-catalogue-service -n project --url
```

or you can forward the port

```bash
kubectl port-forward service/books-catalogue-service -n project 8080:8080
```

### Database service

Build the database image (If on windows, you need change CRLF to LF in the entrypoint.sh file)

```bash
cd postgres
docker build -t books-db .
```

Or use the image I pushed to docker hub

```bash
docker pull alex6f/books-db:1
```

---

#### Deploy the database to the kubernetes cluster

##### Secret

```bash
kubectl apply -f postgres-secret.yml -n project
```

##### Storage

```bash
kubectl apply -f postgres-storage.yml -n project
```

##### Deployment

```bash
kubectl apply -f postgres-deployment.yml -n project
```