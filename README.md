# asterisk for docker

## 1. build image
`$ docker build -t sss666/asterisk ./`

## 2. create container
```
$ docker run -d -p 5060:5060/udp  sss666/asterisk

or

$ cd compose/; docker-compose -f compose.yaml up -d
```

## 2. about sip
you can change port of sip (which is udp port) by modifing file `conf/sip.conf`, here we use `5060`. And there are two built-in users `123456` and `666666`, their passwords are `p123456` and `p666666`. If you want to add user, you should modify files `./conf/sip.conf` and `./conf/extensions.conf` by adding sections like:
```
$ ./conf/sip.conf

[123456](ramal-voip)

secret=p123456
callerid="me" <123456>
```
and 
```
$ ./conf/extensions.conf

exten => 123456,1,Answer()
exten => 123456,n,Dial(SIP/123456,20,tr)
exten => 123456,n,Hangup
```

