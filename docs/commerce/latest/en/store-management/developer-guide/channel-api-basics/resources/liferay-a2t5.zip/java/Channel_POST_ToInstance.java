import com.liferay.headless.commerce.admin.channel.client.dto.v1_0.Channel;
import com.liferay.headless.commerce.admin.channel.client.resource.v1_0.ChannelResource;

public class Channel_POST_ToInstance {

	/**
	 * java -classpath .:* Channel_POST_ToInstance
	 */
	public static void main(String[] args) throws Exception {
		ChannelResource.Builder builder = ChannelResource.builder();

		ChannelResource channelResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(
			channelResource.postChannel(
				new Channel() {
					{
						currencyCode = "USD";						
						name = "Foo";
                  type = "site";
					}
				}));
	}

}