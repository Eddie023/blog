# If a command fails then the deploy stops
set -e

echo "Deleting old publication"
rm -rf public


# echo "Create submodule"
# git submodule add --force -b master https://github.com/Eddie023/Eddie023.github.io.git public

echo "Generating site"
hugo

echo "Updating master branch"
cd public
git init

git add --all .

msg="rebuilding site $(date)"

if [ -n  "$*" ]; then
      msg="$*"

fi
git commit -m "$msg"

echo "Publising to master"
git push --force https://${GitHubKEY}@github.com/${GitHubUser}/${GitHubRepo}.git master

echo "Completed"