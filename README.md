# ft_service
## This is a System Administration and Networking project.

 ## sneak peek :monocle_face:
  > Docker + Kebernetes + load balancer + dockerfile +Nginx + worldpress + phpMyadmin + FTPS + Minikube
  ## what is Docher ?! :thought_balloon:
 Docker is software that allows users to run lightweight virtual machines. You can build Docker "containers" with a Dockerfile. A container is a single lightweight virtual machine running an os, with its own memory space and storage. It is created on an image, which is a template with preconfigured software. A container differs from a virtual machine because it uses the same kernel as the host computer, whereas a virtual machine has its own kernel. Containers are faster and lighter.
 ## what is kubernetes ?! :thinking:
→Kubernetes, also known as K8s, is an open-source system for automating deployment, scaling, and management of containerized applications. groups containers that make up an application into logical units for easy management and discovery.
<br>
Why we use Kubernetes : 
<br>
- Manage hundreds of containers.
- Increased usage of containers.
- High Availability "always running"
- Scalability "high performance" + faster
- Backup and restore.
 <br>
→In Kubernetes, you have:
- Pod Smallest Unit in K8s, it creates a running env A pod is a running instance of a deployment, you can run a shell into it. It has its own IP       and its own memory space, Pods connect with each other using services.
 <br>
  - Services an object that links a deployment externally or to other containers. For example, a deployment that will link the IP 192.168.0.1 to the 10 Apache servers and pick the one that has the least workload.
<br>
- Volumes it attaches physical storage in ur hard drive that storage can be in a local machine or remote storage  outside k8s
if u want to take ur local application and release it to ur Users yo use a Web Server,
<br>
- Deployment: is The process of  moving ur code  from ur computer (localhost) to  remote public host webserver) ( and it can be access for anyone request it 

# what is Minikub ?! :thought_balloon:
Minikube it'as one Node Cluster, whew the Master processes and Work processes work on the same Node (One Machine), like (Mini-Cluster). <br>
- It will create avirtual BOX on ur laptop.
- Node Run in that  virtual Box <br>
-> :running_woman: To Run  or to config that mini-cluster , You gonna need Kublet or what we call as a Comand line "Kubctl".
<br>
**Kubelet**
- The Kubelet is the star :star2:	 of the show on every node. It’s the main Kubernetes agent, and it runs on every node in the cluster. In fact, it’s common to use the terms node and kubelet interchang eably,When you join a new node to a cluster, the process installs kubelet onto the node. The kubelet is then responsible for registering the node with the cluster.
<br>
**Kube-proxy :**
   The last piece of the node puzzle is the kube-proxy. This runs on every node in the cluster and is responsible for local cluster networking. For example, it  makes sure each node gets its own unique IP address, and implements local IPTABLES or IPVS rules to handle routing and load-balancing of traffic on the Pod network.
For Better Understanding : https://www.youtube.com/watch?v=X48VuDVv0do
## Ressources

***Docker***
 
     -https://www.freecodecamp.org/news/how-to-remove-images-in-docker/#:~:text=To%20remove%20the%20image%2C%20you,your%2Dimage%2Did%3E%20.
     -https://docs.docker.com/engine/reference/commandline/build/#:~:text=The%20docker%20build%20command%20builds,a%20file%20in%20the%20context.
     -https://www.scalyr.com/blog/create-docker-image
   
  <br>
  
***Nginx***

     -https://wiki.alpinelinux.org/wiki/Nginx#Configuration
     -https://forhjy.medium.com/42-ft-services-install-nginx-with-kubernetes-fd22a5fcb062
      
  <br>
  
***SSL***

     -https://codingwithmanny.medium.com/configure-self-signed-ssl-for-nginx-docker-from-a-scratch-7c2bcd5478c6
      
   <br>
   
   ***Kubernetes***

     -https://www.youtube.com/watch?v=X48VuDVv0do
   
 ***Minikube*** 
 
    -https://sensu.io/blog/minikube-tutorial#:~:text=Minikube%20is%20a%20utility%20you,installation%20of%20full%2Dblown%20K8s
    -https://upcloud.com/community/tutorials/deploy-kubernetes-dashboard
