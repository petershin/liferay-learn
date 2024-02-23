curl \
	"http://localhost:8080/o/c/ables/" \
	--data-raw '
		{
			"name": "Able 1"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/ables/" \
	--data-raw '
		{
			"name": "Able 2"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/ables/" \
	--data-raw '
		{
			"name": "Able 3"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"