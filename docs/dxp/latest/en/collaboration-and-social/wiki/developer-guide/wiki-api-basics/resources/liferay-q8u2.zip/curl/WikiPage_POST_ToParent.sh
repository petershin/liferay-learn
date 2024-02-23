curl \
	"http://localhost:8080/o/headless-delivery/v1.0/wiki-pages/${1}/wiki-pages" \
	--data-raw '
		{
			"content": "Foo",
			"encodingFormat": "text/x-wiki",
			"headline": "Charlie Page"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"