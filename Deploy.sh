#!/bin/bash

git clone --recursive git@github.com:a-helix/WeatherSubscribeService.git
cd WeatherSubscribeService
bash build.sh
cd..
sudo rm -r WeatherSubscribeService

git clone --recursive git@github.com:a-helix/WeatherApiTelegramBot.git
cd WeatherApiTelegramBot
bash build.sh
cd..
sudo rm -r WeatherApiTelegramBot

git clone --recursive git@github.com:a-helix/WeatherAPI.git
cd WeatherAPI
bash build.sh
cd..
sudo rm -r WeatherAPI

docker-compose -up

