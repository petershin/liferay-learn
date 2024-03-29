#!/bin/bash

readonly CURRENT_DIR_NAME=$(dirname "${0}")

source ../_common.sh

function copy_template {
	local zip_dir_name_pattern="liferay-*.zip"

	if [ -n "${1}" ] && [ "${1}" != "prod" ]
	then
		zip_dir_name_pattern="liferay-${1}.zip"
	fi

	for zip_dir_name in `find . -name ${zip_dir_name_pattern} -type d`
	do
		local gradle_build_file_name="$(echo $(find ${zip_dir_name} -name build.gradle -print) | head -n1)"

		if [ -n "${gradle_build_file_name}" ]
		then
			cp -fr _template/java/* ${zip_dir_name}

			if [ ! $(git ls-files ${zip_dir_name}/gradle.properties) ]
			then
				if [ -n "$(grep release.dxp.api $(echo ${gradle_build_file_name}))" ]
				then
					echo -ne "liferay.workspace.product=${LIFERAY_LEARN_DXP_WORKSPACE_TOKEN}" > ${zip_dir_name}/gradle.properties
				else
					echo -ne "liferay.workspace.product=${LIFERAY_LEARN_PORTAL_WORKSPACE_TOKEN_VALUE}\nliferay.workspace.target.platform.version=${LIFERAY_LEARN_PORTAL_WORKSPACE_TARGET_PLATFORM_VERSION}" > ${zip_dir_name}/gradle.properties
				fi
			fi

			pushd ${zip_dir_name}

			if [[ $(find . -name rest-config.yaml) ]]
			then
				./gradlew buildRest
			fi

			if [[ $(find . -name service.xml) ]]
			then
				./gradlew buildService
			fi

			./gradlew classes formatSource

			if [ "${1}" == "prod" ]
			then
				git clean -d -e "gradle.properties" -fx .

				cp -fr $(git rev-parse --show-toplevel)/docs/_template/java/* .
			fi

			popd
		fi

		local package_json_file_name="$(echo $(find ${zip_dir_name} -name package.json -print) | head -n1)"

		if [ -n "${package_json_file_name}" ]
		then
			cp -fr _template/js/* ${zip_dir_name}
		fi

		if [ -z "${gradle_build_file_name}" ] && [ -z "${package_json_file_name}" ]
		then
			pushd $(git rev-parse --show-toplevel)

			./gradlew formatSource -DformatSource.source.base.dir=./docs/${zip_dir_name}

			popd
		fi
	done
}

function main {
	pushd "${CURRENT_DIR_NAME}" || exit 1

	copy_template ${1}

	update_examples ${1}
}

function update_examples {
	local update_example_script_name

	if [ -n "${1}" ] && [ "${1}" != "prod" ]
	then
		local zip_dir_name=`find . -name "liferay-${1}.zip" -type d`

		if [[ -n "${zip_dir_name}" ]] && [[ -f ${zip_dir_name}/../update_example.sh ]]
		then
			pushd "${zip_dir_name}/.."

			./update_example.sh

			popd
		fi

		if [ -z ${zip_dir_name} ]
		then
			update_example_script_name=$(find dxp/latest/en -name update_example.sh -print0 | xargs -0 grep "${1}" | sed 's/\(.*update_example\.sh\).*/\1/g')

			pushd $(dirname "${update_example_script_name}")

			./update_example.sh

			popd
		fi
	else
		for update_example_script_name in `find . -name "update_example.sh" -type f`
		do
			pushd $(dirname "${update_example_script_name}")

			./$(basename "${update_example_script_name}")

			popd
		done
	fi
}

main "${@}"