---
toc:
- ./setting-up-redirects-and-404-tracking/using-alias-redirects.md
- ./setting-up-redirects-and-404-tracking/using-pattern-redirects.md
- ./setting-up-redirects-and-404-tracking/tracking-404-urls.md
---
# Setting Up Redirects and 404 Tracking

```{toctree}
:maxdepth: 3

setting-up-redirects-and-404-tracking/using-alias-redirects.md
setting-up-redirects-and-404-tracking/using-pattern-redirects.md
setting-up-redirects-and-404-tracking/tracking-404-urls.md
```

{bdg-secondary}`7.4+`

Maintaining URL integrity is important for any Site. Liferay's *Redirection* tool provides a convenient and integrated way to manage HTTP redirects and track 404 errors for individual sites. Use it to avoid and fix broken links, improving both user experience and site SEO.

To access the application, open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)) and go to *Configuration* &rarr; *Redirection*.

![Go to the Redirection page in the Site Menu.](./setting-up-redirects-and-404-tracking/images/01.png)

## Defining Redirects

You can define two kinds of redirects:

**Alias Redirects**: Define permanent (301) or temporary (302) URL redirects using an absolute source and destination URL.

**Pattern Redirects** {bdg-secondary}`7.4 U48+/GA48+`: Define bulk redirects using regular expressions that set patterns for source URLs and their replacements.

Liferay recommends alias redirects in most cases because they are more predictable. Pattern redirects are best for matching families of URLs. Depending on the exact regular expression, pattern redirects are slower and result in more URL matches than intended. See [Using Alias Redirects](./setting-up-redirects-and-404-tracking/using-alias-redirects.md) and [Using Pattern Redirects](./setting-up-redirects-and-404-tracking/using-pattern-redirects.md) for more information.

## Resolving 404 Errors

In the Redirection application, you can view and manage site requests that result in a 404 error, so you can assess and quickly resolve any issues. For Liferay 7.4+, 404 tracking is disabled by default. Enabling this feature activates the 404 URLs tab in the Redirection application and begins cataloging errors. See [Tracking 404 URLs](./setting-up-redirects-and-404-tracking/tracking-404-urls.md) for more information.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Using Alias Redirects
:link: ./setting-up-redirects-and-404-tracking/.md
:::

:::{grid-item-card} Using Pattern Redirects
:link: ./setting-up-redirects-and-404-tracking/.md
:::

:::{grid-item-card} Tracking 404 URLs
:link: ./setting-up-redirects-and-404-tracking/.md
:::
::::
