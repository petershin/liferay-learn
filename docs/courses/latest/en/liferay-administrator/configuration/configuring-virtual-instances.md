---
uuid: f6380d67-6784-46a4-8723-46fcc24177a5
---
# Configuring Virtual Instances

You may have a business use case where you need another Liferay environment with its own set of sites, users, and organizations. Rather than spin up a brand new server, you can create a virtual instance.

For example, Delectable Bonsai also sells maple syrup as a white label product. Other companies purchase the syrup and add their own branding to it. Delectable Bonsai runs a virtual instance to host their separate, white label side of the business.

<!-- So we're creating more than two virtual instances? We had only defined two when we did the brainstorm. Or is this the same as the B2B site? -Rich -->

## Virtual Instances in LXC

Contact your Liferay Cloud support person for setting up virtual instances.

## Virtual Instances in LXC-SM and On Premises

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Virtual Instances_.

1. Click _Add_ (![Add icon](../../images/icon-add.png)) and enter the following information.

   * Web ID: `www.bulkbonsaimaplesyrup.com`
   * Virtual Host: `www.bulkbonsaimaplesyrup.com`
   * Mail Domain: `bulkbonsaimaplesyrup.com`
   * Max Users: `0` (note, this means unlimited users)
   * Active: toggle on
   * Virtual Instance Initializer: select _Blank Site_.

<!-- Maybe we need a placeholder here; as we create the web content modules, we may be able to select a virtual instance importer that we created. Then we'll have something better than a blank one. --Rich -->

   ![Enter the virtual instance information.](./configuring-virtual-instances/images/01.png)

   Click _Save_. Your new virtual instance ready.

```{note}
It is up to you to configure the domain name and its corresponding server address.
```

The next step is configuring [file storage](./using-file-storage.md).

## Relevant Concepts

- [Understanding Virtual Instances](https://learn.liferay.com/dxp/latest/en/system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.html)
- [Adding a Virtual Instance](https://learn.liferay.com/dxp/latest/en/system-administration/configuring-liferay/virtual-instances/adding-a-virtual-instance.html)
