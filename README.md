# mapped-uid-docker container

A basic container that matches your userid / groupid inside the container at
runtime.

## The Problem

There are times when you want to container to run and generate some files, then
you discover when you leave the container that those files are owned by root!!
For me this often happens if I want to use a container as part of my dev
workflow to build/compile some files.

You could modify the container when it's built to have a user with the same
uid/gid as yourself, but then we lose on portability. There's an extensive
thread discussing this topic here https://github.com/moby/moby/issues/2259

This container solves the problem by modifying the user in the container at
runtime, based on a provided bind mount.

## Usage

This container requires you to mount a file belonging to your user to `/tim`.
Recommend doing this with `mktemp`

```sh
docker run --volume `mktemp`:/tim ...
```

### Example

Let's say you want to run a container to do some process and output a file in
the current directory. Do this with:

```sh
docker run --rm -it \
    -v `mktemp`:/tim:ro \
    -v `pwd`:/code \
    -w /code \
    graham42/mapped-uid-docker \
    echo "did it work" > somefile
```

You should see now that this file belongs you, not root.

```sh
ls -l somefile
# -rw-rw-r-- 1 youruser youruser 0 Sep 12 14:29 somefile
```

## License

MIT License

Copyright (c) 2017 Graham McGregor

See LICENSE file.
