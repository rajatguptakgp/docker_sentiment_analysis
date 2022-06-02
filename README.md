# docker_sentiment_analysis

### Why Docker?

Many times, code built in a system might not work in other systems and can throw errors due to missing libraries/dependencies, mismatch between dev and test environment, differences in OS system etc. To solve these issues, we would like to package the code with its dependencies (requirements.txt file) and making an independent conda environment. However, issues related to OS system can still persist - for example, building the environment in Linux OS works while not in Windows OS.  

So what if we could abstract the OS system all together to solve this issue, shipping that as well with code and dependencies. Issues shouldn't persist because the setup now will be independent of user OS. This abstraction of OS can be done with the help of **Docker** and this software package with all its elements (code, dependencies, OS build) is called **Docker Container**. The setup is done through **Docker Image** and is one-time step as long as you don't make modifications to the build.

### Virtual Machines v/s Containers

VMs are an abstraction/virtualization of **physical hardware** while containers are abstraction/virtualization of **operating system**. Multiple containers share the OS kernel with each other while each VM has its own OS kernel. This leads to containers being light in size and faster to boot compared to VMs.

### Docker commands:

1. **Docker Image:** 
    1. Build: <code>docker build -f {dockerfile_name} -t {docker_image_name} .</code>
2. **Docker Container:** 
    1. Run: <code>docker run -ti --name {container_name} -p {port1}:{port2} --net {network_name} {image_name}</code>
    2. Stop: <code>docker stop {container_id}</code>
3. **Enter running docker container:** 
    1. Through container name: <code>docker exec -ti {container_name} /bin/bash</code>
    2. Through container ID: <code>docker exec -ti {container_id} /bin/bash</code>
4. **Docker Network:**
    1. Create network: <code>docker network create {network_name}</code>
    2. Delete network: <code>docker network rm {network_name}</code> 
5. **Docker Compose:**
    1. Start all containers: <code>docker-compose -f <yaml_file_name>.yaml up</code>
    2. Stop all containers: <code>docker-compose -f <yaml_file_name>.yaml down</code>, this also removes the network

### Additional commands:
1. List: 
    1. Running containers: <code>docker ps </code>
    2. All containers (running/not-running): <code> docker ps -a</code>
    3. All networks: <code>docker network ls</code>
2. Remove: 
    1. Everything: <code>docker system prune</code>
    2. All stopped containers (-q for quiet): <code>docker rm $(docker ps --filter status=exited -q)</code>
    3. All unused networks: </code>docker network prune</code>

If your application is running on a web server inside container, the port that it is running on is inside container which is not accessible to us. So, we need to redirect it to a specified port that our container listens to. **EXPOSE** layer helps in doing that.

In order to keep the docker container running, so that we can enter it and run our commands. This can be done using CMD or ENTRYPOINT layer - <code>ENTRYPOINT ['tail' '/dev/null']</code>. Otherwise, we can run the docker container with specifying the command it should execute every time the container is run.

### Additional Notes:
1. A layer is a change on image, similar to changes tracked by Git. Layer caching.
2. Docker compose creates its own network
3. Python wheels come in ready-to-install format and skip the step of building (compiling extension modules) that comes in source distributions. Wheels already contain compiled extension modules, so no need of compiler. However, Python wheels might not be available for all OS versions. Wheels are also smaller in size than source distributions. Versions are already specified in wheels. 
