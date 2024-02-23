curl \
	"http://localhost:8080/o/c/ables/" \
	--data-raw '
		{
			"name": "Able 1",
			"externalReferenceCode": "able-one"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/ables/" \
	--data-raw '
		{
			"name": "Able 2",
			"externalReferenceCode": "able-two"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/ables/" \
	--data-raw '
		{
			"name": "Able 3",
			"externalReferenceCode": "able-three"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"

