curl \
	"http://localhost:8080/o/headless-delivery/v1.0/documents/${1}?nestedFields=contentValue&fields=contentValue" \
	--user "test@liferay.com:learn" \
	| sed -n "2 p" \
	| awk -F ":" '{print $2}' \
	| tr -d " \"" \
	| base64 -d