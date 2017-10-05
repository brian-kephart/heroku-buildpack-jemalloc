# heroku-buildpack-jemalloc

I am a Heroku buildpack that installs
[jemalloc](http://www.canonware.com/jemalloc/) into a dyno slug.

This buildpack is based on the Heroku-16 stack. Older stacks are not supported.

This repo was originally forked from [https://github.com/mojodna/heroku-buildpack-jemalloc](https://github.com/mojodna/heroku-buildpack-jemalloc). That buildpack requires additional user configuration that this one does not. If you happen to be migrating from that buildpack to this one, make sure not to set `LD_PRELOAD` in Heroku config or use `jemalloc.sh` in your Procfile.

## Using

```bash
heroku buildpacks:add --index 1 https://github.com/brian-kephart/heroku-buildpack-jemalloc.git
git push heroku master
```

## Building

This uses Docker to build against a [Heroku stack image](https://github.com/heroku/stack-images). Make sure you have Docker running before building, then run:

```bash
make
```

Artifacts will be dropped in `dist/`.  See `Dockerfile`s for build options.

## Known Issues/Concerns
This buildpack uses the `LD_PRELOAD` environment variable to use jemalloc for all commands run on all dynos. If you need `LD_PRELOAD` for other purposes or want to use jemalloc only for certain processes, [use this instead](https://github.com/mojodna/heroku-buildpack-jemalloc).
