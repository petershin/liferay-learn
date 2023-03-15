import com.liferay.headless.commerce.admin.channel.client.dto.v1_0.Channel;
import com.liferay.headless.commerce.admin.channel.client.pagination.Pagination;
import com.liferay.headless.commerce.admin.channel.client.resource.v1_0.ChannelResource;

public class Channels_GET_FromInstance {

	/**
	 * java -classpath .:* Channels_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		ChannelResource.Builder builder = ChannelResource.builder();

		ChannelResource channelResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		System.out.println(channelResource.getChannelsPage(
			null, null, Pagination.of(1, 2), null););
	}

}