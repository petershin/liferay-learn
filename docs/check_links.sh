#!/bin/bash

function check_grid_links {
	for grid_link in $(ag --only-matching "\:link\:.*\.md" ${_MARKDOWN_FILE_NAME})
	do
		grid_link=$(echo ${grid_link} | cut -d':' -f3 | sed 's/\ //g' )

		if ! ls "${grid_link}"
		then
			if [[ -z ${_CURRENT_MARKDOWN_FILE_NAME} || ${_CURRENT_MARKDOWN_FILE_NAME} != ${_MARKDOWN_FILE_NAME} ]]
			then
				_CURRENT_MARKDOWN_FILE_NAME=${_MARKDOWN_FILE_NAME}

				echo "${_MARKDOWN_FILE_NAME}"
			fi

			echo "    Grid link: ${grid_link}"
			echo
		fi
	done
}

function check_image_paths {
	for image_path in $(ag --only-matching "\[.+?\]\(.*?\.(gif|jpg|png)\)" ${_MARKDOWN_FILE_NAME})
	do
		image_path=$(echo ${image_path} | sed 's/\[.*\](\(.*\.\(gif\|jpg\|png\)\).*)/\1/g' )

		image_folder=$(pwd $image_path)

		full_image_path=${image_folder}/${image_path}

		if [[ ${full_image_path} == *"/ja/"* && *"/ko/"* ]]
		then
			full_image_path=$(echo "${image_folder/\/ja\//\/en\/}")

			full_image_path=$(echo "${image_folder/\/ko\//\/en\/}")
		fi

		if ! ls "${full_image_path}" || [[ ${image_path} != *"/images/"* ]]
		then

			if [[ -z ${_CURRENT_MARKDOWN_FILE_NAME} || ${_CURRENT_MARKDOWN_FILE_NAME} != ${_MARKDOWN_FILE_NAME} ]]
			then
				_CURRENT_MARKDOWN_FILE_NAME=${_MARKDOWN_FILE_NAME}

				echo "${_MARKDOWN_FILE_NAME}"
			fi

			echo "    Image path: ${image_path}"
			echo
		fi
	done
}

function check_landing_links {
	for landing_reference in $(ag --no-filename --no-numbers "\:file\:.*landing\.html" ${_MARKDOWN_FILE_NAME} )
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
					echo "Landing page link:"
					echo "    Landing page reference: ${landing_reference_path}"
					echo "    Link: ${landing_page_link/.md/.html}"
					echo
				fi
			fi
		done
	done
}

function check_markdown_links {
	for markdown_match in $(ag --only-matching '\[.*\]\((?!http).*\.md.*\).*' ${_MARKDOWN_FILE_NAME} )
	do
		for link in $(echo ${markdown_match} | sed -e 's/\.md)/\.md)\n/g' | sed 's/.*\](\(.*\.md\).*).*/\1/g')
		do
			if [[ ${link} == *".md" ]]
			then
				if ! ls "${link}"
				then
					if [[ -z ${_CURRENT_MARKDOWN_FILE_NAME} || ${_CURRENT_MARKDOWN_FILE_NAME} != ${_MARKDOWN_FILE_NAME} ]]
					then _CURRENT_MARKDOWN_FILE_NAME=${_MARKDOWN_FILE_NAME}
						echo "${_MARKDOWN_FILE_NAME}"
					fi

					echo "    Markdown link: ${link}"
					echo
				fi
			fi
		done
	done
}

function check_toc_links {
	for toc_link in $(ag --only-matching "(?s)toc\:.*^---$" ${_MARKDOWN_FILE_NAME} | ag --nomultiline --nonumbers ".*\.md$" )
	do
		toc_link=$(echo "${toc_link}" | rev | cut -d' ' -f1 | rev)

		if ! ls "${toc_link}"
		then
			if [[ -z ${_CURRENT_MARKDOWN_FILE_NAME} || ${_CURRENT_MARKDOWN_FILE_NAME} != ${_MARKDOWN_FILE_NAME} ]]
			then
				_CURRENT_MARKDOWN_FILE_NAME=${_MARKDOWN_FILE_NAME}

				echo "${_MARKDOWN_FILE_NAME}"
			fi

			echo "    TOC link: ${toc_link}"
			echo
		fi
	done
}

function ls {
	command ls "$@" > /dev/null 2>&1
}

function main {
	IFS=$'\n'

	if [ -z ${1} ]
	then
		echo "Usage: ./check_links.sh dxp/latest/en"

		exit 0
	fi

	local markdown_dir_name

	for markdown_dir_name in $(find ${1} -name '*.md' -printf '%h\n' | sort -u)
	do
		pushd ${markdown_dir_name} > /dev/null

		for _MARKDOWN_FILE_NAME in $(find . -maxdepth 1 -name "*.md" -printf '%f\n')
		do
			check_grid_links
			check_image_paths
			check_landing_links
			check_markdown_links
			check_toc_links
		done

		popd > /dev/null
	done

	unset IFS
}

main "${@}"