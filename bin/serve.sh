#!/bin/bash
pushd $(dirname "${0}") > /dev/null
cd ..
bundle exec jekyll serve