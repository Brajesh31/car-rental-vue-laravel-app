# 📚 Documentation Hub

Technical guides for SwiftRide, a Laravel 12 + Inertia 2 + Vue 3 car-rental web application.

> ⚠️ These documents describe the inspected source and known gaps. This repository is not production-ready until the security and booking-integrity issues are corrected.

## 🧭 Start here

| Need | Guide |
|---|---|
| Understand the application | [Project overview](PROJECT_OVERVIEW.md) |
| See implemented and missing features | [Feature inventory](FEATURES.md) |
| Understand system boundaries | [Architecture](architecture.md) and [diagrams](diagrams/README.md) |
| Understand tables and migrations | [Database](database.md) and [data dictionary](database/README.md) |
| Inspect routes and workflows | [Route/API reference](api.md) |
| Install locally | [Installation](installation.md) |
| Develop safely | [Development](development.md) |
| Run verification | [Testing](TESTING.md) |
| Review security concerns | [Security review](SECURITY_REVIEW.md) |
| Deploy safely | [Deployment](deployment.md) |
| Operate and troubleshoot | [Operations](OPERATIONS.md), [runbooks](runbooks/README.md), [Troubleshooting](troubleshooting.md) |
| Prepare releases | [Release process](RELEASE_PROCESS.md) |
| Track work | [Root roadmap](../ROADMAP.md) |

## Existing project guides

- [API and routes](api.md)
- [Architecture](architecture.md)
- [Database](database.md)
- [Development](development.md)
- [Installation](installation.md)
- [Deployment](deployment.md)
- [FAQ](faq.md)
- [Troubleshooting](troubleshooting.md)

## Engineering resources

- [Diagrams](diagrams/README.md)
- [Database data dictionary](database/README.md)
- [API examples](api/examples/README.md)
- [OpenAPI draft](api/openapi.yaml)
- [Postman collection](api/examples/car-rental.postman_collection.json)
- [Templates](templates/README.md)
- [Runbooks](runbooks/README.md)
- [Architecture decision records](decisions/README.md)
- [Documentation asset guidance](assets/README.md)

## Repository policies

- [Contributing](../CONTRIBUTING.md)
- [Code of Conduct](../CODE_OF_CONDUCT.md)
- [Security policy](../SECURITY.md)
- [Support](../SUPPORT.md)
- [Changelog](../CHANGELOG.md)

## Documentation accuracy rules

Distinguish current behavior from proposed behavior. Do not call a booking paid unless a payment integration exists. Do not claim email was delivered merely because a message was logged. Do not say scheduler automation works until the command signature and schedule are aligned. A passing framework example test is not proof of booking, authorization, or concurrency correctness.

## Newly added detailed resources
- [Project overview](PROJECT_OVERVIEW.md)
- [Feature inventory](FEATURES.md)
- [Project structure](PROJECT_STRUCTURE.md)
- [Testing strategy](TESTING.md)
- [Security findings](SECURITY_REVIEW.md)
- [Security model](SECURITY.md)
- [Operations](OPERATIONS.md)
- [Release process](RELEASE_PROCESS.md)
- [System context](diagrams/system-context.md)
- [Authentication and roles](diagrams/authentication-role-flow.md)
- [Booking sequence](diagrams/rental-booking-sequence.md)
- [Rental lifecycle](diagrams/rental-lifecycle.md)
- [Deployment target topology](diagrams/deployment-topology.md)
- [Contribution workflow](diagrams/contribution-flow.md)
- [Database data dictionary](database/README.md)
- [Data retention/privacy](database/retention-and-privacy.md)
- [OpenAPI draft](api/openapi.yaml)
- [Postman collection](api/examples/car-rental.postman_collection.json)
- [Engineering templates](templates/README.md)
- [Operational runbooks](runbooks/README.md)
- [ADRs](decisions/README.md)
- [Asset guidance](assets/README.md)

## Detailed resource index
- [Project overview](PROJECT_OVERVIEW.md)
- [Feature inventory](FEATURES.md)
- [Project structure](PROJECT_STRUCTURE.md)
- [Testing strategy](TESTING.md)
- [Security review](SECURITY_REVIEW.md)
- [Security model](SECURITY.md)
- [Operations](OPERATIONS.md)
- [Release process](RELEASE_PROCESS.md)
- [System context](diagrams/system-context.md)
- [Authentication and roles](diagrams/authentication-role-flow.md)
- [Rental booking sequence](diagrams/rental-booking-sequence.md)
- [Rental lifecycle](diagrams/rental-lifecycle.md)
- [Deployment topology](diagrams/deployment-topology.md)
- [Contribution workflow](diagrams/contribution-flow.md)
- [Database data dictionary](database/README.md)
- [Data retention and privacy](database/retention-and-privacy.md)
- [OpenAPI draft](api/openapi.yaml)
- [Postman collection](api/examples/car-rental.postman_collection.json)
- [Engineering templates](templates/README.md)
- [Operational runbooks](runbooks/README.md)
- [Architecture decisions](decisions/README.md)
- [Documentation assets](assets/README.md)
