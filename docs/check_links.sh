#!/bin/bash

function check_grids {
	local link

	for link in $(ag --only-matching "\:link\:.*\.md" ${_MARKDOWN_FILE_NAME})
	do
		_LINK_FILE_NAME=$(echo ${link} | cut -d':' -f3 | sed 's/\ //g' )

		if ! ls "${_LINK_FILE_NAME}"
		then
			echo_broken_links "Grid link"
		fi
	done
}

function check_images {
	local link

	for link in $(ag --only-matching "\[.+?\]\(.*?\.(gif|jpg|png)\)" ${_MARKDOWN_FILE_NAME})
	do
		local link_file_name=$(echo ${link} | sed 's/\[.*\](\(.*\.\(gif\|jpg\|png\)\).*)/\1/g' )

		local image_file_name=$(pwd ${link_file_name})/${link_file_name}

		if [[ ${image_file_name} != *"/en/"* ]]
		then
			image_file_name=$(echo "${link_dir_name/\/ja\//\/en\/}")
			image_file_name=$(echo "${link_dir_name/\/ko\//\/en\/}")
		fi

		if ! ls "${image_file_name}" || [[ ${image_file_name} != *"/images/"* ]]
		then
			_LINK_FILE_NAME=${link_file_name}

			echo_broken_links "Image link"
		fi
	done
}

function check_landing_pages {
	local landing_page_reference

	for landing_page_reference in $(ag --no-filename --no-numbers "\:file\:.*landing\.html" ${_MARKDOWN_FILE_NAME} )
	do
		local landing_page_link_file_name=$(echo ${landing_page_reference} | sed 's/\:file\://g' | sed 's/\ //g' )

		local link

		for link in $(ag --no-filename "url\:" ${landing_page_link_file_name})
		do
			if [[ ${link} != *"https://"* ]]
			then
				local link_file_name=$(echo ${link} \
					| sed "s/.*\('\|\"\)\(.*\)\('\|\"\|\#\).*/\2/g" \
					| sed 's/\(.*\)#.*/\1/g' | sed 's/\.html/\.md/g' \
				)

				if ! ls "${link_file_name}"
				then
					echo "Landing page link:"
					echo "    Landing page reference: ${landing_page_link_file_name}"
					echo "    Link: ${link_file_name/.md/.html}"
					echo
				fi
			fi
		done
	done
}

function check_markdown {
	local links

	for links in $(ag --only-matching '\[.*\]\((?!http).*\.md.*\).*' ${_MARKDOWN_FILE_NAME} )
	do
		for _LINK_FILE_NAME in $(echo ${links} | sed -e 's/\.md)/\.md)\n/g' | sed 's/.*\](\(.*\.md\).*).*/\1/g')
		do
			if [[ ${_LINK_FILE_NAME} == *".md" ]]
			then
				if ! ls "${_LINK_FILE_NAME}"
				then
					echo_broken_links "Markdown link"
				fi
			fi
		done
	done
}

function check_tocs {
	for link in $(ag --only-matching "(?s)toc\:.*^---$" ${_MARKDOWN_FILE_NAME} | ag --nomultiline --nonumbers ".*\.md$" )
	do
		_LINK_FILE_NAME=$(echo "${link}" | rev | cut -d' ' -f1 | rev)

		if ! ls "${_LINK_FILE_NAME}"
		then
			echo_broken_links "TOC link"
		fi
	done
}

function echo_broken_links {
	if [[ -z ${_CURRENT_MARKDOWN_FILE_NAME} || ${_CURRENT_MARKDOWN_FILE_NAME} != ${_MARKDOWN_FILE_NAME} ]]
	then
		_CURRENT_MARKDOWN_FILE_NAME=${_MARKDOWN_FILE_NAME}

		echo
		echo "${_MARKDOWN_FILE_NAME}"
	fi

	echo "    ${1}: ${_LINK_FILE_NAME}"
	echo
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
			check_grids
			check_images
			check_landing_pages
			check_markdown
			check_tocs
		done

		popd > /dev/null
	done

	unset IFS
}

main "${@}"