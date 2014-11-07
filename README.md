# docker-redis-benchmark

[Redis](http://redis.io/) is an open source key-value store that functions as a data structure server. 
But how fast is it?
This is a minimal [Docker](https://www.docker.com) image that eases running the redis-benchmark.

## Usage

This docker image is available as a [trusted build on the docker index](https://index.docker.io/u/clue/redis-benchmark/),
so there's no setup required.
Using this image for the first time will start a download automatically.
Further runs will be immediate, as the image will be cached locally.

This image is linked against a running redis container instance.
Because of this, you'd likely want to start an instance similar to this:

```bash
$ docker run -d --name MyRedisContainer redis
```

The recommended way to run this container looks like this:

```bash
$ docker run -it --rm --link MyRedisContainer:redis clue/redis-benchmark
```

This is a rather common setup following docker's conventions:

* `-it` will run an interactive session that can be terminated with CTRL+C
* `--rm` will run a temporary session that will make sure to remove the container on exit
* `--link {NameOfContainerToBenchmark}:redis` has to be passed to address the redis instance to run the benchmark against
* `clue/redis-benchmark` the name of this docker image

### Help

You can supply any number of arguments that will be passed through unmodified.

```bash
$ docker run -it --rm clue/redis-benchmark --help
```
