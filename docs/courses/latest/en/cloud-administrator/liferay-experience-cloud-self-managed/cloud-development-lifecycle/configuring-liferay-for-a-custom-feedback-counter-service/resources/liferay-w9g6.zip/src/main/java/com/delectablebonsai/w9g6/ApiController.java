package com.delectablebonsai.w9g6;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.json.JsonParser;
import org.springframework.boot.json.JsonParserFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.client.AuthorizedClientServiceOAuth2AuthorizedClientManager;
import org.springframework.security.oauth2.client.OAuth2AuthorizeRequest;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

@Controller
public class ApiController {

	@GetMapping("/api/helpfulfeedback")
	public ResponseEntity<String> getHelpfulFeedback() throws Exception {
		HttpHeaders headers = new HttpHeaders();

		String oAuth2Token = getOAuth2Token();

		headers.add(HttpHeaders.AUTHORIZATION, "Bearer " + oAuth2Token);
		headers.add(HttpHeaders.CONTENT_TYPE, "application/json");

		HttpEntity<Void> request = new HttpEntity<>(headers);

		String filter = "/?filter=helpful eq true";

		String url = _scheme + "://" + _host + "/o/c/feedbackinputs" + filter;

		RestTemplate restTemplate = restTemplate();

		ResponseEntity<String> response = restTemplate.exchange(
			url, HttpMethod.GET, request, String.class);

		JsonParser responseParser = JsonParserFactory.getJsonParser();

		Map<String, Object> jsonMap = responseParser.parseMap(
			response.getBody());

		return new ResponseEntity<>(
			"Helpful: " + jsonMap.get("totalCount"), HttpStatus.OK);
	}

	@GetMapping("/api/nothelpfulfeedback")
	public ResponseEntity<String> getNotHelpfulFeedback() throws Exception {
		HttpHeaders headers = new HttpHeaders();

		headers.add(HttpHeaders.AUTHORIZATION, "Bearer " + getOAuth2Token());
		headers.add(HttpHeaders.CONTENT_TYPE, "application/json");

		HttpEntity<Void> request = new HttpEntity<>(headers);

		String filter = "/?filter=helpful eq false";

		String url = _scheme + "://" + _host + "/o/c/feedbackinputs" + filter;

		RestTemplate restTemplate = restTemplate();

		ResponseEntity<String> response = restTemplate.exchange(
			url, HttpMethod.GET, request, String.class);

		JsonParser responseParser = JsonParserFactory.getJsonParser();

		Map<String, Object> jsonMap = responseParser.parseMap(
			response.getBody());

		return new ResponseEntity<>(
			"Not helpful: " + jsonMap.get("totalCount"), HttpStatus.OK);
	}

	@Bean
	public RestTemplate restTemplate() {
		return new RestTemplate();
	}

	private String getOAuth2Token() {
		OAuth2AuthorizedClient oAuth2AuthorizedClient =
			_authorizedClientServiceOAuth2AuthorizedClientManager.authorize(
				OAuth2AuthorizeRequest.withClientRegistrationId(
					"my-oauth-application"
				).principal(
					"SpringBootWebApp"
				).build());

		return oAuth2AuthorizedClient.getAccessToken(
		).getTokenValue();
	}

	@Autowired
	private AuthorizedClientServiceOAuth2AuthorizedClientManager
		_authorizedClientServiceOAuth2AuthorizedClientManager;

	@Value("${liferay.host}")
	private String _host;

	@Value("${liferay.port}")
	private String _port;

	@Value("${liferay.scheme}")
	private String _scheme;

}