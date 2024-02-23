curl \
	"http://localhost:8080/o/headless-delivery/v1.0/knowledge-base-folders/${1}" \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--data-raw '
		{
			"description": "Bar"
		}' \
	--user "test@liferay.com:learn"