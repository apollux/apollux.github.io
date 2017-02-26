#!/usr/bin/env bash

sudo docker run --rm -v "$PWD":/usr/src/app -p "4000:4000" starefossen/github-pages
