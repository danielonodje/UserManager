.PHONY: startapp
startapp: startdb buildcontainer
	@echo "starting app"
	docker run -p 8080:8080 -d --name usermanager --link mongodb:mongo usermanager:0.1 --rm=false
startdb:
	@echo "fetching and starting mongodb container"
	docker run -d --name mongodb mongo
buildcontainer:
	@echo "building app image"
	docker build -t usermanager:0.1 .
kill: 
	@echo "stopping app and database"
	docker container rm -f -v usermanager mongodb