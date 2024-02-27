import com.liferay.captcha.rest.client.dto.v1_0.Captcha;
import com.liferay.captcha.rest.client.resource.v1_0.CaptchaResource;

import java.io.FileOutputStream;

import java.util.Base64;

public class Captcha_GET_FromInstance {

	/**
	 * java -classpath .:* Captcha_GET_FromInstance
	 */
	public static void main(String[] args) throws Exception {
		try {
			CaptchaResource.Builder builder = CaptchaResource.builder();

			CaptchaResource captchaResource = builder.authentication(
				"test@liferay.com", "learn"
			).build();

			Captcha captcha = captchaResource.getCaptchaChallenge();

			System.out.println("Token: " + captcha.getToken());

			byte[] imageBytes = Base64.getDecoder(
			).decode(
				captcha.getImage(
				).split(
					","
				)[1]
			);

			try (FileOutputStream fileOutputStream = new FileOutputStream(
					"captcha.png")) {

				fileOutputStream.write(imageBytes);
			}
		}
	}

}