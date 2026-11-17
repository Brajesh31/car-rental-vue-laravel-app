# 🧠 Architecture Decision Records

ADRs capture decisions that affect system structure, data, security, integrations, or operations.

## Naming

`NNNN-short-title.md`, for example `0001-restore-csrf-protection.md`.

## Lifecycle

~~~mermaid
stateDiagram-v2
  [*] --> Proposed
  Proposed --> Accepted
  Proposed --> Rejected
  Accepted --> Superseded
~~~

Record context, options, decision, consequences, migration, security/privacy impact, and verification. Supersede accepted decisions rather than silently rewriting history.
