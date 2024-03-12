#!/bin/bash

function ls {
	command ls "$@" > /dev/null 2>&1
}

function popd {
	command popd "$@" > /dev/null
}

function pushd {
	command pushd "$@" > /dev/null
}

function check_grid_links {
	for grid_link in $(ag --only-matching "\:link\:.*\.md" ${article})
	do
		match=$(echo ${grid_link} | cut -d':' -f3 )

		link=$(echo ${match} | sed 's/\ //g' )

		if ! ls "${link}"
		then
			if [[ -z ${this_file} || ${this_file} != ${article} ]]
			then
				this_file=${article}

				echo "${article}"
			fi

			echo "	grid link: ${link}"
			echo
		fi
	done
}

function check_image_paths {
	for image_path in $(ag --only-matching "\[.+?\]\(.*?\.(png|gif|jpg)\)" ${article})
	do
		image_path=$(echo ${image_path} | sed 's/\[.*\](\(.*\.\(png\|jpg\|gif\)\).*)/\1/g' )

		image_folder=$(pwd $image_path)

		full_image_path=${image_folder}/${image_path}

		if [[ ${full_image_path} == *"/ja/"* && *"/ko/"* ]]
		then
			full_image_path=$(echo "${image_folder/\/ja\//\/en\/}")

			full_image_path=$(echo "${image_folder/\/ko\//\/en\/}")
		fi

		if ! ls "${full_image_path}" || [[ ${image_path} != *"/images/"* ]]
		then

			if [[ -z ${this_file} || ${this_file} != ${article} ]]
			then
				this_file=${article}

				echo "${article}"
			fi

			echo "	image path: ${image_path}"
			echo
		fi
	done
}

function check_landing_links {
	for landing_reference in $(ag --no-filename --no-numbers "\:file\:.*landing\.html" ${article} )
	do
		landing_reference_path=$(echo ${landing_reference} | sed 's/\:file\://g' | sed 's/\ //g' )
		for landing_page_link in $(ag --no-filename "url\:" ${landing_reference_path})
		do
			if [[ ${landing_page_link} != *"https://"* ]]
			then
				landing_page_link=$(echo ${landing_page_link} | sed "s/.*\('\|\"\)\(.*\)\('\|\"\|\#\).*/\2/g" )

				landing_page_link=$(echo ${landing_page_link} | sed 's/\(.*\)#.*/\1/g' )

				landing_page_link=$(echo ${landing_page_link} | sed 's/\.html/\.md/g')

				if ! ls "${landing_page_link}"
				then
					echo "landing page link:"
					echo "	landing page reference: ${landing_reference_path}"
					echo "	link: ${landing_page_link/.md/.html}"
					echo
				fi
			fi
		done
	done

}

function check_markdown_links {
	for markdown_match in $(ag --only-matching '\[.*\]\((?!http).*\.md.*\).*' ${article} )
	do
		links=$(echo ${markdown_match} | sed -e 's/\.md)/\.md)\n/g' | sed 's/.*\](\(.*\.md\).*).*/\1/g' )

		for link in ${links}
		do

			if [[ ${link} == *".md" ]]
			then
				if ! ls "${link}"
				then
					if [[ -z ${this_file} || ${this_file} != ${article} ]]
					then this_file=${article}
						echo "${article}"
					fi

					echo "	markdown link: ${link}"
					echo
				fi
			fi
		done
	done
}

function check_toc_links {
	for toc_link in $(ag --only-matching "(?s)toc\:.*^---$" ${article} | ag --nomultiline --nonumbers ".*\.md$" )
	do
		toc_link=$(echo "${toc_link}" | rev | cut -d' ' -f1 | rev)

		if ! ls "${toc_link}"
		then
			if [[ -z ${this_file} || ${this_file} != ${article} ]]
			then
				this_file=${article}

				echo "${article}"
			fi

			echo "	toc link: ${toc_link}"
			echo
		fi
	done
}

function main {
	IFS=$'\n'

	if [ -z ${1} ]
	then
		echo "Usage: ./check_links.sh dxp/latest/en"

		exit 0
	fi

	for article_dir in $(find ${1} -name '*.md' -printf '%h\n' | sort -u)
	do
		pushd ${article_dir}

		for article in $(find . -maxdepth 1 -name "*.md" -printf '%f\n')
		do
			check_grid_links
			check_image_paths
			check_landing_links
			check_markdown_links
			check_toc_links
		done

		popd
	done

	unset IFS
}

main "${@}"