curl \
	"http://localhost:8080/o/headless-batch-engine/v1.0/export-task/${1}/${2}" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-u "test@liferay.com:learn"