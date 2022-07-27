import com.liferay.headless.delivery.client.dto.v1_0.KnowledgeBaseFolder;
import com.liferay.headless.delivery.client.pagination.Page;
import com.liferay.headless.delivery.client.pagination.Pagination;
import com.liferay.headless.delivery.client.resource.v1_0.KnowledgeBaseFolderResource;

public class KnowledgeBaseFolders_GET_FromSite {

	/**
	 * java -classpath .:* -DsiteId=1234 KnowledgeBaseFolders_GET_FromSite
	 */
	public static void main(String[] args) throws Exception {
		KnowledgeBaseFolderResource.Builder builder =
			KnowledgeBaseFolderResource.builder();

		KnowledgeBaseFolderResource knowledgeBaseFolderResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		Page<KnowledgeBaseFolder> page =
			knowledgeBaseFolderResource.getSiteKnowledgeBaseFoldersPage(
				Long.valueOf(System.getProperty("siteId")),
				Pagination.of(1, 2));

		System.out.println(page);
	}

}