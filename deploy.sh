#!/bin/bash
set -o errexit

# Create public folder
rm -rf public
mkdir public

# config
git config --global user.email "nobody@li-xinyang.com"
git config --global user.name "Travis CI"

# make
emacs README.org --batch --eval="(load-file \"convert_to_highlight_js.el\")" -f org-html-export-to-html --kill
mv README.html ./public/index.html
mv readtheorg ./public/readtheorg/

cp CNAME ./public/CNAME
cp Artwork.png ./public/Artwork.png

# deploy
cd public
git init
git add .
git commit -m "Deploy to Github Pages"
git push -f "https://${GH_TOKEN}@${GH_REF}" master:gh-pages
