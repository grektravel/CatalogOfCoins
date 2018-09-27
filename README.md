# Catalog of coins

The RESTFull Web application for storing information about coins

### Technologies
 SpringBoot, SpringSecurity, PostgreSQL, MyBatis, Bootstrap, CSS3, Freemarker, JQuery, Java Script, Html5, Slf4j 

## Getting Started

Clone or download this repository to your local machine

## Prerequisites

### Environment
- JDK 1.8
- Apache Tomcat 8
- PostgreSQL 9.5
- Maven 3.5.4
### Database
- сreate DB using script  [createDB.sql](https://github.com/grektravel/CatalogOfCoins/blob/master/createDB.sql)
- check DB connection settings in [application.properties](https://github.com/grektravel/CatalogOfCoins/blob/master/src/main/resources/application.properties)
## Installation

### Build project
- Create war file using the Maven command
```shell
mvn install
```
### Deployment
- Use the resulting war file to deploy to Tomcat server by copying files to the server directory or using the tomcat web application manager
- Or to deploy to Tomcat server with Maven, run the following command:
```shell
mvn tomcat7:deploy
```
> Check the connection settings to the Tomcat web application manager in [pom.xml](https://github.com/grektravel/CatalogOfCoins/blob/master/pom.xml)
```xml
<configuration>
<url>http://localhost:8080/manager/text</url>
  <update>true</update>
  <server>TomcatServer</server>
  <path>/numismat</path>
  <username>admin</username>
  <password>admin</password>
</configuration>
```
## Running with SpringBoot
To simple running as a SpringBoot application, run the following command:
```shell
mvn spring-boot:run
```
> [pom.xml](https://github.com/grektravel/CatalogOfCoins/blob/master/pom.xml) must be configured for packaging into jar file
```xml
<packaging>jar</packaging>
```
## Application users
```
login: admin
password: admin

login: user1
password: user1

login: user2
password: user2

```
