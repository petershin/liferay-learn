import com.liferay.headless.commerce.admin.channel.client.resource.v1_0.ChannelResource;

public class Channel_DELETE_ById {

	/**
	 * java -classpath .:* -DchannelId=1234 Channel_DELETE_ById
	 */
	public static void main(String[] args) throws Exception {
		ChannelResource.Builder builder = ChannelResource.builder();

		ChannelResource channelResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		channelResource.deleteChannel(
			Long.valueOf(System.getProperty("channelId")));
	}

}