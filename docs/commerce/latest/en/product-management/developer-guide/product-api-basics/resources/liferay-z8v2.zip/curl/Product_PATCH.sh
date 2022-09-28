curl \
	-H "Content-Type: application/json" \
	-X PATCH \
"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products/${1}" \
-d "{\"active\":true,\"catalogId\":46966,\"productType\":\"simple\",\"name\":{\"en_US\":\"Goo\"}}" \
	-u "test@liferay.com:learn"