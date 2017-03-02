#!/usr/bin/env bash

docker run --rm -v "$PWD":/usr/src/app -p "4000:4000" starefossen/github-pages jekyll serve -d /_site --drafts --watch --force_polling -H 0.0.0.0 -P 4000
