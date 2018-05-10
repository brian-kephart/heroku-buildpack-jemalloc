# heroku-buildpack-jemalloc

This Heroku buildpack installs
[jemalloc](http://www.canonware.com/jemalloc/) into a dyno slug.

The current version is built with the Heroku-16 stack. There is a branch built with the public beta of Heroku-18, which will be merged to master when Heroku-18 becomes the new default stack. Older stacks are not supported, though in theory and experience they should run this buildpack just fine.

## Buildpack goals

- **Up-to-date.** Always the latest version of jemalloc, built against the newest Heroku stack.
- **Zero config.** Just add the buildpack and get jemalloc for everything.

If you have other needs, such as...
- turning jemalloc on/off without adding/removing the buildpack,
- using jemalloc for only certain processes,
- building specific versions of jemalloc for specific Heroku stacks,
- using the `LD_PRELOAD` environment variable for something else

...then you should use one of these instead:

- [https://github.com/mojodna/heroku-buildpack-jemalloc](https://github.com/mojodna/heroku-buildpack-jemalloc). The linked repo is the original source of this project. It requires some configuration, but allows for per-process use of jemalloc and turning jemalloc on/off with environment variables.
- [https://github.com/gaffneyc/heroku-buildpack-jemalloc](https://github.com/gaffneyc/heroku-buildpack-jemalloc). This repo allows for greater configuration regarding both Heroku stacks and jemalloc versions.

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
