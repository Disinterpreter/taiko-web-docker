# Summary
 
Docker container for easily deploying a web-version of the Namco game **Taiko no Tatsujin** (taiko-web)
 
 
Dependencies:
* Docker
* Docker Compose
 
If you want to launch the container you need to use this command (this command will build the software and launch it as a daemon):  
```
docker-compose up -d --build
```
 
After that, the container will create an interface and make a binding to ``10.6.0.6`` on port ``80`` (you can change it in docker-compose.yml)
 
If you have any questions or suggestions, ask in the [Taiko no Tatsujin Discord](https://discord.gg/ZpW62Vf)