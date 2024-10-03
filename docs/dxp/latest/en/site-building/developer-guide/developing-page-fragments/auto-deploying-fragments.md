---
taxonomy-category-names:
- Development and Tooling
- Fragments
- Liferay Self-Hosted
- Liferay PaaS
uuid: f3bb512e-5954-47b2-bf3d-bccaee642919
---

# Auto-Deploying Fragments

{bdg-secondary}`Liferay Portal 7.3 GA1+ or Liferay DXP 7.3+`

If you're [developing page fragments with your own tooling](./using-the-fragments-toolkit.md#fragment-set-structure), you can deploy them by packaging them in ZIP files for importing via the Liferay UI. But you're not limited to using the UI. You can deploy fragment ZIP files from the command line too. Learn how to work with fragment projects and import the fragments to the sites you want from the command line using Liferay's auto-deployment mechanism.

!!! note
    For Liferay DXP 7.4+, fragment collections are called fragment sets in the Liferay UI.

## Deploy an Auto-deployable Fragment Set

```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps to auto-deploy an example fragment set:

1. Download and unzip the [example auto-deployable fragment set](https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-a2f8.zip):

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-a2f8.zip -O
   ```

   ```bash
   unzip liferay-a2f8.zip
   ```

1. Compress the fragment project's set and its deployment descriptor into a ZIP file:

   ```bash
   cd liferay-a2f8
   ```

   ```bash
   zip -r  a2f8-fragments.zip a2f8-set/ liferay-deploy-fragments.json
   ```

1. Import the fragment set to the descriptor-specified site by copying the new `.zip` file to the auto-deploy folder in Liferay's Docker container:

   ```bash
   docker cp a2f8-fragments.zip $(docker ps -lq):/opt/liferay/deploy
   ```

1. Check the Docker console for this log message:

   ```bash
   INFO  [com.liferay.portal.kernel.deploy.auto.AutoDeployScanner][AutoDeployDir:263] Processing a2f8-fragments.zip
   ```

1. Verify the fragment set is available. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)) and go to *Design* &rarr; *Fragments*. The set should appear in the list.

!!! note
    If an imported fragment has invalid rules, it is saved automatically as a draft.

![Once imported, the set is available in the Fragments application.](./auto-deploying-fragments/images/01.png)

## Fragment Project Structure

The auto-deployable fragment project has this structure:

```bash
[project ZIP]
├── [fragment-set]
│   ├── collection.json
│   └── [fragment]
│       └── fragment files ...
└── liferay-deploy-fragments.json
```

The `liferay-deploy-fragments.json` file specifies the scope where you want to deploy the fragments:

- System-wide (all instances)
- A virtual instance (company)
- A site (group).

The example's configuration below specifies deploying to a site (group) called "Guest" within a virtual instance (liferay.com):

```json
{
   "companyWebId": "liferay.com",
   "groupKey": "Guest"
}
```

Both keys in this JSON file are optional. In your `liferay-deploy-fragments.json` file, you can make fragments available system-wide (to all instances) by specifying an empty JSON element or by adding this configuration:

```json
{
   "companyWebId": "*"
}
```

!!! warning
    Importing fragments [with resources](./including-default-resources-with-fragments.md) is not supported if you are making them available at the system level.

!!! note
    The fragments toolkit's [`npm run compress` command](./using-the-fragments-toolkit.md) facilitates creating fragment ZIP files and their deployment descriptors.

## Modify the Fragment Set and Redeploy

1. Add a new fragment to the example set by moving the project's `a2f8-jumbotron` fragment folder into the `a2f8-set/` folder.

1. Compress the fragment set into a ZIP file as you did above:

   ```bash
   zip -r  a2f8-fragments.zip a2f8-set/ liferay-deploy-fragments.json
   ```

1. Import the modified fragment set by copying the ZIP file to the Docker container as you did previously:

   ```bash
   docker cp a2f8-fragments.zip $(docker ps -lq):/opt/liferay/deploy
   ```

1. Check for the new fragment. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)), go to *Design* &rarr; *Fragments*, and click on *A2F8 Set*. It should include the A2F8 Jumbotron fragment.

   ![The new fragment is included in the auto-deployed set.](./auto-deploying-fragments/images/02.png)

Great! Now you know how to work with a fragment set locally, specify a site for it, and import it using auto-deployment.

## Related Topics

- [Including Default Resources with Fragments](./including-default-resources-with-fragments.md)
- [Adding Configuration Options to Fragments](./adding-configuration-options-to-fragments.md)
