# Mosquigo

`golang` + `mosquitto` = mosquigo :thumbsup:

This image is used for continuous integration, so it contains `golangci-lint` too.

## Example usage

This image can be usefull in CI configurations.

### Example with .gitlab-ci.yml

You can use the following code to run CI/CD jobs

```yml
stages:
  - mqttest

mqttest:
  stage: mqttest
  image: your-registry/cicd/mosquigo:latest
  script:
    - golangci-lint run
    - go test  ./...
```

### Pushing the image

If you want to push your image, I let you some documentation about some different public providers

- [Gitlab container registry](https://docs.gitlab.com/ee/user/packages/container_registry/)
- [Scaleway container registry](https://www.scaleway.com/en/docs/compute/container-registry/quickstart/)

# Changelog

## v1.1.9

### Changed

- bump golangci-lint to version v1.45.2
- add some documentation
-
- ## v1.1.8

### Changed

- bump golangci-lint to version v1.43.0

## v1.1.7

### Changed

- bump golangci-lint to version v1.41.1

## v1.1.6

### Changed

- bump golangci-lint to version v1.40.1
- removed mount point

## v1.1.5

### Changed

- bump golangci-lint to version v1.39.0

## v1.1.4

### Fixed

- version of mockgen

## v1.1.3

### Added

- Changelog to README.md

### Changed

- bump golangci-lint to version v1.38.0

## v1.1.2

### Added

- Changelog to README.md

### Changed

- bump golangci-lint to version v1.32.2
