#!/bin/bash
# Run this script to make docs at http://dssg-diogenes.github.io/diogenes/doc/_build/html/index.html
# reflect the changes in the master branch of https://github.com/dssg/diogenes
git checkout master
git pull https://github.com/dssg/diogenes.git master
git push
git checkout gh-pages
git pull --no-edit origin master
pushd doc
make clean
make html
git add _build
git commit -am 'update from upstream'
git push
popd
git checkout master
