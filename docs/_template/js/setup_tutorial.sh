#!/bin/sh

function main {
	echo "Checking dependencies..."

	local tmp_packages_file="$(mktemp -d)/packages"

	local necessay_packages=(generator-liferay-fragments generator-liferay-js generator-liferay-theme yarn yo)
	local missing_packages=()

	npm list --depth=0 -g ${necessay_packages[@]} > $tmp_packages_file

	for index in ${!necessay_packages[@]}; do
		package=${necessay_packages[$index]}
	
		grep " ${package}@" $tmp_packages_file

		if [ $? -gt 0 ]
		then
			missing_packages+=( $package )
		fi
	done

	rm $tmp_packages_file
	echo ""

	if [ ${#missing_packages[@]} -gt 0 ]
	then
		echo "Some tutorial dependencies are missing. Run this command:"
		echo ""
		echo "	npm install -g ${missing_packages[@]}"

		exit 1;
	fi

	echo "Your environment is ready for the tutorial."
}

main
