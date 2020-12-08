#!/bin/bash
if [[ -d /src/ ]]
then
    echo "Deleting old binaries..."
	rm -r WeatherApiTelegramBot
	echo "Done"
fi
mkdir src

if [[ -d /WeatherSubscribeService/ ]]
then
    echo "Deleting WeatherSubscribeService..."
	rm -r WeatherSubscribeService
	echo "Done."
fi
echo "Cloning WeatherSubscribeService..."
git clone --recursive git@github.com:a-helix/WeatherSubscribeService.git
echo "Done."
cd WeatherSubscribeService
echo "Building WeatherSubscribeService..."
bash build.sh
echo "Done."
echo "Copying binaries..."
cd ..
cp /WeatherSubscribeService/src/ /src/WeatherSubscribeService_src/
echo "Done."
sudo rm -r WeatherSubscribeService

if [[ -d /WeatherApiTelegramBot/ ]]
then
    echo "Deleting WeatherApiTelegramBot folder"
	rm -r WeatherApiTelegramBot
fi
git clone --recursive git@github.com:a-helix/WeatherApiTelegramBot.git
cd WeatherApiTelegramBot
bash build.sh
cd..
sudo rm -r WeatherApiTelegramBot

if [[ -d /WeatherAPI/ ]]
then
    echo "Deleting WeatherAPI folder"
	rm -r WeatherAPI
fi
git clone --recursive git@github.com:a-helix/WeatherAPI.git
cd WeatherAPI
bash build.sh
cd..
sudo rm -r WeatherAPI

docker-compose -up

