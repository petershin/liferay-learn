curl \
	"http://localhost:8080/o/c/bakers/batch" \
	--data-raw '
		[
			{
				"name": "Baker 1",
				"externalReferenceCode": "baker-one"
			},
			{
				"name": "Baker 2",
				"externalReferenceCode": "baker-two"
			},
			{
				"name": "Baker 3",
				"externalReferenceCode": "baker-three"
			}
		]' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"