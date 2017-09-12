# Non-root docker container

There are times when you want to container to run an modify some files, then you
discover when you leave the container that those files are owned by root!!

...
... link issue

This container solves by modifying the user in the container at runtime.

# Usage

Let's say you want to run a container to do some process and output a file in
the current directory. Do this with:

```sh
docker run -it \
    -v `mktemp`:/tim:ro \
    -v `pwd`:/code \
    tim-alpine \
    touch /code/somefile
```

You should see now that this file belongs you, not root.

```sh
ls -l somefile
# -rw-rw-r-- 1 grahamm grahamm 0 Sep 12 14:29 somefile
```

