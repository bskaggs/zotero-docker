# zotero-docker
A docker image for Zotero standalone

The .zotero directory is stored in a data volume. For persistance between runs of this image, you can chose to create a data-only container, or mount a specific directory from the host.

## Data-Only Container
If you want to create a data-only container, run:

`docker create -v /home/zotero/.zotero --name zotero_data bskaggs/zotero`

Then, to launch Zotero with the data-only container using your host OS's current X11 display, run: 

`docker run -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --volumes-from zotero_data bskaggs/zotero`

## Host Directory
If you choose instead to map in a directory from your host OS, run:

`docker run -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /full/path/to/your/zotero/data:/home/zotero/.zotero bskaggs/zotero`

This image currently assume that your user and group id are 1000.  If this isn't the case, you need to rebuild the docker image yourself to change them.
