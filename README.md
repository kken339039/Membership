# Membership system
```
Member system which user can browse products and upgrade premium user.
```

## Clone project
```
$ git clone git@github.com:kken339039/Membership.git
```

## Environment
  - Ruby version 2.4.4
  - Rails version 5.2.0
## Necessary but version can be different
  - postgres
  - devise
  - rolify

#### Necessary but version can be different
  - postgres
  - devise
  - rolify

## Setup Database
#### You can use docker-compose to setup database environment or install postgres from postgresql.org
  - docker-compose
  ```
    docker-compose up -d (-d is run on background)
  ```
  - install postgres from postgresql.org
  ```
  https://www.postgresql.org/download/
  ```
#### Database configuration
   - database.yml
  ```
  cp ~/Memnership/config/database.example.yml ~/Memnership/config/database.yml
  ```
  - set `username` and `password`

## Setup Rails project
  - Install need Gem
  ```
  $ bundle install
  ```

  - Database creation
  ```
  $ rails db:create
  ```

  - Database Migration
  ```
  $ rails db:migrate
  ```

  - Run Test Case
  ```
  $ rspec
  ```

  - Run Rails Server (default port: 3000)
  ```
  $ rails s
  ```


## Development test data
  - Create Fake data
  ```
  $ rails db:seed:rake db:seed:fake_records
  ```

#### CI Server
Use CircleCI(https://circleci.com/). All pushes, pull requests are tested,
it include run rspec

#### After you create fake data, you can log in using the account below.
  - Admin User email: admin_user@gm.com, password: abc12345
  - Premium User email: premium_user@gm.com, password: abc12345
  - Normal User email: normal_user@gm.com, password: abc12345

## Current features
  - A user can register as a normal user
  - A user can browse products on this website
  - A user can choose to purchase premium membership(skip payment)
  - A premium member can see products with discount prices
  - A user can be set as admin
  - An admin can create/edit products on this website
  - A product would have product price/name/image



