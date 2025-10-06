# README

A simple Ruby on Rails application providing full CRUD functionality for managing customers.

Setup:

1. Clone the repository
```bash
   git clone https://github.com/misonnnnn/customer_management_app.git
   cd customer_management_app` 
```

2. Install dependencies
```bash
    bundle install
```

3. Set up the database

You may update your database configuration in `config/database.yml` if needed, for example:
config/database.yml
```yml
    username: root
    password: root

```
Then run the following commands to create and migrate the database:
```bash
    rails db:create db:migrate
```

4. Run the server
```bash
    rails server
```

Access it at http://localhost:3000

---
Running Automated Tests:

To execute model and controller tests:
```bash
    rails test
```

To execute system (browser) tests:
```bash
    rails test:system
```
---
Features:
- CRUD for customers
- Validations for required fields and format
- Status toggle with visual badges
- Bootstrap UI
- Custom 404 error page
- DataTables support

Tech Stack:
- Ruby on Rails (8.0.3)
- Bootstrap 5
- MySQL


