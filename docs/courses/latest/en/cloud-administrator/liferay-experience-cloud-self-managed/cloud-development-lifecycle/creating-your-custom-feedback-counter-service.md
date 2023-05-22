# Creating Your Custom Feedback Counter Service

Previously, you added "feedbackinput" object data and its API.

Here, you'll add the simple Spring Boot application Kyle created to a Docker image, publish it, and create a new custom service using the image.

## Adding Your Site's Domain to the Feedback Counter Project

The [Spring Boot project you downloaded previously](https://resources.learn.liferay.com/courses/latest/en/liferay-administrator/cloud-administrator/cloud-development-lifecycle/w9g6.zip) works by showing feedback values retrieved via API calls from Liferay. A script on the page calls the microservice, which uses OAuth2 authorization to make the API calls for the object entry data from Liferay. The script uses this data to update the page. 

It also uses an `application.properties` file to register important values, including your Liferay instance's domain. Complete the project by filling in your site's domain.

1. In the folder you unzipped the feedback counter resources into, open the `src/main/resources/application.properties` file.

1. Replace the placeholder value of the `liferay.host` property with your site's domain (e.g., `www.delectablebonsai.com`):

    ```properties
    liferay.host=YOUR DOMAIN HERE
    ```

Now the project is complete and ready for you to build for publication.

## Building the Project as an Executable JAR

As a Spring Boot application, Kyle's project can be packaged into a self-contained, executable JAR file.

Run this command from the project's base directory to build the JAR file:

```bash
./gradlew clean bootJar
```

The project builds and creates the `spring-boot-webapp.jar` file in the project's `build/libs/` folder.

## Creating the Dockerfile

You must [create a `Dockerfile`](https://docs.docker.com/engine/reference/builder/) to build a Docker image that you can run in Liferay Cloud as a custom service.

In the same directory that you unzipped the project into, create a `Dockerfile` so you can build a Docker image from this project.

```bash
touch Dockerfile
```

Liferay provides the `jar-runner` base Docker image that you can use as a base image for these kinds of projects.

Open the `Dockerfile` and fill in the file using `jar-runner` as a base image.

1. Add `jar-runner` as the base image.

    ```
    FROM liferay/jar-runner:latest
    ```

1. Add a line to rename and copy your project's JAR file into the Docker image in the expected directory (`/opt/liferay/`).

    ```
    COPY ./build/libs/spring-boot-webapp.jar /opt/liferay/jar-runner.jar
    ```

1. Add another line to expose port `8181`.

    ```
    EXPOSE 8181
    ```

    Kyle's application uses port `8181` to serve the HTML page, so you must expose that port when it's running in Liferay Cloud.

Now your `Dockerfile` has everything it needs to build an appropriate Docker image.

## Building and Pushing the Project as a Docker Image

Use the [Docker command line](https://docs.docker.com/engine/reference/commandline/cli/) to build and publish your Docker image for your custom service to use.

1. Go to [Docker Hub](https://hub.docker.com/) and [add a new repository](https://docs.docker.com/docker-hub/repos/create/), named `feedbackcounter`.

1. From your folder with the Spring Boot project, run this command to build the Docker image from the code, using your own Docker Hub username:

    ```bash
    docker build -t USERNAME/feedbackcounter .
    ```

1. Log in to Docker Hub via the command line using your own credentials:

    ```bash
    docker login -u USERNAME
    ```

1. Push the Docker image to your Docker Hub repository:

    ```bash
    docker image push USERNAME/feedbackcounter
    ```

Now the Docker image is ready to be deployed as a custom service.

## Creating a new Service in Your Repository

Next, open your project's repository to create and deploy the custom service.

1. Create a new top-level folder for the new service, called `feedback`.

   ```bash
   mkdir feedback && cd feedback
   ```

1. Create a new `LCP.json` file for your service.

   ```bash
   touch LCP.json
   ```

1. Open the `LCP.json` file and add the key configurations defining the service's [type](https://learn.liferay.com/en/w/liferay-cloud/build-and-deploy/understanding-deployment-types), identifier, and the Docker image to base it on:

   ```json
   {
       "kind": "Deployment",
       "id": "feedback",
       "image": "delectablebonsai/feedbackcounter:latest",
   }
   ```

1. Add configurations to specify the resources (memory in MB, CPUs, and number of nodes) the service needs:

   ```json
   "memory": 256,
   "cpu": 1,
   "scale": 1,
   ```

    This service only needs minimal resources to run the simple Spring Boot application.

1. Add the network configuration needed to create an exposed endpoint to access your custom service externally.

   ```json
   "ports": [
       {
           "port": 8181,
           "external": true
       }
   ],
   ```

1. Add the `liferay` service as a dependency, because the service requires access to Liferay's API.

   ```json
   "dependencies": [
       "liferay"
   ],
   ```

1. Add the last configuration to specify that this service is not valid for deployment to the `infra` environment. Since `infra` is a special environment for your CI (Continuous Integration) service, this service won't run there. 

   ```json
   "environments": {
       "infra": {
           "deploy": false
       }
   }
   ```

1. Add this new service's `LCP.json` file to Git and commit it.

   ```bash
   git add LCP.json
   ```

   ```bash
   git commit -m "Add a new custom counter service."
   ```

Now your new custom service is ready to run in Liferay Cloud. Next, you'll [deploy it to your UAT environment and see it working](./deploying-and-configuring-your-custom-service.md).

## Relevant Concepts

* [Configuration via LCP.json](https://learn.liferay.com/w/liferay-cloud/reference/configuration-via-lcp-json)
* [Private Network](https://learn.liferay.com/w/liferay-cloud/infrastructure-and-operations/networking/private-network)
* [Using a Custom Service](https://learn.liferay.com/web/guest/w/liferay-cloud/platform-services/using-a-custom-service)
