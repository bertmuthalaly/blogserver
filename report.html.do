redo-ifchange logs
goaccess logs -o /tmp/report.html \
           --log-format='%d %t %^ %^ %h:%^ %^ %^ %^ %^ "%r" %s %b %u %^' \
           --date-format='%Y/%m/%d' \
           --time-format='%H:%M:%S' \
           --ignore-crawlers \
           --geoip-database=GeoLite2-City.mmdb >&2
mv /tmp/report.html $3
