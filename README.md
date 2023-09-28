# ScratchyGPIO : a Python3-Scratch 1.4 handler for Raspberry Pi

It replaces the original Python 2 version and is a fork of that project

This is the source of a Raspberry Pi GPIO handler for Scratch.
It acts as a go-between between the original Scratch 1.4 and the GPIO pins and lets you use simple Scratch broadcasts such as "Pin11On"
or "AllOff" to allow you to control electronic devices such as LEDs attached to the pins

It understands a number of variable names such as Power e.g. "set Power11 to 50" which will effectively set Pin11
to half power "set Power12 to 100" will set Pin12 to full power.

It also has support for cheap, 5 wire stepper motors and cheap 3.3V ultrasonic sensor boards

The code is being actively developed but the code in this folder is considered stable.  The dev branch contains my day to day
changes.

## Usage

I maintain full download, install and usage instructions in this blog
https://simplesi.net/scratchgpio/ - please follow the updated instructions to install ScratchyGPIO instead of the old ScratchGPIO 

The code and installer in this folder are the same version as the ones linked to in the blog.


## Issues & Fixes

Please file any issues and feel free to submit pull requests

Note:@bennuttall and @mattvenn have collaborator access rights in case of contact issues with myself

