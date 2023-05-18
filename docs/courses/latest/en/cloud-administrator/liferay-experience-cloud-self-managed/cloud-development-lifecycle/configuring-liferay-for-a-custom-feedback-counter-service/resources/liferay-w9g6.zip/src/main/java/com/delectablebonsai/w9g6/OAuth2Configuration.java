package com.delectablebonsai.w9g6;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.oauth2.client.AuthorizedClientServiceOAuth2AuthorizedClientManager;
import org.springframework.security.oauth2.client.InMemoryOAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientProviderBuilder;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.core.ClientAuthenticationMethod;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class OAuth2Configuration {

	@Bean
	public AuthorizedClientServiceOAuth2AuthorizedClientManager
		authorizedClientServiceOAuth2AuthorizedClientManager(
			ClientRegistrationRepository clientRegistrationRepository,
			OAuth2AuthorizedClientService oAuth2AuthorizedClientService) {

		AuthorizedClientServiceOAuth2AuthorizedClientManager
			authorizedClientServiceOAuth2AuthorizedClientManager =
				new AuthorizedClientServiceOAuth2AuthorizedClientManager(
					clientRegistrationRepository,
					oAuth2AuthorizedClientService);

		authorizedClientServiceOAuth2AuthorizedClientManager.
			setAuthorizedClientProvider(
				OAuth2AuthorizedClientProviderBuilder.builder(
				).clientCredentials(
				).build());

		return authorizedClientServiceOAuth2AuthorizedClientManager;
	}

	@Bean
	public ClientRegistrationRepository clientRegistrationRepository() {
		ClientRegistration clientRegistration =
			ClientRegistration.withRegistrationId(
				"my-oauth-application"
			).tokenUri(
				_scheme + "://" + _host + "/o/oauth2/token"
			).clientId(
				_clientId
			).clientSecret(
				_clientSecret
			).authorizationGrantType(
				AuthorizationGrantType.CLIENT_CREDENTIALS
			).clientAuthenticationMethod(
				ClientAuthenticationMethod.CLIENT_SECRET_POST
			).build();

		return new InMemoryClientRegistrationRepository(
			Collections.singletonList(clientRegistration));
	}

	@Bean
	public OAuth2AuthorizedClientService oAuth2AuthorizedClientService(
		ClientRegistrationRepository clientRegistrationRepository) {

		return new InMemoryOAuth2AuthorizedClientService(
			clientRegistrationRepository);
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity)
		throws Exception {

		return httpSecurity.sessionManagement(
		).sessionCreationPolicy(
			SessionCreationPolicy.STATELESS
		).and(
		).authorizeHttpRequests(
			customizer -> customizer.antMatchers(
				"/*", "/api/*"
			).permitAll(
			).anyRequest(
			).authenticated()
		).build();
	}

	@Value("${OAUTH2_CLIENT_ID}")
	private String _clientId;

	@Value("${OAUTH2_CLIENT_SECRET}")
	private String _clientSecret;

	@Value("${liferay.host}")
	private String _host;

	@Value("${liferay.port}")
	private String _port;

	@Value("${liferay.scheme}")
	private String _scheme;

}