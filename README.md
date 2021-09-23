## Setup in Local


``` bash
# clone from repository
$ git clone https://github.com/elikristina-mitrais/squad-two-be.git

# edit config/dev.exs file to configure database
## username: "postgres",
## password: "postgres",
## database: "kargohackathon_dev",
## hostname: "localhost",

# go to the working directory
$ cd squad-two-be

# initial setup
$ mix deps.get

# configure database
$ mix ecto.create

# database migration
$ mix ecto.migrate

# start phoenix app
$ mix phx.server
```
