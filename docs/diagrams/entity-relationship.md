# 🗃️ Entity Relationship Diagram

The current core domain has users, cars and rentals. Confirm column names and foreign-key behavior against the latest migrations before treating this conceptual diagram as a schema contract.

~~~mermaid
erDiagram
  USERS ||--o{ RENTALS : places
  CARS ||--o{ RENTALS : reserved_for
  USERS {
    bigint id PK
    string name
    string email
    string role
  }
  CARS {
    bigint id PK
    string name
    string brand
    string model
    decimal daily_rent_price
    boolean availability
  }
  RENTALS {
    bigint id PK
    bigint user_id FK
    bigint car_id FK
    date start_date
    date end_date
    decimal total_cost
    string status
  }
~~~

## Integrity rules
- A rental references one user and one car.
- A customer must only access their own rentals unless an authorized admin policy applies.
- Active overlapping rentals for the same car must be prevented.
- Deletion behavior must be reviewed before removing users or cars with rental history.
