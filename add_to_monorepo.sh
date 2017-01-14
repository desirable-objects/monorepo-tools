#!/bin/zsh

# You need ZSH.
# Before you start, move your whole repo into its own .tmp folder and commit it.
# Then, run this script for each existing repo you want in the monorepo.
# After you're done, Move the entire structure of .tmp into the root of your repo and commit it.
# Then push!

THISDIR=`pwd`
REMOTE=$1
NEWDIR=$2

if [ $# -ne 2 ]
  then
    echo "Builds a monorepo by combining the git history of all desired sub projects.\n\nUsage: $0 <git-remote-repo-url> <package-name>\n\nBy Antony Jones / Desirable Objects Ltd"
    exit 1
fi

if [ ! -d .tmp ]
  then
    echo "Before running this script, you should move everything that already exists in your parent repo, i.e. the one which will become the monorepo (excluding .git dir!) into a subdirectory called .tmp"
    exit 2
fi

echo "Setting options"
setopt extendedglob
setopt globdots
echo "Adding Remote for $NEWDIR"
git remote add -f $NEWDIR $REMOTE
echo "Merging $NEWDIR"
git merge -m "merge $NEWDIR into monorepo" $NEWDIR/master
DEST=.tmp/packages/$NEWDIR
echo "Making dest dir $DEST"
mkdir $DEST
echo "Moving files"
mv ^(*.git|*.tmp) $DEST
echo "Committing changes"
git add .
git commit -am "add $NEWDIR to monorepo"
echo "Cleaning up"
git remote rm $NEWDIR
echo "Restore enviroment"
unsetopt extendedglob
unsetopt globdots
echo "Done."
echo "If this is the last project repository you want to add, you are done! You can now move the contents of .tmp into your monorepo's root dir, and commit it"
