# Postgres via Nix

This repository is a simple demonstration of supplying Postgresql built-binaries via a Nix package, but using and running the Postgres server/cluster outside of the control of nix (for example, supplying your own data dir, postgesql.conf, etc)


## Getting started


1. [Install Nix](https://github.com/DeterminateSystems/nix-installer?tab=readme-ov-file#usage)
2. Next, run `nix profile install github:samrose/pgex#pgex` . This command will install the latest Postgresql release binaries to your system $PATH. Once this command completes, you can check that the Postgres binaries are being source by nix:
    ```
    $ which initb
    /home/<youruser>/.nix-profile/bin/initdb
    $ which postgres
    /home/<youruser>/.nix-profile/bin/postgres
    
    ```
    ... the `nix profile install` command is roughly equal to `apt install` on Debian-based systems, and installs a pre-built package + fixing system paths to that package. However, you are still able to interact with the binaries outside of the "nix" context, just as you are with other package managers.
3. Now, for convenience sake, you can run `chmod +x init.sh && ./initsh` and this will populate a database here in the project directory under the `postgres` and `postgres_data` dirs.
4. The `./init.sh` script simply runs the `initdb` command supplied by the `postgresql` package under the hood. This produces the following directories:
   ```
   postgres
   postgres_data
   ```
   `initdb` writes a default mutable `postgresql.conf` file under `postgres_data` which is completely customizeable by the user of this package. All of the configuration settings should work as expected.
5. Run the server with this command
    ```
    $ postgres -D postgres_data #postgres finds the posgresql.conf in the postgres_data dir automatically
    2024-02-23 09:32:34.404 EST [1586346] LOG:  starting PostgreSQL 15.5 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit
    2024-02-23 09:32:34.405 EST [1586346] LOG:  listening on IPv4 address "0.0.0.0", port 5432
    2024-02-23 09:32:34.405 EST [1586346] LOG:  listening on IPv6 address "::", port 5432
    2024-02-23 09:32:34.407 EST [1586346] LOG:  listening on Unix socket "/home/sam/pgex/postgres/.s.PGSQL.5432"
    2024-02-23 09:32:34.411 EST [1586349] LOG:  database system was shut down at 2024-02-23 09:32:12 EST
    2024-02-23 09:32:34.415 EST [1586346] LOG:  database system is ready to accept connections

    ```
6. Connect via the `psql` client like this:
   ```
    $ psql -h $PWD/postgres -U postgres
    psql (15.5)
    Type "help" for help.

    postgres=# 
   ```
