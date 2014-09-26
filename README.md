devbox
======

Tool to manage disposable development environments (devboxes)
Devboxes are docker containers starting into a shell.
All devboxes are 'namespaced' in docker via a common name prefix ($DOCKER_PREFIX).

A custom docker image with all your settings is recommended.

requirements
------------

* docker
* jq

installation
------------

* optional: load `bash_complete` in your bash profile

configuration
-------------

copy `devboxrc` to `~/.devboxrc` and adjust to your needs

examples
--------

normal usage:

    devbox create foo
    # after quitting the shell
    devbox list
    devbox rm foo

other image:

    devbox create foo debian/testing

remove devbox after shell quits:

    devbox create foo --rm

build and use custom devbox

    docker build -t "mydevbox_image" https://github.com/<name>/<repo>.git # or local path
    devbox create my mydevbox_image
