@echo off

rmdir /s /q data logs

docker compose down -v --rmi local
