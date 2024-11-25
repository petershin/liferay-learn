---
toc:
  - ./message-bus/listening-for-messages.md
  - ./message-bus/using-asynchronous-messaging.md
  - ./message-bus/using-default-synchronous-messaging-in-previous-versions.md
  - ./message-bus/using-direct-synchronous-messaging-in-previous-versions.md
  - ./message-bus/listening-for-registration-events.md
  - ./message-bus/tuning-messaging-performance.md
uuid: 057c9607-a1e7-4f8c-8442-e22eef0138a5
taxonomy-category-names:
- Development and Tooling
- Core Frameworks
- Liferay Self-Hosted
- Liferay PaaS
---
# Message Bus

The Message Bus provides a loosely coupled way to exchange messages. A class sending a message invokes the Message Bus to send the message to a destination, while other classes (*listeners*) registered at that destination receive the message. The listeners are transparent to senders and vice-versa.

Here are the main messaging components:

**Destinations:** Logical (not physical), named locations where messages are sent.

**Listeners:** Classes that *listen* for messages sent to specific destinations.

**Message Bus:** The framework that handles destination registration and sends messages to listeners.

**Messages:** Objects that can contain a payload and metadata, including an optional response destination.

**Senders:** Arbitrary classes that invoke Message Bus to send messages to a destination's listeners.

The figure below demonstrates component interaction.

![Example Messaging Component Interaction](./message-bus/images/01.png)

Here is an example interaction sequence:

1. An arbitrary class sends a `Message` to a registered `Destination`.
1. Message Bus dispatches the `Message` to the destionation's registered `MessageListener`s.

The message sender is only concerned with using Message Bus to send the message to the destination; it is not concerned with the message recipients. The message listeners are only concerned with receiving messages at the destination; they are not concerned with the message sender.

## Synchronous and Asynchronous Messaging

Message Bus sends messages synchronously and asynchronously.

```{important}
Synchronous messaging was removed and is no longer supported for Liferay DXP 7.4 U49/Liferay Portal 7.4 GA49 and above.
```

**Synchronous Messaging:** The sender blocks after sending a message. When the sender's condition (determined by the sender type) is met, the sender unblocks and continues processing.

**Asynchronous Messaging:** The sender immediately continues processing after sending a message.

The following topics cover both ways of messaging:

* [Using Asynchronous Messaging](./message-bus/using-asynchronous-messaging.md) shows how to configure a destination and send messages asynchronously to it. This is the simplest way to send messages.

* [Using Default Synchronous Messaging in Previous Versions](./message-bus/using-default-synchronous-messaging-in-previous-versions.md) demonstrates a message sender blocking until one listener responds to the message *or*, if no listener responds, until the message times out.

* [Using Direct Synchronous Messaging in Previous Versions](./message-bus/using-default-synchronous-messaging-in-previous-versions.md) shows a message sender blocking on sending a message until *all* listeners receive the message.

## Tuning Performance

The Message Bus API facilitates monitoring registration events, destinations, destination message listeners, and message queues. You can configure Message Bus components to meet your needs by adjusting destination types, message queue parameters, and thread parameters. See [Tuning Messaging Performance](./message-bus/tuning-messaging-performance.md) for more information.

## What's Next

Listening on Liferay's built-in destinations is a great way to begin using Message Bus. Start with [Listening for Messages](./message-bus/listening-for-messages.md) next.
