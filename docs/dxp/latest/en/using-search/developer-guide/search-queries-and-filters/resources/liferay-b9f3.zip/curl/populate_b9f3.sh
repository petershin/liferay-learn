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
		-F "document={\"description\": \"Baker\", \"title\": \"Able Document\"}" \
		-F "file=@b9f3.txt" \
		-H "Content-Type: multipart/form-data" \
		-X "POST" \
		-u "test@liferay.com:learn"

	local documentFolderId=$(curl \
		"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/document-folders" \
		-H "Content-Type: application/json" \
		-X "POST" \
		-d "{\"name\": \"Able Document Folder\"}" \
		-u "test@liferay.com:learn" | \
		jq '.id'
	)

	curl \
		"http://localhost:8080/o/headless-delivery/v1.0/document-folders/${documentFolderId}/documents" \
		-F "document={\"description\": \"Baker\", \"title\": \"Able Document\"}" \
		-F "file=@b9f3.txt" \
		-H "Content-Type: multipart/form-data" \
		-X "POST"
		-u "test@liferay.com:learn"

	local contentStructuredId=$(curl \
		"http://localhost:8080/o/headless-delivery/v1.0/sites/${2}/content-structures?search=Basic%20Web%20Content" \
		-u "test@liferay.com:learn" | \
		jq '.items[].id'
	)

	curl \
		"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/structured-contents" \
		-H "Content-Type: application/json" \
		-X "POST" \
		-d "{\"contentFields\": [{\"contentFieldValue\": {\"data\": \"<p>Foo</p>\"}, \"name\": \"content\"}], \"contentStructureId\": \"${contentStructuredId}\", \"title\": \"Able Content\"}" \
		-u "test@liferay.com:learn"

	local structuredContentFolderId=$(curl \
		"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/structured-content-folders" \
		-H "Content-Type: application/json" \
		-X "POST" \
		-d "{\"description\": \"Foo\", \"name\": \"Able Content Folder\"}" \
		-u "test@liferay.com:learn" | \
		jq '.id'
	)

	curl \
		"http://localhost:8080/o/headless-delivery/v1.0/structured-content-folders/${structuredContentFolderId}/structured-contents" \
		-H "Content-Type: application/json" \
		-X "POST" \
		-d "{\"contentFields\": [{\"contentFieldValue\": {\"data\": \"<p>Foo</p>\"}, \"name\": \"content\"}], \"contentStructureId\": \"${contentStructuredId}\", \"title\": \"Able Content\"}" \
		-u "test@liferay.com:learn"

	rm -f b9f3.txt
}

main "${@}"