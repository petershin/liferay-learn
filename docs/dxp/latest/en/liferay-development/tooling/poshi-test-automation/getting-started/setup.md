---
uuid: 6a687e59-3184-4d8c-b59c-6100f5fe91b8
taxonomy-category-names:
- Development and Tooling
- Developer Tools
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Setup

## Prerequisites

1. A [supported version of Java](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-Quarterly-Releases-Compatibility-Matrix).

1. Google Chrome.

1. [Gradle](https://gradle.org/install/) or [Gradle Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html#sec:adding_wrapper) 6.6.1 or higher.

## Setting up the Poshi Standalone Gradle Project

1. Create a new directory, example `poshi-standalone`.

1. Setup Gradle wrapper (6.6.1 +) in the newly created directory.
    ```
    $ gradle wrapper --gradle-distribution-url https://github.com/liferay/liferay-binaries-cache-2020/raw/master/gradle-6.6.1.LIFERAY-PATCHED-1-bin.zip 
    ```

    Your directory should now contain the following:
    ```
    poshi-standalone
    ├── .gradle
    ├── gradle   
    |   └── wrapper
    |       ├──  gradle-wrapper.jar
    |       └──  gradle-wrapper.properties
    ├── gradlew
    └── gradlew.bat
    ```

1. To fetch the Poshi Standalone build files, run the following command from the desired directory in a terminal/command line window:

    ```
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/liferay/liferay-portal/master/modules/test/poshi/poshi-standalone/setup.sh)"
    ```

    In addition to the initial gradle files, your directory should now have the following: `build.gradle`, `settings.gradle`, `poshi.properties`, and `poshi-ext.properties`

1. On the root directory, create a new folder `poshi-tests`. This will house the files needed for the test.

1. Navigate to the `poshi-tests` directory and create three additional folders for paths, macros, and testcases.

    Your directory should now contain the following:

    ```
    poshi-standalone
    ├── .gradle
    ├── gradle   
    ├── gradle   
    |   └── wrapper
    |       ├──  gradle-wrapper.jar
    |       └──  gradle-wrapper.properties
    ├── poshi-tests
    |   ├── macros
    |   ├── paths
    |   └── testcases
    ├── build.gradle
    ├── gradlew
    ├── gradlew.bat
    ├── poshi.properties
    ├── poshi-ext.properties
    └── settings.gradle
    ```

With this setup, you can run `./gradlew task` (`gradlew.bat task` for Windows) to view available tasks on the project. For more information on the Gradle configurations for Poshi Standalone, see [Poshi Standalone](https://github.com/liferay/liferay-portal/tree/master/modules/test/poshi/poshi-standalone) on the Liferay github repository.

## Updating Poshi Standalone

Poshi Standalone will always run the latest released version and there are no extra steps needed to update the gradle project. Should you need to downgrade, add the following lines to the end of the `build.gradle` file, replacing the version number with the desired version from the [Poshi Runner Changelog](https://github.com/liferay/liferay-portal/blob/master/modules/test/poshi/CHANGELOG.markdown).

```
poshiRunner {
    version = "1.0.xxx"
}
```
