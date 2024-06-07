---
uuid: 3a9bf74d-b5e1-4a88-a483-bf77bcdaa8b0
taxonomy-category-names:
- Development and Tooling
- Developer Tools
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# Troubleshooting Blade CLI

If Blade CLI isn't working as expected, you may find answers here.

## The blade command is not available in my CLI

The Blade CLI installer adds the `blade` command to your path only if you are using the Bash shell in its default configuration, by modifying `.bash_profile`. If your system doesn't use `.bash_profile` or the Bash shell, you must add the command to your path manually. 

If for some reason the installer did not add the command to your `$PATH`, on Bash, you can add it manually like this: 

**macOS**

```bash
echo 'export PATH="$PATH:$HOME/Library/PackageManager/bin"' >> ~/.bash_profile
```

**Linux**

```bash
echo 'export PATH="$PATH:$HOME/jpm/bin"' >> ~/.bash_profile
```

If you're using a shell other than Bash, you must add the path to the `blade` executable according to that shell's documentation. 

## I can't update blade

You may have tried to update Blade CLI by downloading a newer installer and installing it over your existing version. This is not supported, and now you may have two separate installations on your machine. You must delete the legacy Blade files in your global folder, if present.

Using an administrative account, navigate to your `[global folder]/jpm4j` folder and delete these two files:

- `/bin/blade`
- `/commands/blade`

Now the newer installation in your user home folder is recognized and available in your CLI.

## I can't use JDK 17 or JDK 21 

These JDKs are supported as of Blade 7.0.0+ and Workspace 10.1.0+. Follow [these instructions](../blade-cli.md#updating-blade-cli) to update your version of Blade, and then update your Workspace. 
