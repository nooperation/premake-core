#!/bin/bash
git config --global user.email "builds@travis-ci.com"
git config --global user.name "Travis CI"
git tag $GIT_TAG -a -m "Generated tag from TravisCI build $TRAVIS_BUILD_NUMBER"
git push -q "https://$GH_TOKEN@github.com/nooperation/premake-core" $GIT_TAG
cd bin/release/
echo $GIT_TAG > version.txt
zip -r ../../$GIT_ARTIFACT .
cd ..
