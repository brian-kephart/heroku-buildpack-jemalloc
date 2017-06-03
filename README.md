# heroku-buildpack-jemalloc

I am a Heroku buildpack that installs
[jemalloc](http://www.canonware.com/jemalloc/) into a dyno slug.

## Using

[Heroku now supports using multiple buildpacks for an app](https://devcenter.heroku.com/articles/using-multiple-buildpacks-for-an-app).

```bash
heroku buildpacks:add --index 1 https://github.com/mojodna/heroku-buildpack-jemalloc.git
git push heroku master
```

If you're not seeing great results from Jemalloc 4.x, you can try Jemalloc 3.6 instead:

```bash
heroku buildpacks:add --index 1 https://github.com/mojodna/heroku-buildpack-jemalloc.git#v3.6.0
git push heroku master
```

Note that you can also use this syntax to lock your buildpack to a specific release.

## Building

This uses Docker to build against Heroku
[stack-image](https://github.com/heroku/stack-images)-like images.

```bash
make
```

Artifacts will be dropped in `dist/`.  See `Dockerfile`s for build options.
