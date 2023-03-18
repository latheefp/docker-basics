1. To check the current running image.

#docker ps 


2. To searh for an image, lets say, httpd

docker search httpd

3. to run yoru first app, httpd. 
 docker search httpd
4.  Download (pull image)

docker pull httpd

5. list the pulled image

docker list images

6. to check the exposed port

 docker inspect httpd (check  "ExposedPorts": section)
 
 7. run the first docker container.
 
 docker run -p 8080:80  -d httpd
 
 8. Check your browser for the container is running
 http://localhost:8080
 
 9. run second container, nginx 
 
 docker run -p 8081:80  -d nginx
 
10. Check the nginx is runing
 http://localhost:8081
 
 11. how to list the running containers.
 
 docker ps 
 
 12. how to list he inactive containers
 
 docer ps -a 
 
 13.  how to stop a container.
 
 docker stop <containerID>
 
 14 to see all docker container.
 
 >docker ps -a
 
 15. Delete a inactive container.
 
 docker rm e8e870058c12
 
 16. stop and delete an running container.
 
 docker rm -f <container ID>
 
 17. To list images
 
 docker images
 
 18. To remove an image:
 docker image rm <image>:tag
 