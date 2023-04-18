#!/bin/bash

readonly CURRENT_DIR_NAME=$(dirname "${0}")

source ../_common.sh

function main {
	pushd "${CURRENT_DIR_NAME}" || exit 1

	replace_tokens
}

function replace_tokens {
	for md_file_name in $(find . -name "*.md" -type f)
	do
		sed -i "s/${LIFERAY_LEARN_COMMERCE_DOCKER_IMAGE_TOKEN}/${LIFERAY_LEARN_COMMERCE_DOCKER_IMAGE_VALUE}/g" "${md_file_name}"
		sed -i "s/${LIFERAY_LEARN_COMMERCE_GIT_TAG_TOKEN}/${LIFERAY_LEARN_COMMERCE_GIT_TAG_VALUE}/g" "${md_file_name}"
		sed -i "s/${LIFERAY_LEARN_DXP_DOCKER_IMAGE_TOKEN}/${LIFERAY_LEARN_DXP_DOCKER_IMAGE_VALUE}/g" "${md_file_name}"
		sed -i "s/${LIFERAY_LEARN_PORTAL_DOCKER_IMAGE_TOKEN}/${LIFERAY_LEARN_PORTAL_DOCKER_IMAGE_VALUE}/g" "${md_file_name}"
		sed -i "s/${LIFERAY_LEARN_PORTAL_GIT_TAG_TOKEN}/${LIFERAY_LEARN_PORTAL_GIT_TAG_VALUE}/g" "${md_file_name}"
		sed -i "s/${LIFERAY_LEARN_PORTAL_WORKSPACE_TOKEN}/${LIFERAY_LEARN_PORTAL_WORKSPACE_TOKEN_VALUE}/g" "${md_file_name}"
		sed -i "s/\(${LIFERAY_LEARN_YOUTUBE_URL_TOKEN}\=\)\(\https:\/\/www.youtube.com\/embed\/.*\)/${LIFERAY_LEARN_YOUTUBE_BEGIN_HTML}\2${LIFERAY_LEARN_YOUTUBE_END_HTML}/" "${md_file_name}"
	done
}

main "${@}"