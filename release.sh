#!/bin/bash

tag=${1:-$(git describe --tags)}
echo "Creating release for tag $tag"
bash ./package.sh
gh release create "$tag" \
	--verify-tag \
	--latest \
	--title "Shinmeikai 8 audio source" \
	--notes "A zipped release." \
	./package/*.zip
