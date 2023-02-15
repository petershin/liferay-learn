#!/bin/sh

function main {
	echo "Checking dependencies..."
	echo ""

	local missing_packages=()

	local required_packages=(generator-liferay-fragments generator-liferay-js generator-liferay-theme yarn yo)
	local temp_file="$(mktemp)"

	npm list --depth=0 --global ${required_packages[@]} > ${temp_file}

	for index in ${!required_packages[@]}
	do
		package=${required_packages[${index}]}
	
		grep " ${package}@" ${temp_file}

		if [ $? -gt 0 ]
		then
			missing_packages+=(${package})
		fi
	done

	rm ${temp_file}

	if [ ${#missing_packages[@]} -gt 0 ]
	then
		echo "Some tutorial dependencies are missing. Run this command:"
		echo ""
		echo "	npm install --global ${missing_packages[@]}"

		exit 1;
	fi

	echo "Your environment is ready for the tutorial."
}

main