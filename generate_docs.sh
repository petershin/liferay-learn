#!/bin/bash

_REPOSITORY_DIR=$(pwd)

function copy_images {
	rsync --include="images/*" --include="*/" --exclude="*" --prune-empty-dirs --recursive ${_REPOSITORY_DIR}/docs/ ${_REPOSITORY_DIR}/site/images
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

		mkdir -p ${_REPOSITORY_DIR}/site/examples

		cp "${zip_dir_name}"/"${zip_file_name}" ${_REPOSITORY_DIR}/site/examples

		local output_dir_name=$(dirname "${_REPOSITORY_DIR}/site/${zip_dir_name}")
		local output_dir_name=$(dirname "${output_dir_name}")
		local output_dir_name=$(dirname "${output_dir_name}")

		mkdir -p "/${output_dir_name}"

		mv "${zip_dir_name}"/"${zip_file_name}" "${output_dir_name}"

		echo "Generated zip: ${zip_dir_name}"
	done

	popd > /dev/null
}

function get_reference_docs {
	pushd "${_REPOSITORY_DIR}/site" > /dev/null

	#
	# liferay-ce-portal-doc-*.zip
	#

	echo https://github.com/liferay/liferay-portal/releases/download/"${LIFERAY_LEARN_PORTAL_GIT_TAG_TOKEN_VALUE}"/"${LIFERAY_LEARN_PORTAL_DOC_FILE_NAME}"

	curl -L https://github.com/liferay/liferay-portal/releases/download/"${LIFERAY_LEARN_PORTAL_GIT_TAG_TOKEN_VALUE}"/"${LIFERAY_LEARN_PORTAL_DOC_FILE_NAME}" > liferay-ce-portal-doc.zip

	7z x -aoa liferay-ce-portal-doc.zip

	mkdir -p "${_REPOSITORY_DIR}/site/reference/latest/en/dxp"

	cp -R liferay-ce-portal-doc-${LIFERAY_LEARN_PORTAL_GIT_TAG_TOKEN_VALUE}/* "${_REPOSITORY_DIR}/site/reference/latest/en/dxp"

	rm -fr liferay-ce-portal-doc-${LIFERAY_LEARN_PORTAL_GIT_TAG_TOKEN_VALUE}

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

			echo "[${app_jar_dir_name##*/}](${_LIFERAY_LEARN_RESOURCE_DOMAIN}/${app_jar_relative_path})" >> ${apps_markdown_file_name}
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

function init_diffs {
	local hash=$(cat .latest_hash)

	if ! git rev-parse --verify "${hash}" >/dev/null 2>&1
	then
		echo "Invalid hash: ${hash}"

		return 1
	fi

	_DIFFS_STRING=$(git diff --name-only "${hash}" HEAD)

	while IFS= read -r file_name
	do
		_DIFFS+=("${file_name}")
	done <<< ${_DIFFS_STRING}
}

function is_diff {
	if [ -z "${_DIFFS}" ]
	then
		return 0
	fi

	if [[ "${1}" == *.zip ]] && [[ "$_DIFFS_STRING" == *"${1}"* ]]
	then
		return 0
	fi

	[[ "${_DIFFS[@]}" =~ "${1}" ]]
}

function main {
	_DIFFS=()
	_DIFFS_STRING=""

	local start_time=`date +%s`

	set_up_environment

	update_examples

	get_reference_docs

	run_learn_markdown_converter

	copy_images

	local end_time=`date +%s`

	echo "Script took $((end_time - start_time)) seconds."
}

function run_learn_markdown_converter {
	pushd "${_REPOSITORY_DIR}/learn-markdown-converter"

	../gradlew run

	popd
}

function set_up_environment {
	source ./_common.sh
	source ./learn-markdown-converter/src/main/resources/com/liferay/learn/markdown/converter/dependencies/token.properties

	init_diffs

	update_permissions

	export _LIFERAY_LEARN_RESOURCE_DOMAIN="http://localhost:8000"

	if [[ -n "${LIFERAY_LEARN_RESOURCE_DOMAIN}" ]]
	then
		export _LIFERAY_LEARN_RESOURCE_DOMAIN="${LIFERAY_LEARN_RESOURCE_DOMAIN}"
	fi

	export _RUN_PARALLEL="true"

	if [[ -n "${LIFERAY_LEARN_ETC_CRON_RUN_PARALLEL}" ]]
	then
		export _RUN_PARALLEL="${LIFERAY_LEARN_ETC_CRON_RUN_PARALLEL}"
	fi
}

function update_example {
	if ! is_diff "${1}"
	then
		continue;
	fi

	pushd "$(dirname "${1}")" > /dev/null

	./$(basename "${1}") 2> "${_REPOSITORY_DIR}/site/logs/$(basename ${1%/*/*}).err"

	popd > /dev/null

	echo "Updated example: ${1}"
}

function update_examples {
	mkdir -p "${_REPOSITORY_DIR}/site/logs"

	pushd "${_REPOSITORY_DIR}/docs"

	for update_example_script_name in $(find . -name "update_example.sh" -type f)
	do
		if [ "${_RUN_PARALLEL}" == "true" ]
		then
			update_example "${update_example_script_name}" &
		else
			update_example "${update_example_script_name}"
		fi
	done

	wait

	popd

	local exit_code=$?

	for file_name in $(find ${_REPOSITORY_DIR}/site/logs -name "*.err" -type f)
	do
		if [ -s "${file_name}" ]
		then
			echo "Errors from: $(basename ${file_name})"

			cat "${file_name}"
		fi
	done

	generate_zip_files
}

function update_permissions {
	pushd "${_REPOSITORY_DIR}/docs"

	./update_permissions.sh

	popd
}

main "${@}"