curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/document-folders" \
	--data-raw '{
		"description": "This folder stores the attachment files for this exercise.",
		"externalReferenceCode": "ABLE_FOLDER",
		"name": "Able Folder"
	}' \
	--header "Content-type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"