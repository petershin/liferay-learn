#! /bin/bash

# should get all the actual image paths (full paths), then get all the image references and convert to full paths. if some of the actual images aren't in the list of references, report it.
for article_name in $(find . -name "*.md" -type f)
do
	article_dir=$(basename ${article_name})
	article_dir=${article_dir%.*}

	echo $article_dir

	pushd $(dirname ${article_name})
	for images_dir in $(find . -name images -type d)
	do
		pushd ${images_dir}

		for image in $(ls)
		do
			if [ -z $(ag ${image} ../../${article_dir}.md) ]
			then
				echo $image
				echo $article_name
			fi
		done

		popd
	done
	popd
done
