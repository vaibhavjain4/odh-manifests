#!/bin/bash

copy_to_reg () {
    echo ---------------------------------------
    echo Copying $2 from $1 to Internal Registry...
    skopeo --insecure-policy copy --override-os linux --dest-tls-verify=false --dest-creds 'user:pass' docker://$1/$2 docker://localhost:18443/$2
}


copy_to_reg registry.redhat.io openshift4/ose-operator-registry:v4.5