#!/usr/bin/env bash

# --drafts includes draft posts
OPTIONS=$1
docker run --rm -it -v "$PWD":/usr/src/app -p "4000:4000" starefossen/github-pages jekyll serve -d /_site --watch --force_polling -H 0.0.0.0 -P 4000 ${OPTIONS}
