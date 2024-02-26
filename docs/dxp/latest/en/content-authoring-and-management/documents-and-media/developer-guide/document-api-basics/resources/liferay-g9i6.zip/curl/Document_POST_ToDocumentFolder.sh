curl \
	"http://localhost:8080/o/headless-delivery/v1.0/document-folders/${1}/documents" \
	--form "file=@Document_POST_ToDocumentFolder.sh" \
	--header "Content-Type: multipart/form-data" \
	--request "POST" \
	--user "test@liferay.com:learn"