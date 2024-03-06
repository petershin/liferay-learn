curl \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}" \
	--data-raw '
		{
			"name": "Able 1 - Bar",
			"externalReferenceCode": "able-one"
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"

curl \
	"http://localhost:8080/o/c/ables/by-external-reference-code/${1}" \
	--data-raw '
		{
			"name": "Able 1 - Goo",
			"externalReferenceCode": "able-one"
		}' \
	--header "Content-Type: application/json" \
	--request "PATCH" \
	--user "test@liferay.com:learn"