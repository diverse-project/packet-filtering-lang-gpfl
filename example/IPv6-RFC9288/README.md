## The simulator
### Input Packets
| Time | Extension header | Option | Specific Field | ACCEPT/DROP |
|------|------------------|--------|----------------|-------------|
|001 | Hop by hop | Tunnel Encapsulation Limit || ACCEPT |
|015 | Hop by hop | PadN || ACCEPT |
|016 | Hop by hop | Router-Alert | protocol = RSVP | ACCEPT |
|018 | Hop by hop | Router-Alert | protocol = MLD | ACCEPT |
|024 | Hop by hop | Router-Alert | protocol = Active network message | DROP |
|045 | Hop by hop | RPL-Option || DISCARD |
