curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/document-folders" \
	--data-raw '
		{
			"name": "Goo"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"