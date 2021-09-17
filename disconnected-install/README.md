# Disconnected Install of ODH 

Step1: Collect all the required images. [Image-list.dat](Image-list.dat)

There are multiple ways to get the images. some of the methods you can use are listed below:

    * Manual method: This is the most time taking process of finding the images. In This method one needs to go to each file in the manifest and then check for images being used. for subscription, we will have to use the below command to find the images
        `Command:  
        oc get packagemanifests -n openshift-marketplace | grep seldon-operator-certified
        oc describe packagemanifests seldon-operator-certified -n openshift-marketplace
        ` 
    * Git Search method: In this method, you will provide the search paramater and find the images for the project using the GITHUB search tool. The only downside in this method is that, you need to know all the registries that the repo may use and it does not provide the images for "subscription" objects
       `Example: https://github.com/opendatahub-io/odh-manifests/search?p=1&q=quay.io&type=Code` 
    * Live cluster method: Kube commands are executed on on live ODH cluster to extract all the required images. This is good method to know the images but this may not provide the images which were short lived. 
        `Example: 
        oc describe  po | grep Image:
        oc describe  deploy | grep Image:
        oc describe  dc | grep Image:`

Step2: Import all the images to your local Image registry. A sample script is provided for skopeo [copy_to_internal.sh](copy_to_internal.sh)
// TODO

Step3: Modify the manifest files
// TODO

Step4: Run the installation
// TODO