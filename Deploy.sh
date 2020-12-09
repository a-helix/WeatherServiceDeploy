#!/bin/bash
if [[ -d /src/ ]]
then
    echo "Deleting old binaries..."
	rm -r WeatherApiTelegramBot
	echo "Done"
fi
mkdir src

sources=(
	WeatherSubscribeService
	WeatherApiTelegramBot
	WeatherAPI
)

for i in ${sources[@]}; 
do 
	if [[ -d ~/${i}/ ]]
	then
		echo "Deleting "${i}"..."
		rm -r i
		echo "Done."
	fi
	echo "Cloning "${i}"..."
	git clone --recursive git@github.com:a-helix/${i}.git
	echo "Done."
	cd WeatherSubscribeService
	bash build.sh
	echo "Copying "${i}" binaries..."
	cd ..
	cp ~/${i}/src/ ~/src/${i}_src/
	echo "Done."
	sudo rm -r ${i}
done

docker-compose -up

