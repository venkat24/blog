git checkout master
stack exec blog clean
stack exec blog build
git checkout -b gh-pages
rsync -a --filter='P _site/'      \
         --filter='P _cache/'     \
         --filter='P .git/'       \
         --filter='P .gitignore'  \
         --filter='P .stack-work' \
         --delete-excluded        \
         _site/ .
git add -A
git commit -m "Publish"
git push origin gh-pages --force
git checkout master
git branch -D gh-pages
