curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/wiki-nodes" \
	--data-raw '
		{
			"description": "Foo",
			"name": "Able Node"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"