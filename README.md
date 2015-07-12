# Pikka Bird (Puppet)

Pikka Bird ops monitoring tool Puppet module.

A [Puppet][puppet] module for [Pikka Bird Collector][collector] and
[Pikka Bird Server][server], making installation, configuration, and upgrades
as easy as flipping a pancake.

Pikka Bird is currently in a draft phase, which means that payloads and schemas
might be changed in a backwards-incompatible fashion. Although it is unlikely,
in extreme cases this could require you to reinstall with an empty database. If
this upsets you too much, please say hello and come back later. :) Currently, it
is not recommended that you use Pikka Bird as a replacement for any of your
usual monitoring tools.

More sleep lost by [tiredpixel](https://www.tiredpixel.com/).


## Installation

Install the following externals:

- Operating System
  
  Obviously, you need one of these! ;) But which ones are supported? Currently,
  I'm developing this against Ubuntu Server, which means I'm certainly happy to
  support the broader Debian family. But I'd very much like to support other
  families, too, for all components of Pikka Bird (this module,
  [Pikka Bird Collector][collector], [Pikka Bird Server][server]). If you're
  running other operating systems and would like to help, please get in touch,
  and I can work out whether we can support it. :) [tiredpixel]

- [Puppet][puppet]
  
  Recent versions of [Puppet][puppet] are supported.
  (A patch detailing which versions this works for is welcome.)


## Usage

The module is split down the middle into two components:
[Pikka Bird Collector][collector] and [Pikka Bird Server][server]. The packages
used are those released to [Pip][pip]; everything else is defined in this
module (there are currently no separate OS packages).

The Collector, by default, also manages creating a system user, installing
[Python][python] dependencies, and upgrading [Pip][pip] (needed if you're using
an OS version which is too old to resolve dependencies properly). But you can
disable this behaviour if you don't need it or are trying to install on servers
which have control over these things (e.g. if you're monitoring servers hosting
[Python][python] apps.)

The Server, by default, also manages installing [PostgreSQL][postgresql]
package dependencies (just the bindings, not the whole database). Again, you can
disable this behaviour if you don't need it. Installation of the database itself
is your problem, as is creating the desired database and user. :) There are no
plans for this module to try to control that, as there is already an excellent
module which handles this for you, and if you're not using it, you probably have
your own ways of setting it up anyway. [Pikka Bird Server][server] only supports
[PostgreSQL][postgresql], and there are no plans to change this.

It is expected that the Server will also be running the Collector; I can't think
why you wouldn't want to monitor the server actually collecting the data. :)
It is possible to not install the Collector if you desire, but the management of
[Pip][pip], system users, etc. is only present in the Collector, so you'd have
to handle this yourself, if so.

### Pikka Bird Collector

To create a system user, upgrade [Pip][pip], install
[Pikka Bird Collector][collector], define the `pikka-bird-collector` service,
bring it online, and start sending metrics to [Pikka Bird Server][server]:

    class { '::pikka_bird::collector':
      package_ensure => '0.2.0', # optional, but recommended
      server_uri     => 'http://pikka-bird.example.com:8042',
    }

What is monitored by default is up to [Pikka Bird Collector][collector] to
decide. Currently, this is: load average; CPU usage; memory usage; disk usage.

See [Reference](#reference) for details of parameters supported.

### Pikka Bird Server

To install [PostgreSQL][postgresql] package dependencies (just the bindings),
install [Pikka Bird Server][server], define the `pikka-bird-server` service,
migrate the database, bring it online, and start listening for metrics from
[Pikka Bird Collector][collector]:

    class { '::pikka_bird::server':
      package_ensure => '0.1.0', # optional, but recommended
      database_uri   => 'postgresql://pikka_bird:@localhost:5432/pikka_bird',
    }

Multiple workers are started by default; the intention is for the default
settings set up by the above to be production-grade. But of course you can tune
them if you like. :)

See [Reference](#reference) for details of parameters supported.


## Reference

### pikka_bird::collector

- `ensure`:
  State of class.
  (NOTE: There are currently issues with uninstall.)
  (default: `present`)

- `format`:
  Which format to send metrics in (binary or JSON).
  (default: `binary`)

- `interval`:
  How frequently, on average, to send metrics after the previous collection. (s)
  (default: `60`)

- `log_level`:
  Log level.
  (default: `INFO`)

- `package_ensure`:
  State of [Pikka Bird Collector][collector] package.
  (default: `present`)

- `package_manage`:
  Whether to manage [Pikka Bird Collector][collector] package.
  (default: `true`)

- `package_name`:
  Name of [Pikka Bird Collector][collector] package.
  (default: `pikka-bird-collector`)

- `path`:
  `PATH` to use in execution.
  (default: `/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin`)

- `path_conf`:
  Location of `conf.d/` directory containing service definitions.
  (default: `/etc/pikka-bird-collector/conf.d`)

- `path_config`:
  Location of service configuration.
  (default: `/etc/default/pikka-bird-collector`)

- `path_daemon`:
  Location of service daemon.
  (default: `/usr/local/bin/pikka-bird-collector`)

- `path_etc`:
  Location of `etc/`.
  (default: `/etc/pikka-bird-collector`)

- `path_init`:
  Location of `init.d/` script.
  (default: `/etc/init.d/pikka-bird-collector`)

- `path_log`:
  Location of logs.
  (default: `/var/log/pikka-bird-collector`)

- `path_manage`:
  Whether to manage locations, creating directories, etc.
  (default: `true`)

- `path_mode`:
  (TODO: fix this)

- `path_pid`:
  Location of service pid record.
  (default: `/var/run/pikka-bird-collector.pid`)

- `pip_ensure`:
  Version of [Pip][pip] to install.
  (default: `latest`)

- `pip_manage`:
  Whether to manage [Pip][pip].
  (default: `true`)

- `pip_name`:
  Name of [Pip][pip] package.
  (default: `pip`)

- `python_dev`:
  Whether to install [Python][python] dev dependencies.
  (default: `true`)

- `python_manage`:
  Whether to manage [Python][python].
  (default: `true`)

- `python_pip`:
  Whether to install [Pip][pip].
  (default: `true`)

- `python_version`:
  Version of Python to use or install.
  (default: `system`)

- `server_uri`:
  Address of [Pikka Bird Server][server].
  (default: `http://pikka-bird:${server_port}`)

- `service_enable`:
  Whether to enable [Pikka Bird Collector][collector] service.
  (default: `true`)

- `service_ensure`:
  Status of [Pikka Bird Collector][collector] service.
  (default: `running`)

- `service_manage`:
  Whether to manage [Pikka Bird Collector][collector] service.
  (default: `true`)

- `service_name`:
  Name of [Pikka Bird Collector][collector] service.
  (default: `pikka-bird-collector`)

- `user_manage`:
  Whether to manage system user.
  (default: `true`)

- `user_name`:
  Name of system user.
  (default: `pikka-bird`)

### pikka_bird::server

- `ensure`:
  State of class.
  (NOTE: There are currently issues with uninstall.)
  (default: `present`)

- `bind_ip`:
  IP to bind to for listening.
  (default: `0.0.0.0`)

- `database_uri`:
  URI of [PostgreSQL][postgresql] database, containing credentials.
  (NOTE: An open issue in [Pikka Bird Server][server] means it is currently not
  possible to supply this without leaking the URI to all users on the server; if
  you need to keep this private until it's sorted, you might like to use
  [PostgreSQL][postgresql] `user` authentication rather than `MD5`.)
  (default: `postgresql://pikka_bird:@localhost:5432/pikka_bird`)

- `libpq_dev_ensure`:
  State of [PostgreSQL][postgresql] bindings dependency package.
  (default: `present`)

- `libpq_dev_manage`:
  Whether to manage [PostgreSQL][postgresql] bindings dependency package.
  (default: `true`)

- `libpq_dev_name`:
  Name of [PostgreSQL][postgresql] bindings dependency package.
  (default: `pikka-bird-server`)

- `log_level`:
  Log level.
  (default: `INFO`)

- `package_ensure`:
  State of [Pikka Bird Server][server] package.
  (default: `present`)

- `package_manage`:
  Whether to manage [Pikka Bird Server][server] package.
  (default: `true`)

- `package_name`:
  Name of [Pikka Bird Server][server] package.
  (default: `pikka-bird-server`)

- `path`:
  `PATH` to use in execution.
  (default: `/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin`)

- `path_config`:
  Location of service configuration.
  (default: `/etc/default/pikka-bird-server`)

- `path_daemon`:
  Location of service daemon.
  (default: `/usr/local/bin/pikka-bird-server`)

- `path_etc`:
  Location of `etc/`.
  (default: `/etc/pikka-bird-server`)

- `path_init`:
  Location of `init.d/` script.
  (default: `/etc/init.d/pikka-bird-server`)

- `path_log`:
  Location of logs.
  (default: `/var/log/pikka-bird-server`)

- `path_manage`:
  Whether to manage locations, creating directories, etc.
  (default: `true`)

- `path_mode`:
  (TODO: fix this)

- `path_pid`:
  Location of service pid record.
  (default: `/var/run/pikka-bird-server.pid`)

- `port`:
  Port to listen on.
  (default: `8042`)

- `service_enable`:
  Whether to enable [Pikka Bird Server][server] service.
  (default: `true`)

- `service_ensure`:
  Status of [Pikka Bird Server][server] service.
  (default: `running`)

- `service_manage`:
  Whether to manage [Pikka Bird Server][server] service.
  (default: `true`)

- `service_name`:
  Name of [Pikka Bird Server][server] service.
  (default: `pikka-bird-server`)

- `user_name`:
  Name of system user.
  (default: `pikka-bird`)

- `workers`:
  Number of workers to start.
  (default: `16`)


## Development

- Libraries

  Using [Bundler](http://gembundler.com/), `bundle install`.

The default Ruby version supported is defined in `.ruby-version`.
Any other versions supported are defined in `.travis.yml`.

There are currently no tests whatsoever (yes, indeed). I'm running the module in
a stack which not only compiles manifests but also runs everything across
multiple servers, so I'm currently checking patches directly there. [tiredpixel]
(Patches containing tests are welcome.)


## Stay Tuned

We have a [Librelist][librelist] mailing list!
To subscribe, send an email to <pikka.bird@librelist.com>.
To unsubscribe, send an email to <pikka.bird-unsubscribe@librelist.com>.
There be [archives](http://librelist.com/browser/pikka.bird/).

You can also become a
[watcher](https://github.com/tiredpixel/pikka-bird-puppet/watchers)
on GitHub. And don't forget you can become a
[stargazer](https://github.com/tiredpixel/pikka-bird-puppet/stargazers)
if you are so minded. :D


## Contributions

Contributions are embraced with much love and affection! <3 Please fork the
repository and wizard your magic, preferably with plenty of fairy-dust sprinkled
over the tests. Then send me a pull request. :) If you're thinking about
working on something involved, it would be great if you could wave via the
issue tracker or mailing list; I'd hate for good effort to be wasted!

Do whatever makes you happy. We'll probably still like you. :)


## Blessing

May you find peace, and help others to do likewise.


## Licence

© [tiredpixel](https://www.tiredpixel.com/) 2015.
It is free software, released under the MIT License, and may be redistributed
under the terms specified in `LICENSE.txt`.


[collector]: https://github.com/tiredpixel/pikka-bird-collector-py
[librelist]: http://librelist.com/
[pip]: https://pypi.python.org/pypi/pip
[postgresql]: http://www.postgresql.org/
[puppet]: http://docs.puppetlabs.com/puppet/
[python]: https://www.python.org/
[server]: https://github.com/tiredpixel/pikka-bird-server-py
