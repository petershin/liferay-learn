curl \
	"http://localhost:8080/o/headless-commerce-admin-pricing/v2.0/discounts/${1}" \
	-H "Content-Type: application/json" \
	-X "PATCH" \
	-d "{\"limitationType\": \"unlimited\", \"target\": \"subtotal\", \"title\": \"Bar\"}" \
	-u "test@liferay.com:learn"