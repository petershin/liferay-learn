curl \
	"http://localhost:8080/o/headless-delivery/v1.0/structured-content-folders/${1}" \
	--data-raw '
		{
			"description": "Bar"
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"