#!/bin/bash

source ../_common.sh

function check_curl_commands {
	echo "Checking curl commands throughout ${1}."
	echo

	local link

	for link in $(rg "^\s*curl\ http[^\s]*\.zip" --glob="*.md" --only-matching ${1})
	do
		local url=$(echo "${link}" | cut -d ':' -f2- | sed 's,.*curl\ ,,g')

		_MARKDOWN_FILE_NAME=$(echo ${link} | cut -d':' -f1)

		curl "${url}" --output temp.zip --silent

		if [[ $(file --mime-type temp.zip) != *"application/zip" ]]
		then
			_LINK_FILE_NAME=${url}

			echo_broken_link "404"
		fi

		rm temp.zip
	done
}

function check_external_links {
	echo "Checking external links throughout ${1}."
	echo

	local checked_dir_names
	local link

	for link in $(rg "\[.+?\]\(http.*?\)" --glob="*.md" --only-matching --pcre2 ${1} | sort)
	do
		local url=$(echo "${link}" | sed 's/.*(\(.*\))/\1/g' )

		if [[ ${url} == *"LIFERAY_LEARN"* ]]
		then
			url=$(echo "${url}" | sed "s/${LIFERAY_LEARN_COMMERCE_DOCKER_IMAGE_TOKEN}/${LIFERAY_LEARN_COMMERCE_DOCKER_IMAGE_VALUE}/g" \
				| sed "s/${LIFERAY_LEARN_COMMERCE_GIT_TAG_TOKEN}/${LIFERAY_LEARN_COMMERCE_GIT_TAG_VALUE}/g" \
				| sed "s/${LIFERAY_LEARN_DXP_DOCKER_IMAGE_TOKEN}/${LIFERAY_LEARN_DXP_DOCKER_IMAGE_VALUE}/g" \
				| sed "s/${LIFERAY_LEARN_PORTAL_DOCKER_IMAGE_TOKEN}/${LIFERAY_LEARN_PORTAL_DOCKER_IMAGE_VALUE}/g" \
				| sed "s/${LIFERAY_LEARN_PORTAL_GIT_TAG_TOKEN}/${LIFERAY_LEARN_PORTAL_GIT_TAG_VALUE}/g" \
				| sed "s/${LIFERAY_LEARN_PORTAL_WORKSPACE_TOKEN}/${LIFERAY_LEARN_PORTAL_WORKSPACE_TOKEN_VALUE}/g" \
			)
		fi

		if [[ "${url}" != *"localhost"* ]] && [[ "${url}" != "https://support.google.com"* ]]
		then
			_MARKDOWN_FILE_NAME=$(echo ${link} | cut -d':' -f1)

			if [[ $(echo ${1} | sed 's,[^a-z], ,g' | wc -w) -eq 3 ]]
			then
				local current_dir_name=$(echo ${_MARKDOWN_FILE_NAME} | cut -d'/' -f1-4)

				if [[ ${checked_dir_names} != *${current_dir_name}* ]]
				then
					echo "Checking ${current_dir_name}."

					checked_dir_names+=$(echo "${current_dir_name} ")
				fi
			fi

			if [[ $(curl --head --location --output /dev/null --silent --write-out "%{http_code}" "${url}") == "404" ]]
			then
				_LINK_FILE_NAME=${url}

				echo_broken_link "404"
			fi
		fi
	done
}

function check_grids {
	local link

	for link in $(rg --only-matching "\:link\:.*\.md" ${_MARKDOWN_FILE_NAME})
	do
		_LINK_FILE_NAME=$(echo ${link} | cut -d':' -f3 | sed 's/\ //g')

		if ! ls "${_LINK_FILE_NAME}"
		then
			echo_broken_link "Grid link"

			fix_link ${@}
		fi
	done
}

function check_images {
	local link

	for link in $(rg --only-matching --pcre2 "\[.+?\]\(.*?\.(gif|jpg|png)\)" ${_MARKDOWN_FILE_NAME})
	do
		_LINK_FILE_NAME=$(echo ${link} | sed 's/\[.*\](\(.*\.\(gif\|jpg\|png\)\).*)/\1/g')

		use_english

		if ! ls "${_LINK_FILE_NAME}" || [[ ${_LINK_FILE_NAME} != *"/images/"* ]]
		then
			echo_broken_link "Image link"
		fi
	done
}

function check_includes {
	local link

	for link in $(rg --only-matching ".*include\}.*" ${_MARKDOWN_FILE_NAME})
	do
		_LINK_FILE_NAME=$(echo ${link} | sed 's/.*include\}\(.*\)/\1/g' | sed 's/ //g')

		local generated_code_warning
		local link_type

		if [[ $(echo ${link} | sed 's/.*{\(.*\)}.*/\1/g') == "literalinclude" ]]
		then
			link_type="Literal include"

			use_english

			local resources_dir_name=$(echo ${_LINK_FILE_NAME} | sed 's/\(.*\/resources\/\).*/\1/g')

			if [[ $(rg --files --glob="service.xml" ${resources_dir_name} 2>/dev/null) ]]
			then
				generated_code_warning="WARNING: This may reference code generated by Service Builder."
			fi

			if [[ $(rg --glob="*update_example.sh" "generate_custom_element" ${resources_dir_name} 2>/dev/null) && ! $(rg --files-with-matches liferay-.*-overlay 2>/dev/null) ]]
			then
				generated_code_warning="WARNING: This may reference code generated by update_example.sh."
			fi
		else
			link_type="Include"

			local snippets_dir_name=$(git rev-parse --show-toplevel)/docs/$(echo ${1} | cut -d'/' -f1-3)

			_LINK_FILE_NAME=${snippets_dir_name}${_LINK_FILE_NAME}
		fi

		if ! ls "${_LINK_FILE_NAME}"
		then
			echo_broken_link ${link_type} ${generated_code_warning}
		fi
	done
}

function check_markdown {
	local link

	for link in $(rg --no-filename --only-matching --pcre2 "\[.+?\]\\((?!http).+?\.md[\#|\\)]" ${_MARKDOWN_FILE_NAME} | rg --only-matching ".*\.md")
	do
		_LINK_FILE_NAME=$(echo ${link} | sed 's/.*\](\(.*\.md\).*/\1/g')

		if ! ls "${_LINK_FILE_NAME}"
		then
			echo_broken_link "Markdown link"

			fix_link ${@}
		fi
	done
}

function check_tocs {
	local link

	for link in $(rg --multiline --only-matching "(?s)toc\:.*^---$" ${_MARKDOWN_FILE_NAME} | rg --no-line-number --no-multiline ".*\.md$")
	do
		_LINK_FILE_NAME=$(echo "${link}" | rev | cut -d' ' -f1 | rev)

		if ! ls "${_LINK_FILE_NAME}"
		then
			echo_broken_link "TOC link"

			fix_link ${@}
		fi
	done
}

function echo_broken_link {
	if [[ -z ${_CURRENT_MARKDOWN_FILE_NAME} || ${_CURRENT_MARKDOWN_FILE_NAME} != ${_MARKDOWN_FILE_NAME} ]]
	then
		_CURRENT_MARKDOWN_FILE_NAME=${_MARKDOWN_FILE_NAME}

		echo $(git rev-parse --show-prefix | cut -d'/' -f2-)${_MARKDOWN_FILE_NAME}
		echo
	fi

	if [[ ${_LINK_FILE_NAME} == *"liferay-learn"* ]]
	then
		_LINK_FILE_NAME=$(echo ${_LINK_FILE_NAME} | sed 's/.*liferay-learn\/docs\///g' | sed 's/\/\.\//\//g')
	fi

	if ! [ -z ${2} ]
	then
		echo "    ${2}"
	fi
	echo "    ${1}: ${_LINK_FILE_NAME}"
	echo
}

function fix_link {
	if [[ ${2} == "--cmd=fix" ]]
	then
		local link_base_file_name=$(echo ${_LINK_FILE_NAME} | rev | cut -d'/' -f1 | rev)

		local correct_link_file_name=$(rg --files --glob="${link_base_file_name}" "${_DOCS_DIR_NAME}/${_LANGUAGE_DIR_NAME}" 2>/dev/null)

		local replace_in_file_name=${_MARKDOWN_FILE_NAME}

		if [[ ${correct_link_file_name} == *".md"*".md"* ]]
		then
			echo "    WARNING: Unable to fix because ${link_base_file_name} is not unique in $_LANGUAGE_DIR_NAME}."
		elif [[ ${correct_link_file_name} ]]
		then
			correct_link_file_name=$(realpath --relative-to=${PWD} ${correct_link_file_name})

			if [[ ${3} == "landing" ]]
			then
				correct_link_file_name=$(echo ${correct_link_file_name} | sed 's/\.md/\.html/g')

				replace_in_file_name=${_LANDING_PAGE_LINK_FILE_NAME}
			elif [[ $(echo ${correct_link_file_name} | rg "^[a-z]") ]]
			then
				correct_link_file_name=$(echo "./${correct_link_file_name}")
			fi

			sed -i "s,(${_LINK_FILE_NAME},(${correct_link_file_name},g" ${replace_in_file_name}
			sed -i "s,\([-|:] \)${_LINK_FILE_NAME},\1${correct_link_file_name},g" ${replace_in_file_name}
			sed -i "s,\([\x27|\x22]\)${_LINK_FILE_NAME},\1${correct_link_file_name},g" ${replace_in_file_name}

			echo "    Fixed: ${correct_link_file_name}"
		else
			echo "    WARNING: Unable to fix ${_LINK_FILE_NAME} in ${replace_in_file_name}."
		fi

		echo
	fi
}

function ls {
	command ls "$@" > /dev/null 2>&1
}

function main {
	IFS=$'\n'

	if [ -z ${1} ]
	then
		echo "Usage: ${0} dxp/latest/en"
		echo
		echo "    --cmd=curl (optional): Check links in curl commands and report 404 responses"
		echo "    --cmd=ext (optional): Check absolute links and report 404 responses"
		echo "    --cmd=fix (optional): Attempt to fix broken relative links"

		exit 0
	fi
	if [[ ${2} == "--cmd=fix" ]]
	then
		if [[ $(git status --short -- ${1}) ]]
		then
			echo "WARNING: There are uncommitted changes. Do not run with \"--cmd=fix\" unless there is nothing reported by \"git status --short -- ${1}\"."

			git status --short -- ${1}

			exit 0
		fi
	fi

	_DOCS_DIR_NAME=$(pwd ./)

	_LANGUAGE_DIR_NAME=$(echo ${1} | cut -d'/' -f1-3)

	local markdown_dir_name

	if [[ -z ${2} || ${2} == "--cmd=fix" ]]
	then
		for markdown_dir_name in $(find ${1} -name '*.md' -printf '%h\n' | sort -u)
		do
			pushd ${markdown_dir_name} > /dev/null

			for _MARKDOWN_FILE_NAME in $(find . -maxdepth 1 -name "*.md" -printf '%f\n')
			do
				check_grids ${@}
				check_images
				check_includes ${@}
				check_markdown ${@}
				check_tocs ${@}
			done

			popd > /dev/null
		done
	elif [[ ${2} == "--cmd=curl" ]]
	then
		check_curl_commands ${@}
	elif [[ ${2} == "--cmd=ext" ]]
	then
		check_external_links ${@}
	fi

	unset IFS
}

function use_english {
	local language_code=$(pwd ${_MARKDOWN_FILE_NAME} | sed 's,.*/\(en\|ja\|ko\)/.*,\1,g')

	if [[ ${language_code} != "en" ]]
	then
		_LINK_FILE_NAME=$(pwd ${_LINK_FILE_NAME})/${_LINK_FILE_NAME}

		_LINK_FILE_NAME=$(echo ${_LINK_FILE_NAME} | sed "s,/${language_code}/,/en/,g")
	fi
}

main "${@}"