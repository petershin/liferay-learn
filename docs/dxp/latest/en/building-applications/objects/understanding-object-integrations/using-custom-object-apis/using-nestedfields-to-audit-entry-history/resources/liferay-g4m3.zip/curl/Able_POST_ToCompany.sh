curl \
	"http://localhost:8080/o/c/ables/" \
	--data-raw '
		{
			"name": "Able 1 - Foo",
			"externalReferenceCode": "able-one"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/ables/" \
	--data-raw '
		{
			"name": "Able 2 - Foo",
			"externalReferenceCode": "able-two"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/ables/" \
	--data-raw '
		{
			"name": "Able 3 - Foo",
			"externalReferenceCode": "able-three"
		}' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"