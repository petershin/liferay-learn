curl \
	"http://localhost:8080/o/headless-delivery/v1.0/document-folders/${1}" \
	--data-raw '
		{
			"name": "Goo"
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"