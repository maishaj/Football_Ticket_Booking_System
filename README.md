# ⚽ Football Ticket Booking System 

A PostgreSQL database design and SQL query assignment for a simplified **Football Ticket Booking System**. The project demonstrates relational database design, ERD relationships, constraints, joins, subqueries, aggregation, pattern matching, and NULL handling.

## 🗂️ Database Schema

The system contains three main tables:

### 1. Users

Stores registered football fans and ticket managers.

| Column         | Description                        |
| -------------- | ---------------------------------- |
| `user_id`      | Primary Key                        |
| `full_name`    | User's full name                   |
| `email`        | Unique email address               |
| `role`         | `Football Fan` or `Ticket Manager` |
| `phone_number` | User contact number                |

### 2. Matches

Stores football match and ticket information.

| Column                | Description                |
| --------------------- | -------------------------- |
| `match_id`            | Primary Key                |
| `fixture`             | Competing teams            |
| `tournament_category` | Tournament or league       |
| `base_ticket_price`   | Standard ticket price      |
| `match_status`        | Ticket availability status |

Allowed match statuses:

* `Available`
* `Selling Fast`
* `Sold Out`
* `Postponed`

### 3. Bookings

Stores ticket booking transactions.

| Column           | Description             |
| ---------------- | ----------------------- |
| `booking_id`     | Primary Key             |
| `user_id`        | Foreign Key → `Users`   |
| `match_id`       | Foreign Key → `Matches` |
| `seat_number`    | Allocated seat          |
| `payment_status` | Payment state           |
| `total_cost`     | Final booking cost      |

Allowed payment statuses:

* `Pending`
* `Confirmed`
* `Cancelled`
* `Refunded`

## Relationships

```text
Users 1 ───────────< Many Bookings Many >─────────── 1 Matches
```

* **Users → Bookings:** One-to-Many
* **Matches → Bookings:** One-to-Many
* **Bookings → Users:** Many-to-One
* **Bookings → Matches:** Many-to-One

Each booking represents one user's reservation for one specific match.

## Constraints

The database implements:

* `PRIMARY KEY` for unique record identification
* `FOREIGN KEY` for referential integrity
* `UNIQUE` constraint on user email
* `CHECK` constraint for valid user roles
* `CHECK` constraint for non-negative ticket prices
* `CHECK` constraint for valid match statuses
* `CHECK` constraint for non-negative booking costs
* `CHECK` constraint for valid payment statuses

## SQL Queries

The assignment includes 7 queries covering:

1. **Filtering** — Available Champions League matches
2. **Pattern Matching** — `LIKE` and `ILIKE`
3. **NULL Handling** — `IS NULL` and `COALESCE`
4. **INNER JOIN** — Booking, user, and match information
5. **LEFT JOIN** — Include users without bookings
6. **Subquery & Aggregation** — Bookings above average cost
7. **Sorting & Pagination** — `ORDER BY`, `LIMIT`, and `OFFSET`

## 📁 Project Structure

```text
football-ticket-booking/
│
├── README.md
├── QUERY.sql
```

## Technologies

* **PostgreSQL**
* **Draw.io** — ERD Design
* **GitHub** — Source Code & Submission

## Sample Data

The database includes sample records for:

* 4 users
* 5 football matches
* 5 bookings

The sample data is designed to demonstrate all required query scenarios, including NULL values and users without bookings.

## How to Run

1. Install PostgreSQL.
2. Create the database:

```sql
CREATE DATABASE footballTicket;
```

3. Connect to the `footballTicket` database.
4. Run the table creation and sample data SQL.
5. Execute the queries from `QUERY.sql`.

## Important Links

* **[ERD Diagram](https://drive.google.com/file/d/1PBw2YSjh-VdAAv-lUshRTLRWlsEB8B32/view?usp=drive_link)**

## 👤 Author

**Kazi Maisha Jannath**

