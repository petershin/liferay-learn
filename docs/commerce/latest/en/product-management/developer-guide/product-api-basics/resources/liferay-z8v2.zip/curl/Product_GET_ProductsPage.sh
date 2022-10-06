curl \
	 "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products" \
	 --data-urlencode "filter=$1" --data-urlencode "search=$2" --data-urlencode "sort=$3" --data-urlencode "pageSize=$4" --data-urlencode "page=$5" \
	 -u "test@liferay.com:learn" --get