curl \
	"http://localhost:8080/o/headless-commerce-admin-order/v1.0/orders" \
	-H "Content-Type: application/json" \
	-X "POST" \
	-d "{\"accountId\": ${1}, \"channelId\": ${2}, \"currencyCode\": \"${3}\"}" \
	-u "test@liferay.com:learn"