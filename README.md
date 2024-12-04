# BucStop
### Team Index Three
### Members:
> James Park, Andrew Garcia, Trent Allen, Jacob Perdue, Blake Lawson
#### CSCI 4350
#### Fall 2024, East Tennessee State University

### Overview:
This project is a game website made by and for ETSU students. It
is a place to put games created by ETSU students.
This project also communicates to a microservice with HTTP calls for the game information, the repository is hosted in the links below. BucStop also interacts with this Microservice through an API Gateway whose repository is also listed below. It is deployed with the microservice using docker compose, see the scripts folder for the docker-compose.yml file.

### Backlog Information:
* [Backlog Fall 2023](https://brandonbcb02.atlassian.net/jira/software/projects/SCRUM/boards/1/backlog?epics=visible&atlOrigin=eyJpIjoiMjgzYjkwZGI0ZjU3NDNiM2JhMDNiOWU4MDliZjQ0YjEiLCJwIjoiaiJ9)
* [Backlog Spring 2024](https://docs.google.com/document/d/100WxhA-8cx5tWQfZs9JMoHvPGJO37cdkfATp0Td0uos/edit?usp=sharing)
* [Backlog Fall 2024](https://docs.google.com/document/d/1bRwSF4ruVywq7foFDtmQnjqAAKeYdk9yt1MvzyBBvL4/edit)
### Project Plan:
[Project Plan Doc](https://docs.google.com/document/d/12AH-SSa8jOCtNAGOVi41bWx9s0rQrPvtmCRUlanSDiY/edit?usp=sharing)

[Microservices](https://docs.google.com/document/d/1614BGhXJ8EkGg9p286xH0KazdWtSf83aGFW192Is-DI/edit)

### Project Structure: 
To understand the project structure, familiarize yourself with the
MVC (Model View Controller) structure. When clicking on a game, 
a value will be passed to the controller, which will decide which 
game to load. This is divided between the MVC folders in the main
BucStop folder.

* Bucstop
	* Controllers
		* This folder has the controllers, which allow pages to 
			link together and pass information between them.
	* Models
		* This folder has the basis for the Game class.
	* Views
		* Games
			* This folder has the pages related to games, such as
				the index page and the default game page.
		* Home
			* This folder contains the main pages used by the site, 				
				such as the home page, admin page, and privacy page.
		* Shared 
			* This contains other important pages and/or resources 
				that aren't in the other two folders, including the
				default layout and the error page.
	* wwwroot
		* This folder contains the resources used by the project, 
			including images, the javascript games, the icons, etc.
### Associated Repositories
* BucStop [(Docker)](https://hub.docker.com/repository/docker/jamesispark/bucstop/general)
* API Gateway [(Github)](https://github.com/JamesIsPark/Team-3-BucStop_APIGateway) [(Docker)](https://hub.docker.com/repository/docker/jamesispark/bucstop_apigateway/general)
* Tetris Microservice [(Github)](https://github.com/JamesIsPark/Team-3-BucStop_Tetris) [(Docker)](https://hub.docker.com/repository/docker/jamesispark/bucstop_microtetris/general)
* Snake Microservice [(Github)](https://github.com/JamesIsPark/Team-3-BucStop_Snake) [(Docker)](https://hub.docker.com/repository/docker/jamesispark/bucstop_microsnake/general)
* Pong Microservice [(Github)](https://github.com/JamesIsPark/Team-3-BucStop_Pong) [(Docker)](https://hub.docker.com/repository/docker/jamesispark/bucstop_micropong/general)

### Help
For more documentation on how to run locally and how to set up deployments, see the google docs below:
* [Team 3 Video Playlist](https://youtube.com/playlist?list=PLdKGHNSFJEmrBMR3d4kA9DXI1v2c9nOyh&feature=shared) (Most Recent Video Playlist)
* [Team Redacted Video Playlist](https://youtube.com/playlist?list=PLxsGO-QGipWmVzxFkVbA-o6BUW5eRdk3H&si=a7jHaNBgdTtXgoJ4)
* [Running Locally](https://docs.google.com/document/d/1gfUpjZNfqWyv1ohUW1IaS8fOhXp0hOx6tFQVXBADa8Q/edit?usp=sharing)
* [How to Deploy](https://docs.google.com/document/d/1VElVP9HrOafxdM0HfD9jjM8HvnzBSpXhhq1O9VtTTug/edit?usp=sharing)
* [Docker Container Connection Guide](https://docs.google.com/document/d/1BG6NYuTRV_gfk3Ikoqa4RAy9elF-OqTWQiil_mJjB_0/edit?tab=t.0#heading=h.lm1a4xopofc) (Running with Docker)
