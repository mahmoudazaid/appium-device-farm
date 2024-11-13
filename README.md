# Appium with Device Farm and UiAutomator

This project sets up an Appium server with the **Device Farm plugin** and **UiAutomator2 driver** installed. It provides an easy way to run automated mobile tests using Appium with Android devices.

## Badges 

Here are the status badges for various tools and dependencies:

[![Docker Publish](https://github.com/mahmoudazaid/appium-device-farm/actions/workflows/docker-publish.yml/badge.svg?branch=master)](https://github.com/mahmoudazaid/appium-device-farm/actions/workflows/docker-publish.yml)  
![Node Version](https://img.shields.io/badge/node-22.x-blue)
![npm Version](https://img.shields.io/badge/npm-10.9.0-blue)  
![Appium Version](https://img.shields.io/badge/appium-2.12.1-blue)
![UiAutomator Version](https://img.shields.io/badge/uiautomator2-3.8.0-blue)
![Device-Farm Version](https://img.shields.io/badge/device_farm-9.2.3-blue)

## Table of Contents

1. [Build Instructions](#build-instructions)
   - [Building without Arguments](#build-without-arguments)
   - [Building with Specific Arguments](#build-with-specific-arguments)
2. [Running Appium Server](#running-appium-server)
   - [Running on Default Configuration](#running-on-default)
   - [Running with Custom Variables](#running-with-custom-variables)

---

## Build Instructions

### Build without Arguments

To build the Docker image without any passing arguments, simply use:

```bash
docker build -t appium-device-farm .
```

This will use the default values for Node.js, npm, Appium, UiAutomator, and Device Farm versions, which are preconfigured in the Dockerfile.

### Build with Specific Arguments

To build with specific versions of Node.js, npm, Appium, UiAutomator, or Device Farm, you can pass arguments during the build process. For example:

```bash
docker build --build-arg NODE_VERSION="16" \
             --build-arg NPM_VERSION="9" \
             --build-arg APPIUM_VERSION="2.12.1" \
             --build-arg UIAUTOMATOR_VERSION="3.8.0" \
             --build-arg DEVICE_FARM_VERSION="9.2.3" \
             -t appium-device-farm .
```

Replace the values in quotes with the versions you want to use.

## Running Appium Server

### Running on Default

To run the Appium server using the default settings (Appium on port 4723 with a keep-alive time of 600 ms), use:

```bash
docker run -d -p 4723:4723 appium-device-farm
```

This will start the Appium server with the default configuration, including the Device Farm plugin and UiAutomator driver.

### Running with Custom Variables

If you want to run the Appium server with custom values for port or keep-alive time, you can pass environment variables when starting the container. For example:

```bash
docker run -d -p 4724:4724 -e APPIUM_PORT="4724" -e KEEP_ALIVE="60000" appium-device-farm
```

## Variables Used in Build

| Variable Name         | Description                                                 | Default Value | Example Usage                              |
| --------------------- | ----------------------------------------------------------- | ------------- | ------------------------------------------ |
| `BUILD_TOOLS_VERSION` | The version of Android Build Tools to use for the build.    | 35.0.0        | `--build-arg BUILD_TOOLS_VERSION="35.0.0"` |
| `NODE_VERSION`        | The version of Node.js to install.                          | 16            | `--build-arg NODE_VERSION="18"`            |
| `NPM_VERSION`         | The version of npm to install.                              | 10.9.0        | `--build-arg NPM_VERSION="9"`              |
| `APPIUM_VERSION`      | The version of Appium to install.                           | 2.12.1        | `--build-arg APPIUM_VERSION="2.13.0"`      |
| `UIAUTOMATOR_VERSION` | The version of the UiAutomator2 driver to install.          | 3.8.0         | `--build-arg UIAUTOMATOR_VERSION="3.9.0"`  |
| `DEVICE_FARM_VERSION` | The version of the Device Farm plugin to install in Appium. | 9.2.3         | `--build-arg DEVICE_FARM_VERSION="9.3.0"`  |

This will run the Appium server in the background and map the container's port 4723 to the host.

## Variables Used in Run

| Variable Name | Description                                                | Default Value | Example Usage           |
| ------------- | ---------------------------------------------------------- | ------------- | ----------------------- |
| `APPIUM_PORT` | The port on which the Appium server will run.              | 4723          | `-e APPIUM_PORT="4724"` |
| `KEEP_ALIVE`  | The keep-alive time for the Appium server in milliseconds. | 600           | `-e KEEP_ALIVE="60000"` |

### `KEEP_ALIVE` Variable

The **`KEEP_ALIVE`** variable sets the time (in milliseconds) that the Appium server will stay active without any incoming requests. This is also known as the **keep-alive time**. The keep-alive time ensures that the server does not shut down prematurely when there are no active test sessions.

- **Default Value**: `600` milliseconds.
- **Custom Value**: You can specify a custom time in milliseconds, depending on your use case. For example, if you want the server to stay active for only 60 seconds (60000 milliseconds) without any requests, you would set the value to `60000`.

## Conclusion

This project makes it easy to set up an Appium server with the Device Farm plugin and UiAutomator driver. You can build and run the server with default settings or customize the environment using arguments or environment variables.

For more advanced configurations or troubleshooting, feel free to modify the Dockerfile or scripts according to your needs.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.s