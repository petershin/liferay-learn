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
	for grid_link in $(ag --depth 0 --only-matching "\:link\:.*\.md" ${article})
	do
		match=$(echo ${grid_link} | cut -d':' -f3 )
		
		link=$(echo ${match} | sed 's/\ //g' )

		if ! ls "${link}"
		then
			if [[ -z ${this_file} || ${this_file} != ${article} ]]
			then
				this_file=${article}

				echo "Bad links Found in"
				echo "	  ${article}"
			fi

			echo "		  Grid link: ${link}"
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

		if [[ ${full_image_path} == *"/ja/"* && *"/ko/"* ]]
		then
			full_image_path=$(echo "${image_folder/\/ja\//\/en\/}")

			full_image_path=$(echo "${image_folder/\/ko\//\/en\/}")
		fi

		if ! ls "${full_image_path}" || [[ ${image_path} != *"/images/"* ]]
		then

			if [[ -z ${thisFile} || ${this_file} != ${article} ]]
			then
				thisFile=${article}
				echo "Bad links Found in"
				echo "	  ${article}"
			fi

			echo "		  Image path: ${image_path}"
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
					echo "	  Landing Page Reference: ${landing_reference_path}"
					echo "	  Link: ${landing_page_link/.md/.html}"
					echo
				fi
			fi
		done
	done

}

function check_markdown_links {
	for markdown_link in $(ag --depth 0 --only-matching '\[.*\]\((?!http).*\.md.*\).*' ${article} )
	do
		link=$(echo ${markdown_link} | sed 's/.*\](\(.*\.md\).*).*/\1/g' )

		if ! ls "${link}"
		then
			if [[ -z ${this_file} || ${this_file} != ${article} ]]
			then this_file=${article}
				echo "Bad links Found in"
				echo "	  ${article}"
			fi

			echo "		  Markdown link: ${link}"
			echo
		fi
	done
}

function check_toc_links {
	for toc_link in $(ag --depth 0 --only-matching "(?s)toc\:.*^---$" ${article} | ag --nomultiline --nonumbers ".*\.md$" )
	do
		toc_link=$(echo "${toc_link}" | rev | cut -d' ' -f1 | rev)

		if ! ls "${toc_link}"
		then
			if [[ -z ${this_file} || ${this_file} != ${article} ]]
			then
				this_file=${article}

				echo "Bad links Found in"
				echo "	  ${article}"
			fi

			echo "		  TOC link: ${toc_link}"
			echo
		fi
	done
}

function main {
	IFS=$'\n'

	echo
	echo	"Checking Relative Links in ${1}"
	echo -e "-----------------------------\n"

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

main ${@}
