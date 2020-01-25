# Deploy Genie.jl

## Deploy on server

### Change domain and email

docker-compose.yml
```
DOMAIN: example.com # Change this
EMAIL: example@example.com # Change this
```

### Deploy
```shell
docker-compose up -d
```

## On local

```shell
docker-compose -f .\docker-compose.dev.yml up -d  
```