---
taxonomy-category-names:
- Sites
- Site Analytics
- Traffic and Path Analysis
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
uuid: 205b2902-3139-4f3d-bfb7-6cf80aec57e6
---
# Pages Reference

The data displayed for [Page Analytics](../pages.md) is based on [Default Events](../../workspace-data/definitions/definitions-for-events.md#default-events) and [Event Attributes](../../workspace-data/definitions/definitions-for-event-attributes.md). The following events and event attributes are related to pages:

## Page Events

- `pageDepthReached` (relevant event attribute - `depth`)
  - Event fires when a user scrolls the content
  - Used to estimate the level of interest or coverage of content by how far the user scrolls
- `pageLoaded` (relevant event attribute - `pageLoadTime`)
  - Event fires when a page is loaded
  - Used to measure the time to load a page
- `pageUnloaded` (relevant event attribute - `viewDuration`):
  - Event fires when a user navigates away from a page
  - Used to measure the time between load and unload
- `pageRead` (relevant event attribute - `page`): 
  - Event fires when the user reads a page (Note, this is calculated based on assumptions of page content length and expected read times)
  - Used to indicate that a page was read
- `pageViewed` (relevant event attribute - `page`): 
  - Event fires when a page is visited (i.e. a page has loaded and the user stays to view the page)
  - Used to indicate that a page was viewed
- `ctaClicked` (relevant event attribute - `elementId`): 
  - Event fires when a user clicks on the target element
  - Used to track if a call-to-action element was clicked

## Page Events Attributes
- `depth`: A number representing how far the user scrolled into the page
- `pageLoadTime`: A performance indicator for how long a page took to load
- `viewDuration`: The time elapsed from when the page was loaded until when the page was unloaded
- `page`: The URL of the page viewed
