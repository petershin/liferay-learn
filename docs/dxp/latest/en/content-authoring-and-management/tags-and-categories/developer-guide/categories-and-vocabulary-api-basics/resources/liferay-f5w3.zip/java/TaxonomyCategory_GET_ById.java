import com.liferay.headless.admin.taxonomy.client.resource.v1_0.TaxonomyCategoryResource;

public class TaxonomyCategory_GET_ById {

	/**
	 * java -classpath .:* -DtaxonomyCategoryId=1234 TaxonomyCategory_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		TaxonomyCategoryResource.Builder builder =
			TaxonomyCategoryResource.builder();

		TaxonomyCategoryResource taxonomyCategoryResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			taxonomyCategoryResource.getTaxonomyCategory(
				String.valueOf(System.getProperty("taxonomyCategoryId"))));
	}

}