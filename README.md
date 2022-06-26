# MaaS (Metal as a Service Quick Install)

Establishing your home office infrastructute is one of the most important steps to consider when establishing your remote workflow. Several options exist such as a rack server, or simple PC clusters, and even raspberry pi small single board computers. The most important thing to consider is that infrastructute changes becomes more difficult after it is put into production and being used to conduct business. If possible, spend time evaluating the various options to meet your remote work needs.

## Setup Tutorial

[![MaaS Tutorial](https://img.youtube.com/vi/m3d1rz0Nepk/maxresdefault.jpg)](https://www.youtube.com/embed/m3d1rz0Nepk)
link: - https://www.youtube.com/watch?v=m3d1rz0Nepk

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
- [ ] Identify MAAS compatable power management options
- [ ] Update with the Work From Home Tech Website url



## Reference Links:

### *** Note for CentOS Images ***

If you are using the MAAS CentOS 8 image you will have to update the yum repositories using the following commands

```bash
sudo sed -i -e "s|mirrorlist=|#mirrorlist=|g" /etc/yum.repos.d/CentOS-*
```

```bash
sudo sed -i -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-*
```

### Work From Home Tech YouTube Channel

Ubuntu Install for MAAS Setup: https://www.youtube.com/watch?v=ASgwQMN34JM

### Bare metal Kubernetes hands on tutorial with MAAS and Juju

https://www.youtube.com/watch?v=sLADei_c9Qg

### How to self-host Nextcloud and Collabora on Ubuntu Server, both backed by HTTPS provided by Let's Encrypt

https://juju.is/tutorials/deploy-nextcloud-and-collabora-on-ubuntu#1-introduction

### Hardware

https://servermonkey.com

### Work From Home Tech YouTube Channel Introduction

[![WFHT Channel Intro](https://img.youtube.com/vi/7zls5w3Ar1U/maxresdefault.jpg)](https://www.youtube.com/embed/7zls5w3Ar1U) 

Link - https://youtu.be/7zls5w3Ar1U

### Work From Home Tech Website

Coming Soon!