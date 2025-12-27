# blogserver

a blog server with all static files embedded into the binary.
built with djb redo.

# rationale

none really, it just seemed fun!

# performance

on my M1 macbook it looks like 50k requests per second:

```
~/c/blogserver:main:> wrk --latency -t16 -c1000 -d30s http://127.0.0.1:8080
Running 30s test @ http://127.0.0.1:8080
  16 threads and 1000 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     4.84ms    7.55ms 131.49ms   91.31%
    Req/Sec     3.92k     2.21k   12.43k    63.87%
  Latency Distribution
     50%    2.65ms
     75%    4.58ms
     90%   10.80ms
     99%   38.94ms
  1522321 requests in 30.10s, 13.67GB read
  Socket errors: connect 755, read 104, write 0, timeout 0
Requests/sec:  50583.38
Transfer/sec:    464.99MB
```

on a 1 VCPU DigitalOcean box in NYC it looks like 3.5k requests per second:

```
~/c/blogserver:main: (1)> wrk -t16 -c400 -d30s http://68.183.140.82:8080
Running 30s test @ http://68.183.140.82:8080
  16 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    74.56ms   91.39ms   2.00s    98.33%
    Req/Sec   222.61    119.94   475.00     59.42%
  104430 requests in 30.10s, 0.94GB read
  Socket errors: connect 163, read 0, write 0, timeout 35
Requests/sec:   3469.50
Transfer/sec:     31.89MB
```

# building

Ensure you have go, a djb redo implementation, and commonmark (to convert md -> html). I'm using commonmark-gfm for the footnotes extension.
```
brew install cmark-gfm redo go
```

To build locally, `redo blogserver`.
To deploy, `redo deploy`.
There's an unfortunate name collision between the `blogserver` binary and the `blogserver` hostname - I'll improve that at some point.

# improvements

* Want to run certbot or other ACME infra somehow, maybe as a part of the same binary to keep deployment simple.
* Would be nice to run jart's pledge port to privilege restrict the server binary.
* Maybe we could do blue/green deploys to eliminate unnecessary downtime while scp is running (lol).
* Maybe we could run a few instances and have multiple DNS servers that route you to whichever one is closest.
  * How many DNS servers can you have in your DNS records?

