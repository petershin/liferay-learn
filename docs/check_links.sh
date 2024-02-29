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
            echo "FILE: ${md_file}"
        elif [[ ${thisFile} != ${md_file} ]]
		then
            thisFile=${md_file}
            echo "FILE: ${md_file}"
        fi

        echo "    bad image path: ${image_path}"
        echo ""
    fi
}

function process_relative_link {
    link=$(echo ${article_match} | sed 's/.*\](\(.*\.md.*\)).*/\1/g'  | sed 's/\(\.md\).*/\1/g' )
    if [[ ${link} != *.md ]] || [[ ${link} == "http"* ]]; then
        return
    fi
    if ! ls "${link}" >/dev/null 2>&1; then
        if [[ -z ${thisFile} ]]; then
            thisFile=${md_file}
            echo "FILE: ${md_file}"
        elif [[ ${thisFile} != ${md_file} ]]; then
            thisFile=${md_file}
            echo "FILE: ${md_file}"
        fi
        echo "    bad link: ${link}"
        echo ""
    fi
}

function check_this_folder {
    IFS=$'\n'

    for markdown_url in $(ag --depth 0 --only-matching "\[.+?\]\(.*?\)" --file-search-regex ".*\.md")
	do
		#the markdown_url looks like this right now: 
		# deploying-and-managing-a-microservice-client-extension-project.md:184:[Actions menu](../../images/icon-actions.png)
		
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

function check_landing_links {
    IFS=$'\n'
    for urlLine in $(ag --depth 0 --file-search-regex landing.html --nofilename "url\:"); do
        if [[ ${urlLine} != *"https://"* ]]; then

			# Strip out everything except the url inside the quotes
            url=$(echo $urlLine | sed "s/.*'\(.*\.html\)'.*/\1/g")

			# Swap .md for .html
            url=$(echo $url | sed 's/\.html/\.md/g')

			# This logic below is needed because of how we ingest landing pages
			# into regular markdown pages one directory above where the
			# landing.html file lives. We will likely do away with these
			# landing pages in the future so we shouldn't refactor them right
			# now. This logic has worked for months, and can be removed when we
			# use a different paradigm for landing pages.
			
# new logic: first, get the landing page references form markdown files, like return the objects/landing.html reference. then extract the link, and ls it from the direcctory where the reference to the landing page is made

			# Add a `../` if the url already has a `../`, this is necessary for
			# proper link resolving to other sections
            if [[ ${url} == ../* ]]; then
                url=$(echo "../${url}")
			# elif, the abs path of the landing page has the first directorey of the url in it, like objects/landing.html has links to 'objects/creating-objects.html'
			# in this case we cut that folder from the poath for proper link resolving
			# Isn't this the same as adding the ../ to the url? we could simpliofy these two blocks if so
            elif [[ $(realpath landing.html) == *"$(echo ${url} | cut -d/ -f1)"* ]]; then
                url=$(echo $url | cut -d/ -f2-)
			# The landing pages at the root of a section don't need
			# modification to their urls before checking them
		elif [[ ${landing_dir} == ${1} ]]; then
                url=${url}
			# these seem to be links to other sections one dir up
            else
                url=$(echo "../${url}")
            fi
            if [[ ${url} != *.md ]]; then
                return
            fi
            if ! ls "${url}" >/dev/null 2>&1 ; then
                echo "${landing_dir}/landing.html"
                echo "bad link: ${url/.md/.html}"
                echo ""
            fi
        fi
		unset IFS
    done
	unset IFS
}

function check_landing_links_alt {
    IFS=$'\n'
	for landing_reference in $(ag --depth 0 --file-search-regex ".*\.md" --no-filename --no-numbers "\:file\:.*landing\.html")
	do
		landing_reference_path=$(echo ${landing_reference} | sed 's/\:file\://g' | sed 's/\ //g' )
		for landing_page_link in $(ag --no-filename "url\:" ${landing_reference_path})
		do
			if [[ ${landing_page_link} != *"https://"* ]]
			then
				# Strip out everything except the url inside the quotes and get rid of page anchors
				landing_page_link=$(echo ${landing_page_link} | sed "s/.*\('\|\"\)\(.*\)\('\|\"\|\#\).*/\2/g" | sed 's/\(.*\)#.*/\1/g' )

				# Swap .md for .html
				landing_page_link=$(echo ${landing_page_link} | sed 's/\.html/\.md/g')

				if ! ls "${landing_page_link}" >/dev/null 2>&1 ; then
					echo "I'm here: $(pwd)" 
					echo "${landing_reference_path}"
					echo "bad link: ${landing_page_link/.md/.html}"
					echo ""
				fi
			fi
		done
	done

	
	unset IFS
}

function check_toc_links {
    IFS=$'\n'
    for tocLine in $(ag --depth 0 --file-search-regex "${1}/.*\.md" --only-matching "(?s)toc\:.*^---$" | ag --nonumbers --nomultiline ".*\.md$" ); do
		toc_file=$(echo "${tocLine}" | cut -d: -f1)
		tocLine=$(echo "${tocLine}" | rev | cut -d' ' -f1 | rev)
		if ! ls "${tocLine}" >/dev/null 2>&1 ; then
            if [[ -z ${thisFile} ]]; then
                thisFile=${toc_file}
                echo "FILE: ${toc_file}"
            elif [[ ${thisFile} != ${toc_file} ]]; then
                thisFile=${toc_file}
                echo "FILE: ${toc_file}"
            fi

			echo "    bad link: ${toc_dir}/${tocLine}"
			echo ""
		fi
    done
	unset IFS
}

function main {

	check_args

	echo -e "------------------"
	echo "Checking Landing Page Links VERSION 2 in ${1}"

    IFS=$'\n'
	for article_dir in $(find ${1} -name '*.md' -printf '%h\n' | sort -u); do
		pushd ${article_dir} 
			check_landing_links_alt ${1}
		popd
	done
	unset IFS
	#echo -e "------------------"
	#echo "Checking Landing Page Links in ${1}"

	#for landing_dir in $(find ${1} -name landing.html -printf '%h\n' | sort -u); do
	#	pushd ${landing_dir}
	#		check_landing_links ${1}
	#	popd
	#done

	echo -e "\n\n\n------------------"
	echo "Checking Article Links in ${1}"

	for article_dir in $(find ${1} -name '*.md' -printf '%h\n' | sort -u); do
		pushd ${article_dir} 
			check_this_folder
		popd
	done

	echo -e "\n\n\n------------------"
	echo "Checking TOC Links in ${1}"

	for toc_dir in $(dirname $(ag --file-search-regex "${1}/.*\.md" --files-with-matches --multiline "(?s)toc\:.*---") | sort -u); do
		pushd ${toc_dir} 
			check_toc_links
		popd
	done
}

main ${@}
