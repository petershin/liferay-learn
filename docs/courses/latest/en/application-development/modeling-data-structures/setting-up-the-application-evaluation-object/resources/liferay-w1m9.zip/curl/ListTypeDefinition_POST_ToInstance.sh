curl \
	"http://localhost:8080/o/headless-admin-list-type/v1.0/list-type-definitions/batch" \
	--data-raw '
		[
			{
				"externalReferenceCode": "LIST_ASSESSMENT_SCORES",
				"listTypeEntries": [
					{
						"externalReferenceCode": "SCORE_EXCELLENT",
						"key": "excellent",
						"name": "Excellent",
						"name_i18n": {
							"en-US": "Excellent"
						},
						"type": ""
					},
					{
						"externalReferenceCode": "SCORE_GOOD",
						"key": "good",
						"name": "Good",
						"name_i18n": {
							"en-US": "Good"
						},
						"type": ""
					},
					{
						"externalReferenceCode": "SCORE_AVERAGE",
						"key": "average",
						"name": "Average",
						"name_i18n": {
							"en-US": "Average"
						},
						"type": ""
					},
					{
						"externalReferenceCode": "SCORE_FAIR",
						"key": "fair",
						"name": "Fair",
						"name_i18n": {
							"en-US": "Fair"
						},
						"type": ""
					},
					{
						"externalReferenceCode": "SCORE_POOR",
						"key": "poor",
						"name": "Poor",
						"name_i18n": {
							"en-US": "Poor"
						},
						"type": ""
					}
				],
				"name": "Assessment Scores",
				"name_i18n": {
					"en-US": "Assessment Scores"
				}
			},
			{
				"externalReferenceCode": "LIST_RECOMMENDATIONS",
				"listTypeEntries": [
					{
						"externalReferenceCode": "REC_REQUEST_ADDITIONAL_DOCUMENTS",
						"key": "requestAdditionalDocuments",
						"name": "Request Additional Documents",
						"name_i18n": {
							"en-US": "Request Additional Documents"
						},
						"type": ""
					},
					{
						"externalReferenceCode": "REC_SCHEDULE_FOLLOWUP_INTERVIEW",
						"key": "scheduleFollowupInterview",
						"name": "Schedule Follow-up Interview",
						"name_i18n": {
							"en-US": "Schedule Follow-up Interview"
						},
						"type": ""
					},
					{
						"externalReferenceCode": "REC_PROPOSE_APPROVAL",
						"key": "proposeApproval",
						"name": "Propose Approval",
						"name_i18n": {
							"en-US": "Propose Approval"
						},
						"type": ""
					},
					{
						"externalReferenceCode": "REC_PROPOSE_CONDITIONAL_APPROVAL",
						"key": "proposeConditionalApproval",
						"name": "Propose Conditional Approval",
						"name_i18n": {
							"en-US": "Propose Conditional Approval"
						},
						"type": ""
					},
					{
						"externalReferenceCode": "REC_DECLINE_APPLICATION",
						"key": "declineApplication",
						"name": "Decline Application",
						"name_i18n": {
							"en-US": "Decline Application"
						},
						"type": ""
					},
					{
						"externalReferenceCode": "REC_SEEK_LEGAL_REVIEW",
						"key": "seekLegalReview",
						"name": "Seek Legal Review",
						"name_i18n": {
							"en-US": "Seek Legal Review"
						},
						"type": ""
					}
				],
				"name": "Recommendations",
				"name_i18n": {
					"en-US": "Recommendations"
				}
			},
			{
				"externalReferenceCode": "LIST_DECISIONS",
				"listTypeEntries": [
					{
						"externalReferenceCode": "DECISION_APPROVED",
						"key": "approved",
						"name": "Approved",
						"name_i18n": {
							"en-US": "Approved"
						},
						"type": ""
					},
					{
						"externalReferenceCode": "DECISION_APPROVED_WITH_CONDITIONS",
						"key": "approvedWithConditions",
						"name": "Approved with Conditions",
						"name_i18n": {
							"en-US": "Approved with Conditions"
						},
						"type": ""
					},
					{
						"externalReferenceCode": "DECISION_REJECTED",
						"key": "rejected",
						"name": "Rejected",
						"name_i18n": {
							"en-US": "Rejected"
						},
						"type": ""
					},
					{
						"externalReferenceCode": "DECISION_HOLD_FOR_FUTURE_CONSIDERATION",
						"key": "holdForFutureConsideration",
						"name": "Hold for Future Consideration",
						"name_i18n": {
							"en-US": "Hold for Future Consideration"
						},
						"type": ""
					},
					{
						"externalReferenceCode": "DECISION_WITHDRAWN",
						"key": "withdrawn",
						"name": "Withdrawn",
						"name_i18n": {
							"en-US": "Withdrawn"
						},
						"type": ""
					}
				],
				"name": "Decisions",
				"name_i18n": {
					"en-US": "Decisions"
				}
			}
		]' \
	--header "Content-Type: application/json" \
	--request "POST" \
	--user "test@liferay.com:learn"