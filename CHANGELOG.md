# Pikka Bird (Puppet) Changelog

This changelog documents the main changes between released versions.
For a full list of changes, consult the commit history.


## 0.1.0

- first release! :D

- configure a fully-functional metrics collector using just 1 parameter; around
  30 parameters supported in total [tiredpixel]

- configure a fully-functional metrics server using just 1 parameter (actually,
  you could do it with 0); around 25 parameters supported in total [tiredpixel]

- support for Pikka Bird Collector 0.2.0, including: creating system user,
  upgrading Pip, installing Collector package, defining service, bringing online
  and sending metrics to Server [tiredpixel]

- support for Pikka Bird Server 0.1.0, including: installing package bindings
  dependencies, installing Server package; defining service, migrating database,
  bringing online and receiving metrics from Collector [tiredpixel]

- automatic database schema migrations [tiredpixel]

- no Collector service configs (yet), but already automatic support for: load
  average; CPU usage; memory usage; disk usage [tiredpixel]
