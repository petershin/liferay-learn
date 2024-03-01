#!/bin/bash

pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

ls () {
	command ls "$@" > /dev/null 2>&1
}

function check_grid_links {
	for grid_url in $(ag --depth 0 --only-matching "\:link\:.*\.md" ${article})
	do
		article=$(echo ${article} | sed 's/\.\///g' ) 

		match=$(echo ${grid_url} | cut -d':' -f3 )
		
		link=$(echo ${match} | sed 's/\ //g' )

		if ! ls "${link}"
		then
			if [[ -z ${this_file} || ${this_file} != ${article} ]]
			then this_file=${article}
				echo "Bad links Found in"
				echo "    ${article}"
			fi
			echo "        Grid link: ${link}"
			echo 
		fi
	done
}

function check_image_paths {
	for image_path in $(ag --depth 0 --only-matching "\[.+?\]\(.*?\.(png|gif|jpg)\)" ${article})
	do
		image_path=$(echo ${image_path} | sed 's/\[.*\](\(.*\.\(png\|jpg\|gif\)\).*)/\1/g' )

		image_folder=$(pwd $image_path)

		full_image_path=${image_folder}/${image_path}

		if [[ ${1} == *"/ja" && *"/ko" ]]
		then
			full_image_path=$(echo "${image_folder/\/ja\//\/en\/}")
			full_image_path=$(echo "${image_folder/\/ko\//\/en\/}")
		fi

		article=$(echo ${article} | sed 's/\.\///g' ) 

		if ! ls "${full_image_path}" || [[ ${image_path} != *"/images/"* ]]
		then

			if [[ -z ${thisFile} || ${this_file} != ${article} ]]
			then
				thisFile=${article}
				echo "Bad links Found in"
				echo "    ${article}"
			fi

			echo "        Bad Image Path: ${image_path}"
			echo 
		fi
	done
}

function check_landing_links {
	for landing_reference in $(ag --depth 0 --no-filename --no-numbers "\:file\:.*landing\.html" ${article} )
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
					echo "Bad landing page link:"
					echo "    Landing Page Reference: ${landing_reference_path}"
					echo "    Link: ${landing_page_link/.md/.html}"
					echo 
				fi
			fi
		done
	done

}

function check_markdown_links {
    for markdown_link in $(ag --depth 0 --only-matching "\[.+?\]\(.*?\.md\)" ${article} )
	do

		match=$(echo ${markdown_link} | cut -d':' -f3 )

		link=$(echo ${match} | sed 's/.*\](\(.*\.md.*\)).*/\1/g'  | sed 's/\(\.md\).*/\1/g' )

		if [[ ${link} != *.md ]] || [[ ${link} == "http"* ]]
		then
			return
		fi

		article=$(echo ${article} | sed 's/\.\///g' ) 
		if ! ls "${link}"
		then
			if [[ -z ${this_file} || ${this_file} != ${article} ]]
			then this_file=${article}
				echo "Bad links Found in"
				echo "    ${article}"
			fi
			echo "        Markdown link: ${link}"
			echo 
		fi
	done
}

function check_toc_links {
    for toc_line in $(ag --depth 0 --only-matching "(?s)toc\:.*^---$" ${article} | ag --nonumbers --nomultiline ".*\.md$" )
	do
		toc_line=$(echo "${toc_line}" | rev | cut -d' ' -f1 | rev)

		article=$(echo ${article} | sed 's/\.\///g' ) 

		if ! ls "${toc_line}"
		then
			if [[ -z ${this_file} || ${this_file} != ${article} ]]
			then
                this_file=${article}

				echo "Bad links Found in"
				echo "    ${article}"
            fi

			echo "        TOC link: ${toc_line}"
			echo 
		fi
    done
}

function main {
    IFS=$'\n'

	echo
	echo    "Checking Relative Links in ${1}"
	echo -e "-----------------------------\n"

	for article_dir in $(find ${1} -name '*.md' -printf '%h\n' | sort -u)
	do
		pushd ${article_dir} 
		
		for article in $(find .  -maxdepth 1 -name "*.md")
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

main ${@}
