# Logging In and Using the CLI Tool

Now that the Delectable Bonsai site is up and running on Liferay Experience Cloud, Kyle is ready to start developing with [client extensions](https://learn.liferay.com/w/dxp/building-applications/client-extensions). To get started, he needs to install the [command-line tool](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) and access the [Cloud console](https://console.liferay.cloud).

Here, you'll log into the console and start using the CLI tool.

## Accessing the Cloud Console

When your Liferay Experience Cloud environment is set up, you receive an email inviting you to become an administrator. You receive separate email invitations to set up your administrator accounts for the Cloud console and for your Liferay instances.

If you haven't already done so, accept the invitations in these emails so you can log into the console (and your Liferay instances).

Once your account is set up, log in to the console at `https://console.liferay.cloud`. From there, you can see the UAT and production environments for your client extension projects.

![Your UAT and production environments are available in the Cloud console for you to see your running client extensions.](./logging-into-the-cloud-console/images/01.png)

## Install the CLI Tool

Open a command prompt on your system to install the tool. Run this command:

```bash
curl https://cdn.liferay.cloud/lcp/stable/latest/install.sh -fsSL | sudo bash
```

```{note}
If you have a Windows environment, you can download and run the [Windows installer](https://cdn.liferay.cloud/lcp/stable/latest/lcp-install.exe) instead.
```

Once this completes, you are able to use the tool with the `lcp` command.

## Use the Tool to Log In

You must also log in through the CLI tool to be able to deploy client extension projects with it.

Run the `lcp login` command to log in, and enter `y` when prompted to open a browser.

![The CLI tool prompts you to log in via your browser.](./using-the-cli-tool/images/02.png)

A browser tab automatically opens and directs you to `https://console.liferay.cloud/login`. If your previous access to the console doesn't automatically work, log in again with the credentials you received to authorize the CLI tool in your command prompt.

![Once you're logged in, your CLI tool is authorized to access your environments in the console.](./using-the-cli-tool/images/03.png)

Now the tool can connect to your environments and you can use it to deploy your client extension projects.

Next, you'll deploy a microservice client extension to your UAT environment and see it running in the console.

## Relevant Concepts

* [Liferay Cloud Command-Line Tool](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool)
