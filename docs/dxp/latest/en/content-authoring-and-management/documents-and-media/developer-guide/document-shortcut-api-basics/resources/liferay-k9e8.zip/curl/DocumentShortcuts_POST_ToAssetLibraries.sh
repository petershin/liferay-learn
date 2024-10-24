curl \
	"http://localhost:8080/o/headless-delivery/v1.0/asset-libraries/${1}/document-shortcuts" \
	--data-raw '{
		"folderId": "'${2}'",
		"targetDocumentId": "'${3}'",
		"viewableBy": "Anyone"
	}' \
	--header "accept: application/json" \
	--header "Content-type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"