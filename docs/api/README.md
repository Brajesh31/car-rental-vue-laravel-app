# 📡 Routes and Request Reference

This project primarily uses Laravel web routes and Inertia responses rather than a separately versioned REST API. The availability checker returns JSON.

- [Current route inventory](../api.md)
- [Request examples](examples/README.md)
- [OpenAPI draft](openapi.yaml)
- [Postman collection](examples/car-rental.postman_collection.json)

## Important contract caveats
- Contact form POST `/contact` is not registered.
- Rental detail and edit controller actions are stubs.
- Car delete and logout use GET despite mutating state.
- The booking action trusts the submitted total_cost.
- CSRF protection is disabled globally in current middleware configuration.
- Some route names and controller parameters should be verified with `php artisan route:list` before use.

Treat the OpenAPI file as a draft until it is generated/validated against actual route responses.
