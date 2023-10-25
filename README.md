# telegraf-knot

[![Actions](https://github.com/x70b1/telegraf-knot/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/x70b1/telegraf-knot/actions)
[![Contributors](https://img.shields.io/github/contributors/x70b1/telegraf-knot.svg)](https://github.com/x70b1/telegraf-knot/graphs/contributors)
[![License](https://img.shields.io/github/license/x70b1/telegraf-knot.svg)](https://github.com/x70b1/telegraf-knot/blob/master/LICENSE)

A [Telegraf](https://github.com/influxdata/telegraf) plugin to collect stats from [Knot DNS](https://knot.readthedocs.io/en/master/operation.html#statistics).


## Configuration

Enable the `mod-stats` module of knot according the Knot DNS [docs](https://www.knot-dns.cz/docs/latest/html/modules.html#stats-query-statistics).
The script accepts a parameter `-s` to specify the path to the Knot DNS socket.
To allow Telegraf to request the stats it needs a sudo rule as shown.


```
telegraf    ALL = NOPASSWD: /usr/sbin/knotc -f stats
```

```ini
[[inputs.exec]]
  command = "sh /opt/telegraf/telegraf-knot.sh -s /run/knot/knot.sock"
  data_format = "influx"

  interval = "10s"
```


## Output

```sh
# sh /opt/telegraf/telegraf-knot.sh
server zone-count=4
rrl slipped=0
rrl dropped=0
stats,protocol=udp4 request-protocol=36411
stats,protocol=tcp4 request-protocol=18
stats,protocol=udp6 request-protocol=3378
stats,protocol=tcp6 request-protocol=32
stats,protocol=udp4-xdp request-protocol=0
stats,protocol=tcp4-xdp request-protocol=0
stats,protocol=udp6-xdp request-protocol=0
stats,protocol=tcp6-xdp request-protocol=0
stats,operation=query server-operation=39834
stats,operation=update server-operation=0
stats,operation=notify server-operation=5
stats,operation=axfr server-operation=0
stats,operation=ixfr server-operation=0
stats,operation=invalid server-operation=0
stats,bytes=query request-bytes=1701997
stats,bytes=update request-bytes=0
stats,bytes=other request-bytes=1081
stats,bytes=reply response-bytes=4483610
stats,bytes=transfer response-bytes=0
stats,bytes=other response-bytes=802
stats,code=NOERROR response-code=38986
stats,code=FORMERR response-code=5
stats,code=SERVFAIL response-code=0
stats,code=NXDOMAIN response-code=746
stats,code=NOTIMPL response-code=0
stats,code=REFUSED response-code=102
stats,code=YXDOMAIN response-code=0
stats,code=YXRRSET response-code=0
stats,code=NXRRSET response-code=0
stats,code=NOTAUTH response-code=0
stats,code=NOTZONE response-code=0
stats,code=BADSIG response-code=0
stats,code=BADVERS response-code=0
stats,code=BADKEY response-code=0
stats,code=BADTIME response-code=0
stats,code=BADMODE response-code=0
stats,code=BADNAME response-code=0
stats,code=BADALG response-code=0
stats,code=BADTRUNC response-code=0
stats,code=BADCOOKIE response-code=0
stats,code=other response-code=0
stats,type=other query-type=0
stats,type=A query-type=34687
stats,type=NS query-type=81
stats,type=TYPE3 query-type=0
stats,type=TYPE4 query-type=0
stats,type=CNAME query-type=470
stats,type=SOA query-type=64
stats,type=TYPE7 query-type=0
stats,type=TYPE8 query-type=0
stats,type=TYPE9 query-type=0
stats,type=NULL query-type=0
stats,type=TYPE11 query-type=0
stats,type=PTR query-type=3
stats,type=HINFO query-type=0
stats,type=MINFO query-type=0
stats,type=MX query-type=248
stats,type=TXT query-type=344
stats,type=RP query-type=0
stats,type=AFSDB query-type=1
stats,type=TYPE19 query-type=0
stats,type=TYPE20 query-type=0
stats,type=RT query-type=0
stats,type=TYPE22 query-type=0
stats,type=TYPE23 query-type=0
stats,type=SIG query-type=0
stats,type=KEY query-type=0
stats,type=TYPE26 query-type=0
stats,type=TYPE27 query-type=0
stats,type=AAAA query-type=2838
stats,type=LOC query-type=0
stats,type=TYPE30 query-type=0
stats,type=TYPE31 query-type=0
stats,type=TYPE32 query-type=0
stats,type=SRV query-type=1
stats,type=TYPE34 query-type=0
stats,type=NAPTR query-type=2
stats,type=KX query-type=0
stats,type=CERT query-type=0
stats,type=TYPE38 query-type=3
stats,type=DNAME query-type=0
stats,type=TYPE40 query-type=0
stats,type=OPT query-type=0
stats,type=APL query-type=0
stats,type=DS query-type=1
stats,type=SSHFP query-type=0
stats,type=IPSECKEY query-type=0
stats,type=RRSIG query-type=5
stats,type=NSEC query-type=0
stats,type=DNSKEY query-type=940
stats,type=DHCID query-type=0
stats,type=NSEC3 query-type=0
stats,type=NSEC3PARAM query-type=0
stats,type=TLSA query-type=0
stats,type=SMIMEA query-type=0
stats,type=TYPE54 query-type=0
stats,type=TYPE55 query-type=0
stats,type=TYPE56 query-type=0
stats,type=TYPE57 query-type=0
stats,type=TYPE58 query-type=0
stats,type=CDS query-type=2
stats,type=CDNSKEY query-type=1
stats,type=OPENPGPKEY query-type=0
stats,type=CSYNC query-type=0
stats,type=ZONEMD query-type=0
stats,type=SVCB query-type=1
stats,type=HTTPS query-type=0
stats,type=SPF query-type=0
stats,type=TYPE100 query-type=0
stats,type=TYPE101 query-type=0
stats,type=TYPE102 query-type=0
stats,type=TYPE103 query-type=0
stats,type=NID query-type=0
stats,type=L32 query-type=0
stats,type=L64 query-type=0
stats,type=LP query-type=0
stats,type=EUI48 query-type=0
stats,type=EUI64 query-type=0
stats,type=TYPE110 query-type=0
stats,type=ANY query-type=83
stats,type=URI query-type=0
stats,type=CAA query-type=59
stats,type=TYPE258 query-type=0
stats,type=TYPE259 query-type=0
stats,type=TYPE260 query-type=0
```
