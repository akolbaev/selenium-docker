FROM openjdk:8u191-jre-alpine3.8

RUN apk add curl jq

# WORKSPACE
WORKDIR /Users/aza.kolbaev/udemy

# ADD .jar under target from host
ADD target/selenium-docker.jar 			selenium-docker.jar
ADD target/selenium-docker-tests.jar 	selenium-docker-tests.jar
ADD target/libs 						libs

# in case of any other dependency like cs .json etc
# please ADD them as well

#ADD suite files
ADD test-book-flight-module.xml 		test-book-flight-module.xml
ADD test-search-module.xml 				test-search-module.xml

#ADD health check script
ADD healthcheck.sh                      healthcheck.sh
# ROWSER
# HUB_HOST
# MODULE

ENTRYPOINT sh healthcheck.sh