function main {
	if [ "${#}" -ne 2 ]
	then
		echo "You must pass 2 arguments: the site ID of the default site (e.g., 20120), and"
		echo "the site ID of the global site (e.g., 20122). Find these IDs in each site's Site"
		echo "Settings > Site Configuration screen."

		exit 1
	fi

	echo "Hello World!" > b9f3.txt

	curl \
		"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/documents" \
		--form "document={\"description\": \"Baker\", \"title\": \"Able Document\"}" \
		--form "file=@b9f3.txt" \
		--header "Content-Type: multipart/form-data" \
		--request "POST" \
		--user "test@liferay.com:learn"

	local documentFolderId=$(curl \
		"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/document-folders" \
		--data-raw '
			{
				"name": "Able Document Folder"
			}' \
		--header "Content-Type: application/json" \
		--request "POST" \
		--user "test@liferay.com:learn" | \
		jq '.id'
	)

	curl \
		"http://localhost:8080/o/headless-delivery/v1.0/document-folders/${documentFolderId}/documents" \
		--form "document={\"description\": \"Baker\", \"title\": \"Able Document\"}" \
		--form "file=@b9f3.txt" \
		--header "Content-Type: multipart/form-data" \
		--request "POST"
		--user "test@liferay.com:learn"

	local contentStructuredId=$(curl \
		"http://localhost:8080/o/headless-delivery/v1.0/sites/${2}/content-structures?search=Basic%20Web%20Content" \
		--user "test@liferay.com:learn" | \
		jq '.items[].id'
	)

	curl \
		"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/structured-contents" \
		--data-raw '
			{
				"contentFields": [
					{
					"contentFieldValue": {
						"data": "<p>Foo</p>"
					},
					"name": "content"
					}
				],
				"contentStructureId": "${contentStructuredId}",
				"title": "Able Content"
			} ' \
		--header "Content-Type: application/json" \
		--request "POST" \
		--user "test@liferay.com:learn"

	local structuredContentFolderId=$(curl \
		"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/structured-content-folders" \
		--data-raw '
			{
				"description": "Foo",
				"name": "Able Content Folder"
			}' \
		--header "Content-Type: application/json" \
		--request "POST" \
		--user "test@liferay.com:learn" | \
		jq '.id'
	)

	curl \
		"http://localhost:8080/o/headless-delivery/v1.0/structured-content-folders/${structuredContentFolderId}/structured-contents" \
		--data-raw '
			{
				"contentFields": [
					{
					"contentFieldValue": {
						"data": "<p>Foo</p>"
					},
					"name": "content"
					}
				],
				"contentStructureId": "${contentStructuredId}",
				"title": "Able Content"
			}' \
		--header "Content-Type: application/json" \
		--request "POST" \
		--user "test@liferay.com:learn"

	rm -f b9f3.txt
}

main "${@}"