# Docker Prime95

This is a Docker image of the GIMPS Prime95 software, used for finding prime numbers. This image is based on the official Prime95 software

## Usage

To use this image, simply run the following command:

`docker run -d -v [your local path]:/opt/prime95 --env PRIME_USER=[your GIMPS username]--env WORK_PREFERENCE=[ID of work preference]--env HOSTNAME=[your host name] wolasss/prime95`

List of available work preference IDs can be found [here](https://www.mersenne.org/worktypes/)

## Updates

This image is should be regularly updated with the latest version of Prime95. To update the image, simply run the following command:

```
docker pull wolasss/prime95
```

This will pull the latest version of the image from the Docker Hub. 

You can also build your own image with `docker build .`

## Contribution 

Any contribution is welcomed; please open a pull request.