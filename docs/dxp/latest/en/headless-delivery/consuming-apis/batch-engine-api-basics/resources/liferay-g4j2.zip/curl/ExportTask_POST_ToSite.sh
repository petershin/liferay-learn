curl \
	"http://localhost:8080/o/headless-batch-engine/v1.0/export-task/${1}/${2}?siteId=${3}" \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"