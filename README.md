# Infrastructure

## Создание volumes

Необходимо создать два volumes mongo_data и pg_data
```bash
docker volumes create mongo_data
docker volumes create pg_data
```

## Запуск
```bash
docker-compose build
docker-compose up
```
