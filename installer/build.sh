#!/bin/bash
#copy files to payload folder
#7Feb19 Add in S3GPIOBeta1
#20Aug19 add in S3GPIO Desktop
#21Aug19 reinstate copy s3gpi files to payload
#28Sep2023 start migration to ScratchyGPIO based on Python 3

SGHVER=''
echo $SGHVER
echo $HOME
echo $SGHVER > $HOME/sygpio/installer/payload/SGHVER.txt

cp $HOME/sygpio/scratchygpio_handler.py $HOME/sygpio/installer/payload
cp $HOME/sygpio/Adafruit_I2C.py $HOME/sygpio/installer/payload
cp $HOME/sygpio/sgh_servod $HOME/sygpio/installer/payload
cp $HOME/sygpio/killsgh.sh $HOME/sygpio/installer/payload
cp $HOME/sygpio/nunchuck.py $HOME/sygpio/installer/payload
cp $HOME/sygpio/meArm.py $HOME/sygpio/installer/payload
cp $HOME/sygpio/kinematics.py $HOME/sygpio/installer/payload
cp $HOME/sygpio/dht11.py $HOME/sygpio/installer/payload
cp $HOME/sygpio/wstosgh.py $HOME/sygpio/installer/payload
cp $HOME/sygpio/websocket_server.py $HOME/sygpio/installer/payload
cp $HOME/sygpio/sgh_piGPIOExtension.js $HOME/sygpio/installer/payload

cp $HOME/sygpio/dot.py $HOME/sygpio/installer/payload
cp $HOME/sygpio/btcomm.py $HOME/sygpio/installer/payload
cp $HOME/sygpio/app.py $HOME/sygpio/installer/payload
cp $HOME/sygpio/mock.py $HOME/sygpio/installer/payload
cp $HOME/sygpio/threads.py $HOME/sygpio/installer/payload
cp $HOME/sygpio/utils.py $HOME/sygpio/installer/payload

cp $HOME/sygpio/sgh_*.py $HOME/sygpio/installer/payload

cp $HOME/sygpio/S3GPIOServer.py $HOME/sygpio/installer/payload
cp $HOME/sygpio/ca.* $HOME/sygpio/installer/payload


rm -rf $HOME/sygpio/installer/payload/mcpi
mkdir -p $HOME/sygpio/installer/payload/mcpi
cp $HOME/sygpio/mcpi/* $HOME/sygpio/installer/payload/mcpi

rm -rf $HOME/sygpio/installer/payload/S3GPIOExtension
mkdir -p $HOME/sygpio/installer/payload/S3GPIOExtension
cp $HOME/sygpio/S3GPIOExtension/* $HOME/sygpio/installer/payload/S3GPIOExtension

cp $HOME/sygpio/S3GPIO.desktop $HOME/sygpio/installer/payload
cp $HOME/sygpio/s3gpio.sh $HOME/sygpio/installer/payload

cp $HOME/sygpio/S3DGPIOdtop.desktop $HOME/sygpio/installer/payload
cp $HOME/sygpio/s3dgpiodtop.sh $HOME/sygpio/installer/payload

cd $HOME/sygpio/installer/payload
tar -cf ../payload.tar ./* #tar all the payload files
cd ..

if [ -e "payload.tar" ]; then
    gzip -f payload.tar #gzip the payload files

    if [ -e "payload.tar.gz" ]; then
        cat decompress.sh payload.tar.gz > install_scratchygpio${SGHVER}.sh # bolt on decompress script
    else
        echo "payload.tar.gz does not exist"
        exit 1
    fi
else
    echo "payload.tar does not exist"
    exit 1
fi
chmod +x install_scratchygpio${SGHVER}.sh #make install script executeable
echo "install_scratchygpio"$SGHVER".sh created"
cp install_scratchygpio${SGHVER}.sh $HOME/sygpio #copy installer to main folder
cd $HOME/sygpio

exit 0
