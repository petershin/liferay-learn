---
uuid: c61de976-8fb5-485d-af05-86baaab3f434
---
# Adding Regions

You can add states, provinces, or other administrative regions to countries in Liferay.

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Commerce* &rarr; *Countries*.

1. Click on a country (Ireland in this example).

1. Click *Regions*.

1. Click the *Add* (![Add](../images/icon-add.png)) button to add a region.

1. Enter the following:

   * **Name**: *Leinster*
   * **Code**: *IE-L*
   * **Priority**: 6.0

1. Switch the toggle to *Active*.

   ![Adding the Leinster region to Ireland.](./adding-regions/images/01.png)

1. Click *Save*.

Leinster has been added to the list of regions in Ireland. When you choose Ireland from the *Country* dropdown, Leinster appears in the *Region* dropdown on the Shipping Address Page. Repeat these steps to add all the regions for a country.

![Leinster appears as a region in the dropdown while checking out.](./adding-regions/images/02.png)

## Additional Information

**Note 1:** The values in the *Code* field must follow the [ISO-3166-2](https://www.iso.org/obp/ui/#search/code/) standard's format.

**Note 2:** You can use the priority field to manually rank regions if needed.
