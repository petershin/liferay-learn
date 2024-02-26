curl \
	"http://localhost:8080/o/headless-delivery/v1.0/navigation-menus/${1}" \
	--data-binary '
		{
			"name": "Bar"
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"