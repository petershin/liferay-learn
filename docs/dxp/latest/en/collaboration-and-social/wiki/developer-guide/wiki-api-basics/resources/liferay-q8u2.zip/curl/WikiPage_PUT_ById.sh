curl \
	"http://localhost:8080/o/headless-delivery/v1.0/wiki-pages/${1}" \
	--data-raw '
		{
			"content": "Bar",
			"encodingFormat": "text/x-wiki",
			"headline": "Baker Page"
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"