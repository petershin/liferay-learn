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
	echo $image_match
	imgpath=$(echo ${image_match} | sed 's/\[.*\]\((.*\.(gif|png|jpg))\)/\1/g' )

    imgpath=$(echo ${image_match} | sed 's/\[.*\](\(.*\.png.*\)).*/\1/g'  | sed 's/\(\.png\).*/\1/g' )
	echo $imgpath
    # The full image path means we can do string substitution on the language part of the path, so we can work in the translation folders
    imgdir=$(pwd $imgpath)

	# If we're in a translation folder we need to refer to the en images, so we do this string substitution
    imgdir=$(echo "${imgdir/\/ja\//\/en\/}")
    imgdir=$(echo "${imgdir/\/ko\//\/en\/}")

    fullimgpath=${imgdir}/${imgpath}

    if [[ ${imgpath} != *.png ]] && [[ ${imgpath} != *.gif ]]
	then
        return
    fi
    if ! ls "${fullimgpath}" >/dev/null 2>&1 || [[ ${imgpath} != *"/images/"* ]]
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

        echo "    bad imgpath: ${imgpath}"
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
		elif  [[ ${match} == *".png"* || *".gif"* || *".jpg"* ]]
		then
			image_match=${match}
			process_image_path
		fi
	done

#    for file in $(ag --depth 0 -lG "${1}/.*\.md")
#	do
#
#        for line in $(ag --depth 0 --file-search-regex "./${file}" --nofilename --only-matching "\[.*\]\(.*\.md.*\)")
#		do
#
#            #some lines have multiple links
#            if [[ ${line} == *.md*.md* ]]
#			then
#                
#                matches=$(echo $line | sed -e 's/)/)\n/g')
#
#                for match in ${matches}
#				do
#					if [[ ${match} != \[*\) ]]
#					then
#						echo $match
#						match=$(echo $match | sed 's/.*\(\[.*)\)/\1/g')
#						echo $match
#						read -p "continue?"
#					fi
#                    process_link
#                done
#            else 
#				match=${line}
#				process_link
#            fi
#        done

#        for imgline in $(ag --depth 0 --file-search-regex "./${file}" --nofilename --only-matching "\[.*\]\(.*(\.png|\.gif)\)"); do
#			
#			# Fix up the imgline to exclude double end parens
#			imgline=$(echo ${imgline} | sed 's/))/)/g')
#
#            if [[ ${imgline} == *.png*.png* ]]; then
#                
#                imgmatches=$(echo $imgline | sed -e 's/)/)\n/g')
#
#                for imgmatch in ${imgmatches}; do
#					if [[ ${imgmatch} != \[*\) ]]; then
#						imgmatch=$(echo $imgmatch | sed 's/.*\(\[.*)\)/\1/g')
#					fi
#                    process_image_path
#                done
#            else 
#				imgmatch=${imgline}
#				process_image_path
#            fi
#        done
#    done
    unset IFS
}

function check_landing_links {
    IFS=$'\n'
    for urlLine in $(ag --depth 0 --file-search-regex "${1}/.*landing.html" --nofilename "url\:"); do

        if [[ ${urlLine} != *https://* ]]; then
            url=$(echo $urlLine | sed "s/.*'\(.*\.html\)'.*/\1/g")
            url=$(echo $url | sed 's/\.html/\.md/g')
            #url=$(echo "../${url}")

            if [[ ${url} == ../* ]]; then
                url=$(echo "../${url}")
            elif [[ $(realpath landing.html) == *"$(echo ${url} | cut -d/ -f1)"* ]]; then
                url=$(echo $url | cut -d/ -f2-)
            elif
                # add another check, AND the dirname is the same as the url dir (because otherwise we'd need the ../ as in the else
                [[ ${landing_dir} == . ]]; then
                url=${url}
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
	echo "Checking Landing Page Links in ${1}"

	for landing_dir in $(find ${1} -name landing.html -printf '%h\n' | sort -u); do
		pushd ${landing_dir}
			check_landing_links
		popd
	done

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
