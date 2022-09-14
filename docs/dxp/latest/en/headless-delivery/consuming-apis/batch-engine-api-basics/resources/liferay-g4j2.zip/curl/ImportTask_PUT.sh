curl \
-H "Content-Type: application/json" \
	-X PUT \
	"http://localhost:8080/o/headless-batch-engine/v1.0/import-task/${1}?siteId=${2}" \
-d "[{\"id\":43261,\"articleBody\":\"Goo\",\"headline\":\"Charlie\"},{\"id\":43266,\"articleBody\":\"Baz\",\"headline\":\"Dog\"}]" \
	-u "test@liferay.com:test1"