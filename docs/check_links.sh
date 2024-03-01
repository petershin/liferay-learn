#!/bin/bash
# Things to explain to bchan:
# Setting and unsetting IFS is so that bash uses newlines chars to split lines. This makes working with the strings i need much easier, since they include whitespace I do not want to split on, such as [this is some linked text](./link.md)

readonly CURRENT_DIR_NAME=$(dirname "${0}")

source ../_common.sh

# makes pushd and popd quiet
pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

function check_args {
# this needs help
	#if [[ ${1} != "dxp/latest/en" ]]
	#then
	#	echo "ERROR: Enter the product/version/language folder to check."
	#	exit
	#else
	#	echo "good"
	#fi
	echo
}

function process_image_path {

	# Turns [Add Button](../../images/icon-add.png) into
	# ../../images/icon-add.png
	image_path=$(echo ${image_match} | sed 's/\[.*\](\(.*\.\(png\|jpg\|gif\)\).*)/\1/g' )

	# Use thje full image path so that we can do string substitution on the
	# language part of the path, which makes it possible to run this in the
	# translation folders which rely on the en images
    image_folder=$(pwd $image_path)

    full_image_path=${image_folder}/${image_path}

	# Switch the language to en for ja and ko image paths
	if [[ ${1} == *"/ja" && *"/ko" ]]
	then
		full_image_path=$(echo "${image_folder/\/ja\//\/en\/}")
		full_image_path=$(echo "${image_folder/\/ko\//\/en\/}")
	fi

	# Uses the same logic as process_relative_link to determine if the path
	# resolves, and prints a message if not
    if ! ls "${full_image_path}" >/dev/null 2>&1 || [[ ${image_path} != *"/images/"* ]]
	then

        if [[ -z ${thisFile} ]]
		then
            thisFile=${md_file}
            echo "Bad Image Paths Found: ${md_file}"
        elif [[ ${thisFile} != ${md_file} ]]
		then
            thisFile=${md_file}
            echo "Bad Image Paths Found: ${md_file}"
        fi

        echo "    Bad Image Path: ${image_path}"
        echo 
    fi
}

function process_relative_link {
	if [[ ${article_match} == *"]("*".md"* ]]
	then
		link=$(echo ${article_match} | sed 's/.*\](\(.*\.md.*\)).*/\1/g'  | sed 's/\(\.md\).*/\1/g' )
	else
		link=$(echo ${article_match} | sed 's/\ //g' )
	fi

    if [[ ${link} != *.md ]] || [[ ${link} == "http"* ]]; then
        return
    fi
    if ! ls "${link}" >/dev/null 2>&1; then
        if [[ -z ${thisFile} ]]; then
            thisFile=${md_file}
            echo "Bad Links Found: ${md_file}"
        elif [[ ${thisFile} != ${md_file} ]]; then
            thisFile=${md_file}
            echo "Bad Links Found: ${md_file}"
        fi
        echo "    Bad Link: ${link}"
        echo 
    fi
}

function check_relative_markdown_links {
    IFS=$'\n'

    for markdown_url in $(ag --depth 0 --only-matching "\[.+?\]\(.*?\)" --file-search-regex ".*\.md")
	do
		md_file=$(echo ${markdown_url} | cut -d':' -f1 )

		match=$(echo ${markdown_url} | cut -d':' -f3 )

		if [[ ${match} == "["*"]("*".md"* ]]
		then
			article_match=${match}
			process_relative_link
		elif  [[ ${match} == "["*"]("*".png"* && "["*"]("*".gif"* && "["*"]("*".jpg"* ]]
		then
			image_match=${match}
			process_image_path
		fi
	done

    unset IFS
}

function check_relative_grid_links {
    IFS=$'\n'

	for grid_url in $(ag --depth 0 --only-matching "\:link\:.*\.md" --file-search-regex ".*\.md")
	do
		# For example, a grid url looks like this
		# :link: ./using-react/react-component-utilities-reference.md
		md_file=$(echo ${grid_url} | cut -d':' -f1 )

		article_match=$(echo ${grid_url} | cut -d':' -f5 )
		
		process_relative_link
	done

	unset IFS
}

function check_relative_landing_links {
    IFS=$'\n'
	# This logic works differently, since the links in landing.html pages are
	# resolved and must be checked from the directory of the markdown file that
	# ingests the landing.html file, not from the landing.html file itself.
	#
	# This ag gets each .md file that ingests a landing.html
	for landing_reference in $(ag --depth 0 --file-search-regex ".*\.md" --no-filename --no-numbers "\:file\:.*landing\.html")
	do
		# Extract just the path, from the current dir to the referenced
		# landing.html, e.g., `objects/landing.html`
		landing_reference_path=$(echo ${landing_reference} | sed 's/\:file\://g' | sed 's/\ //g' )
		for landing_page_link in $(ag --no-filename "url\:" ${landing_reference_path})
		do
			# Ignore absolute urls
			if [[ ${landing_page_link} != *"https://"* ]]
			then
				# Strip out everything except the url inside the quotes and get rid of page anchors
				landing_page_link=$(echo ${landing_page_link} | sed "s/.*\('\|\"\)\(.*\)\('\|\"\|\#\).*/\2/g" )

				landing_page_link=$(echo ${landing_page_link} | sed 's/\(.*\)#.*/\1/g' )

				# Swap .md for .html
				landing_page_link=$(echo ${landing_page_link} | sed 's/\.html/\.md/g')

				if ! ls "${landing_page_link}" >/dev/null 2>&1 ; then
					echo "Landing Page Reference: ${landing_reference_path}"
					echo "Bad Link: ${landing_page_link/.md/.html}"
					echo 
				fi
			fi
		done
	done

	
	unset IFS
}

function check_relative_toc_links {
    IFS=$'\n'

	# The first ag regex matches the entire `toc` block, while the second gets
	# the lines that end with .md to extract the links
    for tocLine in $(ag --depth 0 --file-search-regex "${1}/.*\.md" --only-matching "(?s)toc\:.*^---$" | ag --nonumbers --nomultiline ".*\.md$" ); do
		toc_file=$(echo "${tocLine}" | cut -d: -f1)

		tocLine=$(echo "${tocLine}" | rev | cut -d' ' -f1 | rev)

		if ! ls "${tocLine}" >/dev/null 2>&1 ; then
            if [[ -z ${thisFile} ]]; then
                thisFile=${toc_file}

                echo "Bad TOC Entries Found: ${toc_file}"
            elif [[ ${thisFile} != ${toc_file} ]]; then
                thisFile=${toc_file}

                echo "Bad TOC Entries Found: ${toc_file}"
            fi

			echo "    Bad Link: ${tocLine}"
			echo 
		fi
    done

	unset IFS
}

function main {

	check_args


	echo    "Checking Relative Links, Image Paths, TOC Entries, and Landing Page Links in ${1}"
	echo -e "-----------------------------\n"

	for article_dir in $(find ${1} -name '*.md' -printf '%h\n' | sort -u); do
		pushd ${article_dir} 
			check_relative_landing_links
			check_relative_grid_links
			check_relative_markdown_links
			check_relative_toc_links
		popd
	done

}

main ${@}
