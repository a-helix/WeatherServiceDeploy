#!/bin/bash
cd ~
if [[ -d src/ ]]
then
    echo "Deleting old binaries..."
        sudo rm -r src
        echo "Done"
fi
sudo mkdir src
cd -

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
                sudo rm -r ${i}
                echo "Done."
        fi
        echo "Cloning "${i}"..."
        git clone --recursive git@github.com:a-helix/${i}.git
        git submodule update --init
        echo "Done."
        cd ${i}/Deploy
        bash build.sh
        echo "Copying "${i}" binaries..."
        cd ~/src
        sudo mkdir ${i}_src
        cd -
        sudo mv src ~/src/${i}/
        echo "Done."
        cd ..
        echo "Deleting leftovers."
        sudo rm -r ${i}
        echo "Done."
done

docker-compose -up
