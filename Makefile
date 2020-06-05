image = kadock/hugo:edge
volumes = -v /srv/wiki/site:/tmp/source -v /srv/wiki/www:/tmp/dest

build:
	docker build -t ${image} .

run:
	docker run --rm ${volumes} ${image}

shell:
	docker run --rm -i -t --entrypoint /bin/sh ${volumes} ${image}
