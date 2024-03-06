package com.acme.x6n5.dog.internal.messaging;

import com.liferay.portal.kernel.messaging.Message;
import com.liferay.portal.kernel.messaging.MessageListener;

import org.osgi.service.component.annotations.Component;

@Component(
	property = "destination.name=acme/x6n5_able",
	service = MessageListener.class
)
public class X6N5DogMessageListener implements MessageListener {

	@Override
	public void receive(Message message) {
		System.out.println(
			"Received message payload " + message.getPayload());

		message.setResponse("X6N5DogMessageListener");
	}

}