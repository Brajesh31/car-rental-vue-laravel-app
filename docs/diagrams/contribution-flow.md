# 🤝 Contribution Workflow

~~~mermaid
flowchart TD
 A[Read issue and project docs] --> B[Inspect route/controller/model]
 B --> C[Define acceptance criteria]
 C --> D[Review auth, CSRF and data impact]
 D --> E[Implement focused change]
 E --> F[Add feature and negative tests]
 F --> G[Run composer test and npm build]
 G --> H[Update docs and diagrams]
 H --> I[Open pull request]
 I --> J[Review and merge]
~~~
