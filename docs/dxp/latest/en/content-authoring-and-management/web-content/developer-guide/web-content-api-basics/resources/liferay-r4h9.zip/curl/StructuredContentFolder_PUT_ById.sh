curl \
	"http://localhost:8080/o/headless-delivery/v1.0/structured-content-folders/${1}" \
	--data-raw '
		{
			"description": "Goo",
			"name": "Baker Folder"
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"