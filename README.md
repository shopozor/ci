# Shopozor CI/CD configuration

Our Shopozor product needs a reliable CI/CD system. This repository consists of its configuration. In essence, we need to continuously

* unit test the Shopozor's applications
* perform the Shopozor's applications acceptance tests
* perform the Shopozor's end-to-end tests

The Shopozor consists in three applications: 

1. the [backend](https://github.com/softozor/shopozor-backend)
2. the [consumer frontend](https://bitbucket.org/softozor/shopozor-consumer-frontend)
3. the [management frontend](https://bitbucket.org/softozor/shopozor-management-frontend)

## Motivations

We took the decision to implement our CI/CD with Jenkins, even though there are much more sexy alternatives in the development ecosystem out there. **The main reason behind that decision is our very little budget for the product's development**. After the first release, our customer will take over the CI/CD costs.

### Why not CircleCI?

* CircleCI is very nicely integrated into Github and is very easy to configure
* The hobbyist plan is pretty restrictive on the amount of docker containers we can run within a test: it could be fine for our frontends’ acceptance tests but definitely not for our backend’s acceptance tests and all our e2e tests

### Why not Gitlab?

* External repositories not supported in the free plan
* We could host our repos on Gitlab but then we’d have to pay for its hosting, which would need to be a 24/7 hosting, therefore pretty expensive


### Why Jenkins?

* Very easy to configure
* Completely free
* We can live with a partially available Jenkins server, some kind of on-demand Jenkins until the product's first release; as Jenkins only triggers builds, it's more than fine.

## Jenkins setup on Jelastic

### Docker installation

### Necessary software addtions

* Yarn installation
* jq installation

### Necessary Jenkins plugins

### Credentials setup

- needs github full permissions
- absolutely needs ghprb shared secret
- present branch protection setup (master & dev)

### Jobs setup

### Specific setup to our product

#### Postgres installation

## Pipeline configuration

- shared libs