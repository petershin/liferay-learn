# Docker Image Versions

Liferay Docker image tags begin with a Liferay software version and end with an image version.

`[Liferay software version] [image version]`

For example, Liferay DXP 7.4.13 Update 15 or Liferay Portal 7.4.3.15 GA15 follow the pattern. See [Liferay Software Versions](../../reference/liferay-software-versions.md) to learn more.

Liferay Docker image tags use *full* image versions and *simple* image versions.

A full image version is a semantic version based on changes to the container (e.g., OS, scripts, and tools). These versions start with `d`, have a major, minor, and micro version number, and end with a time stamp (e.g., `7.4.13-u15-d2.0.23-20220310153349`).

```{important}
The image version is not bound by the Liferay software version. For example, multiple images can be created for the same Liferay software version.
```

Tags that use the full image version are recommended because they're static and explicitly versioned.

Tags that use the simple image version are provided only as a convenience. They represent the *latest image available* for a Liferay software version.

For example, here are the full and simple version tags used for the DXP 7.4 image available at the time of this writing.

Full:

```
7.4.13-u36-d4.1.9-20220803160915
```

Simple:

```
7.4.13-u36
```

The full and simple tags above refer to the same Docker image. If, however, a new image is created for Liferay DXP 7.4.13 U36, the simple tag is updated to use the new image.

```{warning}
Liferay Docker image tags that use a simple image version can change. They are updated to refer to the latest image available for the Liferay software version.
```
