---
uuid: f6380d67-6784-46a4-8723-46fcc24177a5
---
# Configuring Virtual Instances

<!-- Same here. Let's use a badge to call out this only applies to specific environments. -Rich --> 

You may have a business use case where you need another Liferay environment with its own set of sites, users, and organizations. Rather than spinning up a brand new server, you can create a virtual instance.

For example, Delectable Bonsai also sells maple syrup as a white label product. Other companies purchase the syrup and add their own branding to it. Delectable Bonsai runs a virtual instance to host their separate, white label side of the business.

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

   ```{note}
   You can select a site initializer, such as the [Minium Demo](https://learn.liferay.com/en/w/commerce/starting-a-store/using-the-minium-accelerator-to-jump-start-your-b2b-store) to jump start the instance.
   ```
<!-- Will we be building the site with Minium as a basis? If so, we should make this an explicit step. Otherwise, we shouldn't mention it. Again, this isn't docs; we don't show them options. We tell them exactly what to do to build the thing we're building. -Rich --> 

   ![Enter the virtual instance information.](./configuring-virtual-instances/images/01.png)

   Click _Save_. Your new virtual instance ready.

```{note}
It is up to you to configure the domain name and its corresponding server address.
```

<!-- No, it isn't. We have to tell them exactly what to do, and it has to work. If this domain won't work, we should use something else. -Rich --> 

The next step is to [configure instance settings](./configuring-instance-settings.md).

## Relevant Concepts

- [Understanding Virtual Instances](https://learn.liferay.com/en/w/dxp/system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances)
- [Adding a Virtual Instance](https://learn.liferay.com/en/w/dxp/system-administration/configuring-liferay/virtual-instances/adding-a-virtual-instance)
