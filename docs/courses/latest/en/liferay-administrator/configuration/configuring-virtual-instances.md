---
uuid: f6380d67-6784-46a4-8723-46fcc24177a5
---
# Configuring Virtual Instances

You may have a business use case where you need another Liferay environment with its own set of sites, users, and organizations. Instead of setting up a brand new server, you can spin up a virtual instance.

For example, Delectable Bonsai also sells maple syrup as a white label product. Other companies purchase the syrup and add their own branding to it. To create a separation for Delectable Bonsai, they run a virtual instance to host their white label side of the business.

## Virtual Instances in LXC

Contact your Liferay Cloud support person for setting up virtual instances.

## Virtual Instance in LXC-SM and On Premises

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Virtual Instances_.

1. Click _Add_ (![Add icon](../../images/icon-add.png)) and input the following.

   * Web ID: `www.bulkbonsaimaplesyrup.com`
   * Virtual Host: `www.bulkbonsaimaplesyrup.com`
   * Mail Domain: `bulkbonsaimaplesyrup.com`
   * Max User: `0` (note, this means unlimited users)
   * Active: toggle on
   * Virtual Instance Initializer: select _Blank Site_.

   ![Input the virtual instance information.](./configuring-virtual-instances/images/01.png)

   Click _Save_. Your new virtual instance ready.

```{note}
It is up to you to configure the domain name and its corresponding server address.
```

The next step is setting up a [file storage](./using-file-storage.md)

## Relevant Concepts

- [Understanding Virtual Instances](https://learn.liferay.com/dxp/latest/en/system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.html)
- [Adding a Virtual Instance](https://learn.liferay.com/dxp/latest/en/system-administration/configuring-liferay/virtual-instances/adding-a-virtual-instance.html)
