curl \
	"http://localhost:8080/o/headless-delivery/v1.0/wiki-nodes/${1}" \
	--data-raw '
		{
			"description": "Bar",
			"name": "Baker Node"
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"