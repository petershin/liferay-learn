curl \
-H "Content-Type: application/json" \
	-X DELETE \
	"http://localhost:8080/o/headless-batch-engine/v1.0/import-task/${1}?siteId=${2}" \
-d "[{\"id\":43261},{\"id\":43266}]" \
	-u "test@liferay.com:test1"