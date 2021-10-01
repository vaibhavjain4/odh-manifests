#!/bin/bash

copy_to_reg () {
    echo ---------------------------------------
    echo Copying $2 from $1 to Internal Registry...
    skopeo --insecure-policy copy --override-os linux --dest-tls-verify=false --dest-creds 'user:pass' docker://$1/$2 docker://localhost:18443/$2
}


copy_to_reg quay.io opendatahub/opendatahub-operator:v1.1.0

### jupyterhub
copy_to_reg registry.redhat.io rhel8/postgresql-96
copy_to_reg quay.io openshift/origin-deployer:4.7.0
copy_to_reg quay.io radanalyticsio/openshift-spark-py36:2.4.5-2
copy_to_reg registry.redhat.io openshift4/ose-leader-elector-rhel8:v4.7
copy_to_reg quay.io odh-jupyterhub/jupyterhub-img:v0.3.3
copy_to_reg registry.access.redhat.com ubi8/ubi-micro:8.4
copy_to_reg quay.io internaldatahub/traefik:v1.7-build
copy_to_reg quay.io internaldatahub/configmap-puller:0.1
copy_to_reg quay.io odh-jupyterhub/s2i-spark-container:latest

#--> Jupyterhub-overlays
copy_to_reg registry.access.redhat.com ubi7/python-36
copy_to_reg quay.io odh-jupyterhub/jupyterhub-img:v0.3.3

#--> notebook-images-base
copy_to_reg quay.io odh-jupyterhub/nbviewer:latest
copy_to_reg quay.io odh-jupyterhub/s2i-spark-minimal-notebook:py36-spark2.4.5-hadoop2.7.3
copy_to_reg quay.io odh-jupyterhub/s2i-spark-minimal-notebook:3.6

#-->notebook-images-overlays-additional
copy_to_reg quay.io thoth-station/s2i-lab-elyra:v0.0.9
copy_to_reg quay.io thoth-station/s2i-generic-data-science-notebook:v0.0.5
copy_to_reg quay.io thoth-station/s2i-minimal-py38-notebook:v0.0.15
copy_to_reg quay.io thoth-station/s2i-minimal-notebook:v0.0.15
copy_to_reg quay.io thoth-station/s2i-scipy-notebook:v0.0.2
copy_to_reg quay.io odh-jupyterhub/s2i-spark-scipy-notebook:3.6
copy_to_reg quay.io thoth-station/s2i-tensorflow-notebook:v0.0.2

#--> notebook-images-overlays-build
copy_to_reg quay.io thoth-station/s2i-thoth-ubi8-py36:v0.15.0

#--> notebook-images-overlays-cuda-11.0.3
copy_to_reg nvcr.io/nvidia/cuda:11.0.3-cudnn8-devel-ubi8

#--> notebook-images-overlays-cuda
copy_to_reg registry.access.redhat.com rhscl/s2i-base-rhel7:1

# custom images built by Red Hat Team
copy_to_reg quay.io ml-aml-workshop/elyra:*

### airflow2
copy_to_reg quay.io ml-aml-workshop/airflow-custom:2.0.0.scheduler
copy_to_reg k8s.gcr.io/git-sync/git-sync:v3.2.2
copy_to_reg quay.io ml-aml-workshop/airflow-custom:2.1.6.web
copy_to_reg registry.redhat.io rhel8/postgresql-10:1-154
copy_to_reg quay.io ml-aml-workshop/airflow-custom:2.0.0.worker
copy_to_reg quay.io ml-aml-workshop/airflow-python-runner:*
copy_to_reg registry.redhat.io rhel8/redis-6:1-18 

### mlflow
copy_to_reg openshift/oauth-proxy:latest
copy_to_reg registry.access.redhat.com rhscl/postgresql-96-rhel7:latest
copy_to_reg quay.io ml-aml-workshop/mlflow:0.0.2

### radanalyticsio
#--> contains spark operator
copy_to_reg quay.io radanalyticsio/openshift-spark:2.4.5-2
copy_to_reg quay.io radanalyticsio/openshift-spark-py36:2.4.5-2
copy_to_reg quay.io jkremser/openshift-spark:2.4.0-aws
copy_to_reg quay.io radanalyticsio/spark-operator:1.1.0

### odhseldon
#--> seldon operator and its runners
copy_to_reg registry.connect.redhat.com seldonio/mock-classifier@sha256:482ee477c344badcaa80e850f4339db41957f9c2396ae24f9e398b67bd5c184e
copy_to_reg registry.connect.redhat.com seldonio/xgboostserver-grpc@sha256:3dd28690bfdf4b19d5429a26116534c3c5cd25973b12238cd0fb1dbae8c3b8ad
copy_to_reg registry.connect.redhat.com seldonio/sklearnserver-grpc@sha256:c835baa699e6fb3f6c7b0016d075758ce4827520c04429b032920efb7df27011
copy_to_reg registry.connect.redhat.com seldonio/seldon-core-executor@sha256:f46297a51ca7b2087a7ee3d3de0312024f696474af6dec4764eeb6c2daca4247
copy_to_reg registry.connect.redhat.com seldonio/storage-initializer@sha256:eb2b47a2f8c96604665b3d1a18d7e39b6a69dd5b061e0f867ab093afc294285c
copy_to_reg registry.connect.redhat.com seldonio/sklearnserver-rest@sha256:b370b068ea0ac1464e384549f45f9fb93da3b2970b60e0090829f384f5e9c5dc
copy_to_reg registry.connect.redhat.com seldonio/alibiexplainer@sha256:e08a45f335c2ef763ac10787e4718fb4a1067d6b69ff106e8eca298fc91c3616
copy_to_reg registry.connect.redhat.com seldonio/tfproxy-grpc@sha256:2d713271dfb7bd056d1011ceef218c76806313ce2e9afb8f92e22238038c1888
copy_to_reg registry.connect.redhat.com seldonio/seldon-engine@sha256:7560432beb443c9bcd1f72c765eff4b3c418faa6e22111eb0bb41f6e47182df6
copy_to_reg registry.connect.redhat.com seldonio/mlflowserver-grpc@sha256:e085e33c822b42901dcfc9e1740126bf5432aa879b870e02c8f6ebb2195f34d7
copy_to_reg registry.connect.redhat.com seldonio/mlflowserver-rest@sha256:fa87b40b1268f12a1614762bbd83960ca13ebcf15dd4fbf0b414f33f33722719
copy_to_reg registry.connect.redhat.com seldonio/xgboostserver-rest@sha256:c8a95aae4b173db7991cbe83ca1ab1bc3165ad90fdd9de10f4998604c7dfc7a5
copy_to_reg registry.connect.redhat.com seldonio/tfproxy-rest@sha256:d38464683754a4c4f01f55b4bb8942df5f08429f41711638adeda82301745361
copy_to_reg registry.connect.redhat.com seldonio/tensorflow-serving@sha256:1dc53edc5c8d1b151782f8386c0770d0358c6397eaf42ec55ebd18f331c5ef9e
copy_to_reg registry.connect.redhat.com seldonio/mock-classifier@sha256:350e900f1709c12c73fae170940b158e1d4ad6ce4ead9c884a763d8a27d770e2
copy_to_reg registry.connect.redhat.com seldonio/seldon-core-operator@sha256:174abdbca57a34b0c102a3bf87f8640121ae28f2857411039d2fc9729f23efc0
copy_to_reg registry.connect.redhat.com seldonio/tfproxy@sha256:e6ed51c45aaf1ca07ae4aaa7c2174795823dd92d7cc1073757ce671fb12abcbb        
copy_to_reg registry.connect.redhat.com seldonio/mock-classifier@sha256:35952ee4778151cd5fc69929b94e82e2dcb0ad111ffb76f7b406a2e8cc461700
copy_to_reg registry.connect.redhat.com seldonio/storage-initializer@sha256:3bd2c461a522b8de3a350cac259b6188c092fd032f0b38ad446fc5be4a3d2d34
copy_to_reg registry.connect.redhat.com seldonio/mlflowserver@sha256:05cc0ecb43052aedb27954f478c059c08a8f133df71f96a39ab7eeabd0329dcd
copy_to_reg registry.connect.redhat.com seldonio/xgboostserver@sha256:85a572a03e2c0ce1a7fb10c622f73c65d717a6e05c1ee00f5148b25774394f0b
copy_to_reg registry.connect.redhat.com seldonio/seldon-engine@sha256:eac00afa854e5e03f367c5b052b631b20246f0b068f92669f04facc1d6d88ee0
copy_to_reg registry.connect.redhat.com seldonio/alibiexplainer@sha256:a8f17861182f9611d50af0db2c93b9ddb6077b8b1919867ca92afe368886ffcd
copy_to_reg registry.connect.redhat.com seldonio/seldon-core-operator@sha256:d50e4585f1f212b3fd5aa4200ccb2e2260b44cf17ed4d0fc89bfa61cf1969b9b
copy_to_reg registry.connect.redhat.com seldonio/seldon-core-executor@sha256:2831ca7ae5a1451df2b8ebe26784a9b8e2ef80834350a76512b9f6790c6a0e55
copy_to_reg registry.connect.redhat.com seldonio/sklearnserver@sha256:88d126455b150291cbb3772f67b4f35a88bb54b15ff7c879022f77fb051615ad


### misc
copy_to_reg registry.access.redhat.com ubi8/python-38:latest

###################### NICE TO HAVE IMAGES ###########################
### superset
copy_to_reg quay.io opendatahub/superset:1.1.0
copy_to_reg quay.io internaldatahub/postgresql-96-centos7:9.6
### trino
copy_to_reg quay.io cloudservices/ubi-hive:2.3.3-002
copy_to_reg registry.redhat.io rhel8/postgresql-96:latest
copy_to_reg quay.io opendatahub/trino:361

