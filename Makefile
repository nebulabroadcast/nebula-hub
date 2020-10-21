dist: dist/static/css/nebula.css

dist/static/css/nebula.css: sass/nebula.sass
	sass \
		-I vendor/bootstrap-4.5.0/scss \
		-I vendor/font-awesome-sass-5.12.0/assets/stylesheets \
		-I vendor/roboto-1.1.0/sass \
		$< /tmp/nebula.css

	curl -X POST -s --data-urlencode 'input@/tmp/nebula.css' https://cssminifier.com/raw > $@



watch:
	sass \
		-I vendor/bootstrap-4.5.0/scss \
		-I vendor/font-awesome-sass-5.12.0/assets/stylesheets \
		-I vendor/roboto-1.1.0/sass \
		--watch sass/nebula.sass:dist/static/css/nebula.css
