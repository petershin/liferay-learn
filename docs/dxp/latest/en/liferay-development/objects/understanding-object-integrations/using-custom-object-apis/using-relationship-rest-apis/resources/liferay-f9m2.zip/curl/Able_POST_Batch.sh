curl \
	"http://localhost:8080/o/c/ables/batch" \
	--data-raw '
		[
			{
				"name": "Able 1",
				"externalReferenceCode": "able-one"
			},
			{
				"name": "Able 2",
				"externalReferenceCode": "able-two"
			},
			{
				"name": "Able 3",
				"externalReferenceCode": "able-three"
			}
		]' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"