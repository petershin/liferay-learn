curl \
	"http://localhost:8080/o/c/ables/${1}" \
	--data-raw '
		{
			"name": "Able One"
		}' \
	--header "Content-Type: application/json" \
	--request "PUT" \
	--user "test@liferay.com:learn"