# MaaS (Metal as a Service Quick Install)

Establishing your home office infrastructute is one of the most important steps to consider when establishing your remote workflow. Several options exist such as a rack server, or simple PC clusters, and even raspberry pi small single board computers. The most important thing to consider is that infrastructute changes becomes more difficult after it is put into production and being used to conduct business. If possible, spend time evaluating the various options to meet your remote work needs.


### Node deployment

TODOS:
- [ ] Nodes deployed from the provided MAAS configuration may be issolated by subnet or network and unaccessable. Include a MAAS script to execute on each node to establish routing through the MAAS server. Currently the additional step on each node is required to establish routing.
    For Ubuntu:
    ````bash
    sudo ip route add default {NETWORK/MASK} via {MAAS_SERVER_IP}
    ````

    Update /etc/network/interfaces

    add:
    ````bash
    ip /sbin/ip route add {NETWORK/MASK} via {MAAS_SERVER_IP}
    ````
    For CentOS update the /etc/sysconfig/network-scrips/route-eth0
    append this line:
    ````bash
    {NETWORK/MASK} via {MAAS_SERVER_IP} dev eth0
    ````
- [ ] Identify MAAS compatable power manament options



## Reference Links:

### Work From Home Tech YouTube Channel

Ubuntu Install: https://www.youtube.com/watch?v=ASgwQMN34JM

### Bare metal Kubernetes hands on tutorial with MAAS and Juju

https://www.youtube.com/watch?v=sLADei_c9Qg

### How to self-host Nextcloud and Collabora on Ubuntu Server, both backed by HTTPS provided by Let's Encrypt

https://juju.is/tutorials/deploy-nextcloud-and-collabora-on-ubuntu#1-introduction

### Hardware

https://servermonkey.com

### YouTube Video




### Work From Home Tech YouTube Channel

<iframe width="560" height="315" src="https://www.youtube.com/embed/7zls5w3Ar1U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Work From Home Tech Website

TBD