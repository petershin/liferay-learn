curl \
	"http://localhost:8080/o/headless-delivery/v1.0/document-shortcuts/${1}" \
	--data-raw '{
		"folderId": "'${2}'",
		"targetDocumentId": "'${3}'",
		"viewableBy": "Anyone"
	}' \
	--header "Content-type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"