#!/bin/bash

_REPOSITORY_DIR=$(pwd)

function generate_docs {
	pushd "${_REPOSITORY_DIR}/learn-markdown-converter"

	../gradlew run

	popd
}

function generate_examples {
	pushd "${_REPOSITORY_DIR}/docs"

	for update_example_script_name in $(find . -name "update_example.sh" -type f)
	do
		if ! is_diff "${update_example_script_name}"
		then
			continue;
		fi

		pushd "$(dirname "${update_example_script_name}")"

		./$(basename "${update_example_script_name}") 2> ${_REPOSITORY_DIR}/update_examples.err
	
		popd

		echo "Generated example: ${update_example_script_name}"
	done

	popd

	local exit_code=$?

	cat ${_REPOSITORY_DIR}/update_examples.err

	generate_zip_files
}

function generate_zip_files {
	pushd "${_REPOSITORY_DIR}/docs" > /dev/null

	for zip_dir_name in $(find * -name \*.zip -type d)
	do
		if ! is_diff "${zip_dir_name}"
		then
			continue;
		fi

		pushd "${zip_dir_name}"

		local zip_file_name=$(basename "${zip_dir_name}")

		7z a ${zip_file_name} ../${zip_file_name}\

		7z rn ${zip_file_name} ${zip_file_name} ${zip_file_name%.*}

		popd

		local output_dir_name=$(dirname "${_REPOSITORY_DIR}/site/${zip_dir_name}")
		local output_dir_name=$(dirname "${output_dir_name}")
		local output_dir_name=$(dirname "${output_dir_name}")

		mkdir -p "/${output_dir_name}"

		mv "${zip_dir_name}"/"${zip_file_name}" "${output_dir_name}"

		echo "Generated zip: ${zip_dir_name}"
	done

	popd > /dev/null
}

function get_git_diffs {
	local hash=$(cat .latest_hash)

	if ! git rev-parse --verify "$hash" >/dev/null 2>&1
	then
		echo "Error: Invalid hash '$hash'"

		return 1
	fi

	_diffs_string=$(git diff --name-only "$hash" HEAD)

	while IFS= read -r filename
	do
		_diffs+=("$filename")
	done <<< ${_diffs_string}
}

function get_reference_docs {
	pushd "${_REPOSITORY_DIR}/site" > /dev/null

	#
	# liferay-ce-portal-doc-*.zip
	#

	curl -L https://github.com/liferay/liferay-portal/releases/download/"${LIFERAY_LEARN_PORTAL_GIT_TAG_VALUE}"/"${LIFERAY_LEARN_PORTAL_DOC_FILE_NAME}" > liferay-ce-portal-doc.zip

	7z x -aoa liferay-ce-portal-doc.zip

	mkdir -p "${_REPOSITORY_DIR}/site/reference/latest/en/dxp"

	cp -R liferay-ce-portal-doc-${LIFERAY_LEARN_PORTAL_GIT_TAG_VALUE}/* "${_REPOSITORY_DIR}/site/reference/latest/en/dxp"

	rm -r liferay-ce-portal-doc-${LIFERAY_LEARN_PORTAL_GIT_TAG_VALUE}

	rm -f liferay-ce-portal-doc.zip

	local apps_markdown_file_name="${_REPOSITORY_DIR}/docs/reference/latest/en/dxp/apps.md"

	echo "---" > ${apps_markdown_file_name}
	echo "uuid: ba71e6fa-d76f-42ec-b3bb-c54cebae6156" >> ${apps_markdown_file_name}
	echo "---" >> ${apps_markdown_file_name}
	echo "# Apps" >> ${apps_markdown_file_name}
	echo "" >> ${apps_markdown_file_name}

	for app_dir_name in "${_REPOSITORY_DIR}/site/reference/latest/en/dxp/javadocs/modules/apps/*"
	do
		echo "## $(basename $app_dir_name)" >> ${apps_markdown_file_name}

		for app_jar_dir_name in ${app_dir_name}/*
		do
			local app_jar_relative_path=$(echo "${app_jar_dir_name}/index.html" | cut -d/ -f7-)

			echo "[${app_jar_dir_name##*/}](${LIFERAY_LEARN_RESOURCE_DOMAIN}/${app_jar_relative_path})" >> ${apps_markdown_file_name}
			echo "" >> ${apps_markdown_file_name}
		done
	done

	#
	# portlet-api-3.0.1-javadoc.jar
	#

	curl https://repo1.maven.org/maven2/javax/portlet/portlet-api/3.0.1/portlet-api-3.0.1-javadoc.jar -O

	mkdir -p "${_REPOSITORY_DIR}/site/reference/latest/en/dxp/portlet-api"

	7z x -aoa -o"${_REPOSITORY_DIR}/site/reference/latest/en/portlet-api" portlet-api-3.0.1-javadoc.jar

	rm -f portlet-api-3.0.1-javadoc.jar

	popd > /dev/null
}

function is_diff {
	if [ -z "${_diffs}" ]
	then
		return 0
	fi

	if [[ "$1" == *.zip ]] && [[ "$_diffs_string" == *"$1"* ]]
	then
		return 0
	fi

	[[ "${_diffs[@]}" =~ "$1" ]]
}

function main {
	local _diffs=()
	local _diffs_string=""
	local start=`date +%s`

	set_up_environment

	generate_examples

	generate_docs

	get_reference_docs

	local end=`date +%s`

	echo "Script run in $((end-start)) seconds"
}

function set_up_environment {
	source ./_common.sh

	get_git_diffs

	update_permissions

	export LIFERAY_LEARN_RESOURCE_DOMAIN="${_REPOSITORY_DIR}/site"

	if [[ -n "${LIFERAY_LEARN_ETC_CRON_LIFERAY_LEARN_RESOURCES_DOMAIN}" ]]
	then
		export LIFERAY_LEARN_RESOURCE_DOMAIN="${LIFERAY_LEARN_ETC_CRON_LIFERAY_LEARN_RESOURCES_DOMAIN}"
	fi
}

function update_permissions {
	pushd "${_REPOSITORY_DIR}/docs"

	./update_permissions.sh

	popd
}

main "${@}"