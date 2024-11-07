#!/bin/bash

function download_nexus_jar {
	group="com.liferay"

	if [[ ${1} == *"headless.commerce"* ]]
	then
		group="com.liferay.commerce"
	fi

	curl -L "https://repository-cdn.liferay.com/nexus/service/local/artifact/maven/redirect?a=${1}&g=${group}&r=liferay-public-releases&v=LATEST" -o $(ls -d liferay*.zip | head -n1)/java/${1}.jar
}

function generate_custom_element {
	git clean -dfx .

	mkdir liferay-${1}.zip

	cp $(git rev-parse --show-toplevel)/docs/_template/js/setup_tutorial.sh ./liferay-${1}.zip

	cd liferay-${1}.zip

	curl -Ls https://github.com/liferay/liferay-portal/raw/master/tools/create_custom_element.sh | bash -s ${1}-custom-element react

	if [ -e ../liferay-${1}-overlay ]
	then

		# TODO Prettify package.json (overlay and merged)

		rm -fr ./${1}-custom-element/src

		if [ -e ../liferay-${1}-overlay/src ]
		then
			cp -r ../liferay-${1}-overlay/src ${1}-custom-element
		fi

		if [ -e ../liferay-${1}-overlay/package.json ]
		then
			jq -s '.[0] * .[1]' ../liferay-${1}-overlay/package.json ./${1}-custom-element/package.json > package.json

			rm -f ./${1}-custom-element/package.json

			mv package.json ./${1}-custom-element/package.json

			cd ${1}-custom-element

			rm -fr node_modules

			yarn install && yarn build

			rm -fr node_modules

			cd ..
		fi
	fi

	cd ..
}
