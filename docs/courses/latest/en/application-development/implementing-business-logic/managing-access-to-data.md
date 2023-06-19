# Managing Access to Data

Managing access to data is essential to data privacy and security. With Liferay, you can restrict access to sensitive object data using role permissions and account membership. Additionally, you can use OAuth2 for authorizing API calls by client extensions.

Delectable Bonsai wants to allow authorized users to submit applications. They also want to create and define a role for assessing applications. <!--Refine-->

## Granting Users the Ability to Submitting Distributor Applications

1. Open the *Global Menu* ( ![Global Menu](../../images/icon-applications-menu.png) ), go to the *Control Panel* tab, and click *Roles*.

1. Edit the *User* role.

1. Go to the *Define Permissions* tab and add these permissions:

   | Permission                                                            |
   |:----------------------------------------------------------------------|
   | Distributor Applications: View                                        |
   | Distributor Applications > Distributor Application: Delete            |
   | Distributor Applications > Distributor Application: Update            |
   | Distributor Applications > Distributor Application: View              |
   | Distributor Applications > Distributor Applications: Add Object Entry |

   ![Add these permissions to the User role.](managing-access-to-data/images/01.png)

1. Click *Save*.

1. Verify the User role has the desired permissions.

   ![Verify the User role has the desired permissions.](./managing-access-to-data/images/02.png)

## Creating Roles for Reviewing Distributor Applications

1. Open the *Global Menu* ( ![Global Menu](../../images/icon-applications-menu.png) ), go to the *Control Panel* tab, and click *Roles*.

1. Click *Add* (![Add Button](../../images/icon-add.png)).

1. Enter these details and click *Save*:

   | Field       | Value                                                                                                                                                                                                                                                                                                                                |
   |:------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
   | Type        | Regular                                                                                                                                                                                                                                                                                                                              |
   | Title       | Business Development Manager                                                                                                                                                                                                                                                                                                         |
   | Description | Business Development Managers are responsible for identifying and assessing growth opportunities for Delectable Bonsai. This includes evaluating distributor applications to determine whether applicants align with the company's goals and have the distribution capacity to further Delectable Bonsai's market penetration goals. |
   | Key         | Business Development Manager                                                                                                                                                                                                                                                                                                         |

   ![Create the Business Development Manager role.](./managing-access-to-data/images/03.png)

1. Go to the *Define Permissions* tab and add these permissions and click *Save*:

   * Distributor Applications

      | Permission                                                 |
      |:-----------------------------------------------------------|
      | Distributor Applications: Access in Control Panel          |
      | Distributor Applications: View                             |
      | Distributor Applications > Distributor Application: Update |
      | Distributor Applications > Distributor Application: View   |

   * Application Evaluations

      | Permission                                                          |
      |:--------------------------------------------------------------------|
      | Application Evaluations: Access in Control Panel                    |
      | Application Evaluations: View                                       |
      | Application Evaluations > Application Evaluation: Add Discussion    |
      | Application Evaluations > Application Evaluation: Delete            |
      | Application Evaluations > Application Evaluation: Delete Discussion |
      | Application Evaluations > Application Evaluation: Update            |
      | Application Evaluations > Application Evaluation: Update Discussion |
      | Application Evaluations > Application Evaluation: View              |
      | Application Evaluations > Application Evaluations: Add Object Entry |

   ![Assign these permissions to the Business Development Manager.](./managing-access-to-data/images/04.png)

   ```{note}
   Liferay automatically assigns the Portal: View Control Panel Menu permission.
   ```
   <!-- ![](./managing-access-to-data/images/05.png) -->

## Relevant Concepts

* [Permissions Framework Integration](https://learn.liferay.com/w/dxp/building-applications/objects/understanding-object-integrations/permissions-framework-integration)
