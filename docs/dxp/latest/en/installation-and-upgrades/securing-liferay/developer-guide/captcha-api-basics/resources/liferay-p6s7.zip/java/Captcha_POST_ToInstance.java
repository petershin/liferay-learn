import com.liferay.captcha.rest.client.dto.v1_0.Captcha;
import com.liferay.captcha.rest.client.resource.v1_0.CaptchaResource;

public class Captcha_POST_ToInstance {

	/**
	 * java -classpath .:* -Danswer=abcd -Dtoken=efgh Captcha_POST_ToInstance
	 */
	public static void main(String[] args) throws Exception {
		CaptchaResource.Builder builder = CaptchaResource.builder();

		CaptchaResource captchaResource = builder.authentication(
			"test@liferay.com", "learn"
		).build();

		captchaResource.postCaptchaResponse(
			new Captcha() {
				{
					answer = String.valueOf(System.getProperty("answer"));
					token = String.valueOf(System.getProperty("token"));
				}
			});
	}

}