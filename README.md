# docker-openfalcon-fe

## Build

Enter the following command in the repo directory.

```
$sudo docker build --force-rm=true -t openfalcon-fe .
```

## Run

### Basic Run

Use default configuration, and falcon-fe package.

```
$sudo docker run -dti --name fe -p 1234:1234 openfalcon-fe
```

### Advanced Run

+ Self-defined configuration

    Replace file **cfg.json** in the volume */config*.  
    For more detail about **cfg.json**, see [Fe](http://book.open-falcon.com/zh/install/fe.html).

+ New falcon-fe package

    Replace file **falcon-fe.tar.gz** in the volume */package*.
    
For example, **cfg.json** in /tmp/config and **falcon-fe.tar.gz** in /tmp/pack,

```
$sudo docker run -dti --name fe -v /tmp/pack:/package -v /tmp/config/cfg.json:/config/cfg.json -p 1234:1234 openfalcon-fe
```
