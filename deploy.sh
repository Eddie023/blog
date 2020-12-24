# If a command fails then the deploy stops
set -e

echo "Deleting old publication"
rm -rf public

echo "Generating site"
hugo

echo "Updating master branch"
cd public
git init

git remote add origin https://github.com/Eddie023/Eddie023.github.io.git

git add --all .

msg="rebuilding site $(date)"

if [ -n  "$*" ]; then
      msg="$*"

fi
git commit -m "$msg"

echo "Publising to master"
git push origin master -f

echo "Completed"