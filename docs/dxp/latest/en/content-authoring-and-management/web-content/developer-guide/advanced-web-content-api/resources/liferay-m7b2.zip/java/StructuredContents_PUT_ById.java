import com.liferay.headless.delivery.client.dto.v1_0.ContentDocument;
import com.liferay.headless.delivery.client.dto.v1_0.ContentField;
import com.liferay.headless.delivery.client.dto.v1_0.ContentFieldValue;
import com.liferay.headless.delivery.client.dto.v1_0.StructuredContent;
import com.liferay.headless.delivery.client.resource.v1_0.StructuredContentResource;

public class StructuredContents_PUT_ById {

	/**
	 * java -classpath .:* -DstructuredContentId=1234 -DimageId=5678 -DcontentStructureId=91011 StructuredContents_PUT_ById
	 */
	public static void main(String[] args) throws Exception {
		StructuredContentResource.Builder builder =
			StructuredContentResource.builder();

		StructuredContentResource structuredContentResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		StructuredContent structuredContent = new StructuredContent();

		ContentField[] contentFields = new ContentField[4];

		ContentField textField = new ContentField();

		textField.setName("TextReference");

		ContentFieldValue textFieldValue = new ContentFieldValue();

		textFieldValue.setData("This text describes Goo.");

		textField.setContentFieldValue(textFieldValue);

		contentFields[0] = textField;

		ContentField imageField = new ContentField();

		imageField.setName("ImageReference");

		ContentFieldValue imageFieldValue = new ContentFieldValue();

		ContentDocument contentDocument = new ContentDocument();

		contentDocument.setId(Long.valueOf(System.getProperty("imageId")));

		contentDocument.setDescription("This text describes Goo's image.");

		imageFieldValue.setImage(contentDocument);

		imageField.setContentFieldValue(imageFieldValue);

		contentFields[1] = imageField;

		ContentField dateField = new ContentField();

		dateField.setName("DateReference");

		ContentFieldValue dateFieldValue = new ContentFieldValue();

		dateFieldValue.setData("2021-10-30T00:00:00Z");

		dateField.setContentFieldValue(dateFieldValue);

		contentFields[2] = dateField;

		ContentField selectionField = new ContentField();

		selectionField.setName("SingleSelectionReference");

		ContentFieldValue selectionFieldValue = new ContentFieldValue();

		selectionFieldValue.setData("Goo");

		selectionField.setContentFieldValue(selectionFieldValue);

		contentFields[3] = selectionField;

		structuredContent.setContentFields(contentFields);

		structuredContent.setContentStructureId(
			Long.valueOf(System.getProperty("contentStructureId")));

		structuredContent.setTitle("Baker");

		System.out.println(
			structuredContentResource.putStructuredContent(
				Long.valueOf(System.getProperty("structuredContentId")),
				structuredContent));
	}

}