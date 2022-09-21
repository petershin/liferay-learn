import com.liferay.headless.delivery.client.resource.v1_0.MessageBoardSectionResource;

public class MessageBoardSection_GET_ById {

	/**
	 * java -classpath .:* -DmessageBoardSectionId=1234 MessageBoardSection_GET_ById
	 */
	public static void main(String[] args) throws Exception {
		MessageBoardSectionResource.Builder builder =
			MessageBoardSectionResource.builder();

		MessageBoardSectionResource messageBoardSectionResource =
			builder.authentication(
				"test@liferay.com", "learn"
			).build();

		System.out.println(
			messageBoardSectionResource.getMessageBoardSection(
				Long.valueOf(System.getProperty("messageBoardSectionId"))));
	}

}