curl \
	"http://localhost:8080/o/headless-batch-engine/v1.0/import-task/${1}?siteId=${2}" \
	--data-raw '
		[
			{
				"articleBody": "Foo",
				"headline": "Able"
			},
			{
				"articleBody": "Bar",
				"headline": "Baker"
			}
		]' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"