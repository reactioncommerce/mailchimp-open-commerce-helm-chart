# **Deploying Mailchimp Open Commerce on to a Local Kubernetes Cluster (MiniKube)**

## **Introduction**

[MailChimp Open
Commerce](https://mailchimp.com/developer/open-commerce/) is an open
source, API-first, modular commerce stack made for technical,
growth-minded retailers.

The purpose of this document is to provide guidance on deploying an Open
Commerce environment on to a locally hosted Kubernetes cluster
(MiniKube). The intention is to provide some hands-on experience with
the Open Commerce Helm charts and the methodology behind their
configuration and deployment before you then move on to deploying Open
Commerce in a more production ready capacity such as on a cloud hosted
Kubernetes cluster via the same Helm charts.

## **Components**

-   [Docker Engine](https://www.docker.com/products/container-runtime):
    Docker Engine is the industry's de facto container runtime that runs
    on various Linux (CentOS, Debian, Fedora, Oracle Linux, RHEL, SUSE,
    and Ubuntu) and Windows Server operating systems.

-   [Kubernetes](https://kubernetes.io/): Kubernetes, also known as K8s,
    is an open-source system for automating deployment, scaling, and
    management of containerized applications.

-   [MiniKube](https://minikube.sigs.k8s.io/docs/start/): minikube is
    local Kubernetes, focusing on making it easy to learn and develop
    for Kubernetes.

-   [Helm](https://helm.sh/): Helm helps you manage Kubernetes
    applications --- Helm Charts help you define, install, and upgrade
    even the most complex Kubernetes application.

## **Environment**

This documentation has been written for and tested on Linux,
    specifically Fedora 35, but all of the included tools and
    components are also available for other operating systems such as
    Windows and Mac therefore this document can also be used as a
    reference for deploying Open Commerce locally on to non-Linux
    operating systems, although individual installation steps and
    configuration will likely differ somewhat. Please consult each
    components bespoke documentation (linked above) for guidance
    regarding non-Linux installation and configuration.

## **Installation**

To install Open Commerce on a local Kubernetes cluster we need to
perform the following steps in order.

a.  [Install Docker](#install-docker)

b.  [Install kubectl](#install-kubectl)

c.  [Install Helm](#install-helm)

d.  [Install MiniKube](#install-minikube)

e.  [Deploy Open Commerce via Helm charts](#deploy-open-commerce-via-helm-charts)

## **Install Docker**

As it is highly likely that Docker is already installed on your workstation we shall not go through the process here. If you find that you do not have Docker (e.g. performing install on a clean setup) then please consult the official Docker documentation for installation steps that meet your particular requirements (such as OS) - https://docs.docker.com/engine/install/.

## **Install Kubectl**

Now we need to install **kubectl** which is the CLI for managing a local
or remote Kubernetes environment. [Install and Set Up kubectl on Linux
\|
Kubernetes](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

1.  The process is as simple as downloading the latest released binary
    and invoking its installation.

    ```
    curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    ```

    > *![](.//media/image7.png)

2.  We can validate that kubectl is installed by running the below.

    ```
    kubectl version
    ```

    > ![](.//media/image8.png)

## **Install Helm**

We shall continue by installing **Helm** which, as mentioned above,
works as the Kubernetes package framework for our Open Commerce
deployment.

1.  The simplest method of installing Helm upon Linux is via provided the
    [installation
    script](https://helm.sh/docs/intro/install/#from-script). A benefit
    of using the install script is that it should work across the most
    popular Linux distro's and is not tied to a particular package
    manager such as **apt** or **dnf**.

2.  Simply run the following commands to perform the Helm install.

    ```
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh
    ```

    > ![](.//media/image9.png)

3.  The helm installation can be verified by running "helm version".

    ```
    helm version
    ```

    > ![](.//media/image10.png)

## **Install Minikube**

With Helm installed we can now proceed to install MiniKube. As discussed
above MiniKube shall provide us with a locally running Kubernetes
cluster, upon which we can deploy Open Commerce.

1.  We shall perform the MiniKube installation using their [provided
    binary](https://minikube.sigs.k8s.io/docs/start/).

2.  Simply run the following commands to initiate the MiniKube
    installation.

    ```
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    ```

    > *![](.//media/image11.png)
    

3.  Once the MiniKube installation has completed then the next step is
    to start the cluster using the following command. This can take a
    few moments as the necessary images are downloaded.

    ```
    minikube start
    ```

    > *![](.//media/image12.png)

4.  We can validate that we now have a Kubernetes cluster running
    locally by checking for the standard kune-system pods.

    ```
    kubectl get pods --all-namespaces
    ```

    > ![](.//media/image13.png)

5.  We now need to enable the Nginx Ingress controller within our
    MiniKube environment. This is as simple as running the following
    command.

    ```
    minikube addons enable ingress
    ```

    > *![](.//media/image14.png)

## **Deploy Open Commerce via Helm charts**

Now that our local Kubernetes cluster is available, we can begin to
deploy Open Commerce via the Helm charts.

1.  Begin by cloning the Git repo that contains our Helm charts.

    ```
    mkdir helm
    cd helm
    git clone https://github.com/reactioncommerce/mailchimp-open-commerce-helm-chart.git
    ```

2.  Now that we have the Helm chart available locally, we need to make
    some changes to its input values to ensure that it will run atop
    MiniKube and in particular utilise the Nginx Ingress controller.
    Begin my navigating to the values.yaml file and creating a copy of
    it.

    ```
    cd mailchimp-open-commerce-helm-chart
    cp values.yaml myvalues.yaml
    ```

    > *![](.//media/image16.png)

3.  Now that we have cloned the **values.yaml** to **myvalues.yaml** we
    will need to amend the **myvalues.yaml** file to include the
    following annotations under the ingress objects for the Admin panel.
    You can do this using your favourite text editor, such as **vi**.

    ```
    kubernetes.io/ingress.class: nginx,

    nginx.ingress.kubernetes.io/ssl-redirect: "false",

    nginx.ingress.kubernetes.io/proxy-buffer-size: "128k",

    nginx.ingress.kubernetes.io/proxy-buffers-number: "4\,

    nginx.ingress.kubernetes.io/proxy-send-timeout: 3600,

    nginx.ingress.kubernetes.io/proxy-read-timeout: 3600
    ```

    > ![](.//media/image17.png)

4.  There are many other values that can be amended, dependent upon your
    personal preferences and environment (such as enabling the GraphQL
    Playground for the API service) but they are out of scope for this
    tutorial. The only other change I shall be making to the
    **myvalues.yaml** file is to disable SSL for each service (Admin,
    API and StoreFront) by setting "ssl: false" for each, this is a
    personal preference as we are deploying the solution locally so have
    no worries regarding securing public access. Disabling SSL will
    simply prevent browser invalid certificate warnings when perusing
    the sites.
    
    > ![](.//media/image18.png) ![](.//media/image19.png) ![](.//media/image20.png)

5.  With our **myvalues.yaml** file ready we can now perform the
    deployment of our Open Commerce helm chart using the following
    commands.

    ```
    helm dependency update
    helm install opencommerce . -f ./myvalues.yaml
    ```

    > *![](.//media/image21.png)

6.  Although we shall receive a console message indicating that the
    deployment is complete it will infact take several minutes for
    Kubernetes to download and deploy the service images. Progress for
    this process can be checked as follows.

    ```
    kubectl get pods
    ```

    > ![](.//media/image22.png)

7.  Whilst the numerous services and pods are being set up, we can
    prepare our local hosts file with the domain names for the Open
    Commerce deployment. Begin by running the following command to
    attain your local MiniKube IP.

    ```
    minikube ip
    ```

    > *![](.//media/image23.png)

8.  We then take this IP and add the following entries to our local
    */etc/hosts* file using our text editor of choice.

    ```
    <MiniKube IP> admin.example.shop
    <MiniKube IP> api.example.shop
    <MiniKube IP> example.shop
    ```

    > ![](.//media/image24.png)

9.  We should also now find that enough time has passed for our Open
    Commerce pods to have initialised.

    ```
    kubectl get pods
    ```

    > ![](.//media/image25.png)

10. With our pods running, our Nginx controller managing ingress and our
    updated hosts file we should now be able to browse to the different
    services.

    Admin Panel: http://admin.example.shop \
    API: http://api.example.shop \
    Example StoreFront: http://example.shop

    > ![](.//media/image26.png)

## **Summary**

 With that we have a full Open Commerce environment deployed locally.
 The next logical steps will be to create an Admin user within the
 Admin Panel and then create a demo shop and products which should
 become visible in the example StoreFront post creation.

 Once you are familiar with the Open Commerce deployment steps, using
 Helm, on a local Kubernetes cluster then please consult our follow up
 documentation for deploying Open Commerce on to a cloud provider.
