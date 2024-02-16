curl \
	-H "Content-Type: application/json" \
	-X "POST" \
	"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions" \
	-d "{\"externalReferenceCode\":\"LIST_ORDER_TYPES\",\"listTypeEntries\":[{\"externalReferenceCode\":\"ORDER_TYPE_WHOLESALE\",\"key\":\"wholesale\",\"name\":\"Wholesale\",\"name_i18n\":{\"en-US\":\"Wholesale\"},\"type\":\"\"},{\"externalReferenceCode\":\"ORDER_TYPE_PRIVATE_LABELING\",\"key\":\"privateLabeling\",\"name\":\"Private Labeling\",\"name_i18n\":{\"en-US\":\"Private Labeling\"},\"type\":\"\"},{\"externalReferenceCode\":\"ORDER_TYPE_BULK_FORMATS\",\"key\":\"bulkFormats\",\"name\":\"Bulk Formats\",\"name_i18n\":{\"en-US\":\"Bulk Formats\"},\"type\":\"\"},{\"externalReferenceCode\":\"ORDER_TYPE_NOT_SURE\",\"key\":\"notSure\",\"name\":\"Not Sure\",\"name_i18n\":{\"en-US\":\"Not Sure\"},\"type\":\"\"}],\"name\":\"Order Types\",\"name_i18n\":{\"en-US\":\"Order Types\"}}" \
	-u "test@liferay.com:learn"