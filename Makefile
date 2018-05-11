default: dist/jemalloc-5.1.0_heroku-18.tar.gz

dist/jemalloc-5.1.0_heroku-18.tar.gz: jemalloc-heroku
	docker cp $<:/tmp/jemalloc-heroku.tar.gz .
	mkdir -p $$(dirname $@)
	mv jemalloc-heroku.tar.gz $@

clean:
	rm -rf src/ dist/
	-docker rm jemalloc-heroku

src/jemalloc.tar.bz2:
	mkdir -p $$(dirname $@)
	curl -sL https://github.com/jemalloc/jemalloc/releases/download/5.1.0/jemalloc-5.1.0.tar.bz2 -o $@

.PHONY: jemalloc-heroku

jemalloc-heroku: src/jemalloc.tar.bz2
	docker build --rm -t mojodna/$@ .
	-docker rm $@
	docker run --name $@ mojodna/$@ /bin/echo $@
