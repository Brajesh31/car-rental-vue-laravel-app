# 🔐 Authentication and Role Flow

~~~mermaid
flowchart TD
  A[Visitor] --> B[Login or Signup]
  B --> C[Laravel Auth / UserController]
  C --> D[Authenticated Session]
  D --> E{Role middleware}
  E -->|admin| F[Admin routes: users and cars]
  E -->|user or admin| G[Dashboard and rental routes]
  E -->|not allowed| H[403 Forbidden]
~~~

## Security gaps in current code
- Signup accepts the `role` value from the public request.
- CSRF validation is disabled globally.
- Dashboard route is accessible to both roles and controller sends all users to the page.
- UI-level hiding does not replace server authorization.

See [Security Review](../SECURITY_REVIEW.md).
