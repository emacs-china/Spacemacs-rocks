#!/bin/bash
set -o errexit

# Create public folder
rm -rf public
mkdir public

# config
#git config --global user.email "nobody@li-xinyang.com"
#git config --global user.name "Travis CI"

# make
emacs README.org --batch --eval="(load-file \"generate_readme.el\")" -f org-html-export-to-html --kill
mv README.html ./public/index.html
cp -r readtheorg ./public/readtheorg/

cp CNAME ./public/CNAME
cp Artwork.png ./public/Artwork.png
cp -r Images ./public/
cp -r img ./public/

# deploy
cd public
git init
git add .
git commit -m "Deploy to Github Pages"
git remote add origin git@github.com:emacs-china/Spacemacs-rocks.git
git push  -f origin master:gh-pages
