#! /bin/bash

function check_duplicate_uuids {
	uuidlines=$(ag -G ".*\.md" "^uuid: " --noheading)

	echo "Duplicated UUIDs:"

	for uuidline in $(echo "${uuidlines}"); do 
		uuid=$(echo ${uuidline} | cut -d' ' -f2 )

		uuidcount=$(ag --count "${uuid}" <<< "${uuidlines}")

		if [[ ${uuidcount} != "1" ]]; then 
			echo "${uuid}"
		fi
	done

	echo "--------"
}

function check_english_article_uuids {
	echo "English files without UUIDs:"
	ag -LG "/en/.*\.md" "^uuid: "
	echo "--------"
}

function check_translation_article_uuids {
	echo "Translated files with UUIDs"
	ag -lG "\/ja\/|\/ko\/.*\.md" "^uuid: "
	echo "--------"

	echo "ENTER to continue processing translation IDs"
	read -p "    WARNING: runs a find and sed, will modify files. Best to run with a clean git index so that a git restore can undo unwanted changes."

	for folder in $(find docs -maxdepth 4 -mindepth 4 -type f -name "contents.rst" -printf "%h/\n"); do
		if [[ "${folder}" != *"/en/"* ]]; then
			transfolders+="${folder}\n"
		fi
	done
	for transfolder in $(echo -e ${transfolders}); do
		pushd ${transfolder}

		# for all markdown files matching the string "---\suuid: ", loop through and if head -n1 article is ---, remove uuid line. Now, if the first two lines are ^---$\s^---$, remove them with sed -i, '1,2d' article
		
		for article in $(ag -G "\.md" -l "^\-\-\-[\s\S]*^uuid: "); do
			if [[ $(head -n1 ${article}) == "---" ]]; then
				sed -i '/^uuid: .*/d' ${article}
				if [[ $(echo $(head -n2 ${article}) | ag "\-\-\-\s\-\-\-") ]]; then
					sed -i '1,2d' ${article}
				fi
			fi
		done
		popd
	done
}

function main {
	IFS=$'\n'

	pushd $(git rev-parse --show-toplevel)

	check_duplicate_uuids

	check_english_article_uuids

	check_translation_article_uuids

	echo "Use 'git status' and 'git diff' to inspect the changes and make sure you only removed the frontmatter uuid lines."

	popd

	unset IFS
}

main "${@}"
