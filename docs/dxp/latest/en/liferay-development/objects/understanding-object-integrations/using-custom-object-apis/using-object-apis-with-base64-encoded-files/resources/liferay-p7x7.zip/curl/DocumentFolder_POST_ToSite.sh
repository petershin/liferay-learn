curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/document-folders" \
	--data-raw '{
		"description": "able folder description",
		"externalReferenceCode": "able-folder",
		"name": "able folder"
	}' \
	--header "Content-type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"