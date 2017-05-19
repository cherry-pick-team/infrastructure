# Infrastructure

## Создание volumes

Необходимо создать два volumes mongo_data и pg_data
```bash
docker volumes create mongo_data
docker volumes create pg_data
```

## Переменные окружения и секреты

В каждый контейнер будут добавлены переменные окружения из файла docker/.secrets
```bash
vim docker/.env
```
Также туда стоит добавлять пароли и прочую секретную информацию

## Запуск
Убедитесь что в services/music-downloader/cookies.sqlite лежит кука (мозила)
```bash
sh restart-all.sh
```
