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