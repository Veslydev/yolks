# Yolks

A curated collection of core images that can be used with Pterodactyl's Egg system. Each image is rebuilt
periodically to ensure dependencies are always up-to-date.

Images are hosted on `ghcr.io` and exist under the `games`, `installers`, and `yolks` spaces. The following logic
is used when determining which space an image will live under:

* `games` — anything within the `games` folder in the repository. These are images built for running a specific game
or type of game.
* `installers` — anything living within the `installers` directory. These images are used by install scripts for different
Eggs within Pterodactyl, not for actually running a game server. These images are only designed to reduce installation time
and network usage by pre-installing common installation dependencies such as `curl` and `wget`.
* `yolks` — these are more generic images that allow different types of games or scripts to run. They're generally just
a specific version of software and allow different Eggs within Pterodactyl to switch out the underlying implementation. An
example of this would be something like Java or Python which are used for running bots, Minecraft servers, etc.

All of these images are available for `linux/amd64` and `linux/arm64` versions, unless otherwise specified, to use
these images on an arm system, no modification to them or the tag is needed, they should just work.

## Contributing

When adding a new version to an existing image, such as `java v42`, you'd add it within a child folder of `java`, so
`java/42/Dockerfile` for example. Please also update the correct `.github/workflows` file to ensure that this new version
is tagged correctly.

## Available Images

### [Oses](/oses)

* [alpine](/oses/alpine)
  * `ghcr.io/veslydev/yolks:alpine`
* [debian](/oses/debian)
  * `ghcr.io/veslydev/yolks:debian`
* [ubuntu](/oses/ubuntu)
  * `ghcr.io/veslydev/yolks:ubuntu`

### [Apps](/apps)

* [`uptimekuma`](/apps/uptimekuma)
  * `ghcr.io/veslydev/yolks:apps_uptimekuma`

### [Bot](/bot)

* [`bastion`](/bot/bastion)
  * `ghcr.io/veslydev/yolks:bot_bastion`
* [`parkertron`](/bot/parkertron)
  * `ghcr.io/veslydev/yolks:bot_parkertron`
* [`redbot`](/bot/red)
  * `ghcr.io/veslydev/yolks:bot_red`
* [`sinusbot`](/bot/sinusbot)
  * `ghcr.io/veslydev/yolks:bot_sinusbot`

### [Box64](/box64)

* [`Box64`](/box64)
  * `ghcr.io/veslydev/yolks:box64`

### [Bun](/bun)

* [`Bun Canary`](/bun/canary)
  * `ghcr.io/veslydev/yolks:bun_canary`
* [`Bun Latest`](/bun/latest)
  * `ghcr.io/veslydev/yolks:bun_latest`

### [Cassandra](/cassandra)

* [`cassandra_java8_python27`](/cassandra/cassandra_java8_python2)
  * `ghcr.io/veslydev/yolks:cassandra_java11_python2`
* [`cassandra_java11_python3`](/cassandra/cassandra_java11_python3)
  * `ghcr.io/veslydev/yolks:cassandra_java11_python3`

### [Dart](/dart)

* [`dart2.17`](/dart/2.17)
  * `ghcr.io/veslydev/yolks:dart_2.17`
* [`dart2.18`](/dart/2.18)
  * `ghcr.io/veslydev/yolks:dart_2.18`
* [`dart2.19`](/dart/2.19)
  * `ghcr.io/veslydev/yolks:dart_2.19`
* [`dart3.3`](/dart/3.3)
  * `ghcr.io/veslydev/yolks:dart_3.3`
* [`dart stable`](/dart/stable)
  * `ghcr.io/veslydev/yolks:dart_stable`

### [dotNet](/dotnet)

* [`dotnet2.1`](/dotnet/2.1)
  * `ghcr.io/veslydev/yolks:dotnet_2.1`
* [`dotnet3.1`](/dotnet/3.1)
  * `ghcr.io/veslydev/yolks:dotnet_3.1`
* [`dotnet5.0`](/dotnet/5)
  * `ghcr.io/veslydev/yolks:dotnet_5`
* [`dotnet6.0`](/dotnet/6)
  * `ghcr.io/veslydev/yolks:dotnet_6`
* [`dotnet7.0`](/dotnet/7)
  * `ghcr.io/veslydev/yolks:dotnet_7`
* [`dotnet8.0`](/dotnet/8)
  * `ghcr.io/veslydev/yolks:dotnet_8`

### [Elixir](/elixir)

* [`elixir 1.12`](/elixir/1.12)
  * `ghcr.io/veslydev/yolks:elixir_1.12`
* [`elixir 1.13`](/elixir/1.13)
  * `ghcr.io/veslydev/yolks:elixir_1.13`
* [`elixir 1.14`](/elixir/1.14)
  * `ghcr.io/veslydev/yolks:elixir_1.14`
* [`elixir 1.15`](/elixir/1.12)
  * `ghcr.io/veslydev/yolks:elixir_1.15`
* [`elixir latest`](/elixir/latest)
  * `ghcr.io/veslydev/yolks:elixir_latest`

### [Erlang](/erlang)

* [`erlang22`](/erlang/22)
  * `ghcr.io/veslydev/yolks:erlang_22`
* [`erlang23`](/erlang/23)
  * `ghcr.io/veslydev/yolks:erlang_23`
* [`erlang24`](/erlang/24)
  * `ghcr.io/veslydev/yolks:erlang_24`

### [Games](/games)

* [`altv`](/games/altv)
  * `ghcr.io/veslydev/games:altv`
* [`arma3`](/games/arma3)
  * `ghcr.io/veslydev/games:arma3`
* [`dayz`](/games/dayz)
  * `ghcr.io/veslydev/games:dayz`
* [`minetest`](/games/minetest)
  * `ghcr.io/veslydev/games:minetest`  
* [`mohaa`](games/mohaa)
  * `ghcr.io/pterodactyl/games:mohaa`  
* [`Multi Theft Auto: San Andreas`](games/mta)
  * `ghcr.io/pterodactyl/games:mta`    
* [`samp`](/games/samp)
  * `ghcr.io/veslydev/games:samp`  
* [`source`](/games/source)
  * `ghcr.io/veslydev/games:source`
* [`thebattleforwesnoth`](/games/thebattleforwesnoth)
  * `ghcr.io/veslydev/games:thebattleforwesnoth`
* [`valheim`](/games/valheim)
  * `ghcr.io/veslydev/games:valheim`

### [Golang](/go)

* [`go1.14`](/go/1.14)
  * `ghcr.io/veslydev/yolks:go_1.14`
* [`go1.15`](/go/1.15)
  * `ghcr.io/veslydev/yolks:go_1.15`
* [`go1.16`](/go/1.16)
  * `ghcr.io/veslydev/yolks:go_1.16`
* [`go1.17`](/go/1.17)
  * `ghcr.io/veslydev/yolks:go_1.17`
* [`go1.18`](/go/1.18)
  * `ghcr.io/veslydev/yolks:go_1.18`
* [`go1.19`](/go/1.19)
  * `ghcr.io/veslydev/yolks:go_1.19`
* [`go1.20`](/go/1.20)
  * `ghcr.io/veslydev/yolks:go_1.20`
* [`go1.21`](/go/1.21)
  * `ghcr.io/veslydev/yolks:go_1.21`
* [`go1.22`](/go/1.22)
  * `ghcr.io/veslydev/yolks:go_1.22`

### [Java](/java)

* [`java8`](/java/8)
  * `ghcr.io/veslydev/yolks:java_8`
* [`java11`](/java/11)
  * `ghcr.io/veslydev/yolks:java_11`
* [`java16`](/java/16)
  * `ghcr.io/veslydev/yolks:java_16`
* [`java17`](/java/17)
  * `ghcr.io/veslydev/yolks:java_17`
* [`java19`](/java/19)
  * `ghcr.io/veslydev/yolks:java_19`
* [`java21`](/java/21)
  * `ghcr.io/veslydev/yolks:java_21`

### [MariaDB](/mariadb)

  * [`MariaDB 10.3`](/mariadb/10.3)
    * `ghcr.io/veslydev/yolks:mariadb_10.3`
  * [`MariaDB 10.4`](/mariadb/10.4)
    * `ghcr.io/veslydev/yolks:mariadb_10.4`
  * [`MariaDB 10.5`](/mariadb/10.5)
    * `ghcr.io/veslydev/yolks:mariadb_10.5`
  * [`MariaDB 10.6`](/mariadb/10.6)
    * `ghcr.io/veslydev/yolks:mariadb_10.6`
  * [`MariaDB 10.7`](/mariadb/10.7)
    * `ghcr.io/veslydev/yolks:mariadb_10.7`
  * [`MariaDB 11.2`](/mariadb/11.2)
    * `ghcr.io/veslydev/yolks:mariadb_11.2`
  * [`MariaDB 11.3`](/mariadb/11.3)
    * `ghcr.io/veslydev/yolks:mariadb_11.3`
  * [`MariaDB 11.4`](/mariadb/11.4)
    * `ghcr.io/veslydev/yolks:mariadb_11.4`

### [MongoDB](/mongodb)

  * [`MongoDB 4`](/mongodb/4)
    * `ghcr.io/veslydev/yolks:mongodb_4`
  * [`MongoDB 5`](/mongodb/5)
    * `ghcr.io/veslydev/yolks:mongodb_5`
 * [`MongoDB 6`](/mongodb/6)
    * `ghcr.io/veslydev/yolks:mongodb_6`    
 * [`MongoDB 7`](/mongodb/7)
    * `ghcr.io/veslydev/yolks:mongodb_7`

### [Mono](/mono)

* [`mono_latest`](/mono/latest)
  * `ghcr.io/veslydev/yolks:mono_latest`

### [Nodejs](/nodejs)

* [`node12`](/nodejs/12)
  * `ghcr.io/veslydev/yolks:nodejs_12`
* [`node14`](/nodejs/14)
  * `ghcr.io/veslydev/yolks:nodejs_14`
* [`node16`](/nodejs/16)
  * `ghcr.io/veslydev/yolks:nodejs_16`
* [`node17`](/nodejs/17)
  * `ghcr.io/veslydev/yolks:nodejs_17`
* [`node18`](/nodejs/18)
  * `ghcr.io/veslydev/yolks:nodejs_18`
* [`node19`](/nodejs/19)
  * `ghcr.io/veslydev/yolks:nodejs_19`
* [`node20`](/nodejs/20)
  * `ghcr.io/veslydev/yolks:nodejs_20`
* [`node21`](/nodejs/21)
  * `ghcr.io/veslydev/yolks:nodejs_21`

### [PostgreSQL](/postgres)

  * [`Postgres 9`](/postgres/9)
    * `ghcr.io/veslydev/yolks:postgres_9`
  * [`Postgres 10`](/postgres/10)
    * `ghcr.io/veslydev/yolks:postgres_10`
  * [`Postgres 11`](/postgres/11)
    * `ghcr.io/veslydev/yolks:postgres_11`
  * [`Postgres 12`](/postgres/12)
    * `ghcr.io/veslydev/yolks:postgres_12`
  * [`Postgres 13`](/postgres/13)
    * `ghcr.io/veslydev/yolks:postgres_13`
  * [`Postgres 14`](/postgres/14)
    * `ghcr.io/veslydev/yolks:postgres_14`  

### [Python](/python)

* [`python3.7`](/python/3.7)
  * `ghcr.io/veslydev/yolks:python_3.7`
* [`python3.8`](/python/3.8)
  * `ghcr.io/veslydev/yolks:python_3.8`
* [`python3.9`](/python/3.9)
  * `ghcr.io/veslydev/yolks:python_3.9`
* [`python3.10`](/python/3.10)
  * `ghcr.io/veslydev/yolks:python_3.10`
* [`python3.11`](/python/3.11)
  * `ghcr.io/veslydev/yolks:python_3.11`
* [`python3.12`](/python/3.12)
  * `ghcr.io/veslydev/yolks:python_3.12`

### [Redis](/redis)

  * [`Redis 5`](/redis/5)
    * `ghcr.io/veslydev/yolks:redis_5`
  * [`Redis 6`](/redis/6)
    * `ghcr.io/veslydev/yolks:redis_6`
  * [`Redis 7`](/redis/7)
    * `ghcr.io/veslydev/yolks:redis_7`

### [Rust](/rust)

* ['rust1.56'](/rust/1.56)
  * `ghcr.io/veslydev/yolks:rust_1.56`
* ['rust1.60'](/rust/1.60)
  * `ghcr.io/veslydev/yolks:rust_1.60`
* ['rust latest'](/rust/latest)
  * `ghcr.io/veslydev/yolks:rust_latest`

### [SteamCMD](/steamcmd)
* [`SteamCMD Debian lastest`](/steamcmd/debian)
  * `ghcr.io/veslydev/steamcmd:debian`
* [`SteamCMD Debian Dotnet`](/steamcmd/dotnet)
  * `ghcr.io/veslydev/steamcmd:dotnet`
* [`SteamCMD Proton`](/steamcmd/proton)
  * `ghcr.io/veslydev/steamcmd:proton`
* [`SteamCMD Proton`](/steamcmd/proton_8)
  * `ghcr.io/veslydev/steamcmd:proton_8`
* [`SteamCMD Sniper latest`](/steamcmd/sniper)
  * `ghcr.io/veslydev/steamcmd:sniper`
* [`SteamCMD Ubuntu latest LTS`](/steamcmd/ubuntu)
  * `ghcr.io/veslydev/steamcmd:ubuntu`

### [Voice](/voice)
* [`Mumble`](/voice/mumble)
  * `ghcr.io/veslydev/yolks:voice_mumble`
* [`TeaSpeak`](/voice/teaspeak)
  * `ghcr.io/veslydev/yolks:voice_teaspeak`

### [Wine](/wine)

* [`Wine`](/wine)
  * `ghcr.io/veslydev/yolks:wine_latest`
  * `ghcr.io/veslydev/yolks:wine_devel`
  * `ghcr.io/veslydev/yolks:wine_staging`

### [Installation Images](/installers)

* [`alpine-install`](/installers/alpine)
  * `ghcr.io/veslydev/installers:alpine`
* [`debian-install`](/installers/debian)
  * `ghcr.io/veslydev/installers:debian`
* [`ubuntu-install`](/installers/ubuntu)
  * `ghcr.io/veslydev/installers:ubuntu`
