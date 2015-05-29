docker-envconsul
================

A docker container for envconsul, available via ```PATH``` at ```/usr/bin```. Intended for use as a base image for applications wanting to use envconsul.

Published to the docker registry as ```mhamrah/envconsul```

There is also a launcher script in the path, ```envconsul-launch```, which does a few things for you:

* Sets the ```-consul``` flag to the ```$CONSUL``` env variable if set, otherwise the gateway ip, assuming consul is running on the host computer on port 8500
* Sanitizes and Upcases keys
* Sets a wait timeout range of 2 to 8 seconds for rolling updates after a key change
* Falls back with a warning to your command line parameter should consul not be available, running the second command line argument passed to the container.

You can use ```envconsul-launch``` the same way as ```envconsul```. Command line parameters are passed via ```$*```.

```envconsul-launch``` is set as the entrypoint, so you can simply pass in your key and command like so:

```
docker run -i -t --rm mhamrah/envconsul CONSUL_KEY env
```


