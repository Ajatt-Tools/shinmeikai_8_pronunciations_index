#!/bin/bash

# Create a package to release on GitHub.
# Add the `media_dir_abs` key to the json because the zip will be in different location.

readonly package_name=Shinmeikai-8

mkdir -p -- package
rm -- ./package/* || true

while read -r branch; do
	media_dir_abs="https://raw.githubusercontent.com/Ajatt-Tools/shinmeikai_8_pronunciations_index/$branch/media"
	zip_name=./package/${package_name}_${branch}.zip
	json_name=${zip_name%.*}.json
	echo "Creating $zip_name..."
	git show "$branch:index.json" >"$json_name"
	python3 add_abs_path.py "$json_name" "$media_dir_abs"
	zip -j "$zip_name" "$json_name"
	rm -- "$json_name"
done < <(git for-each-ref --format='%(refname:short)' refs/heads/)
