# MainProject
# Title: Eyennovations

A web application that can upload data in different formats like text files, JPEG images and videos from multiple devices running at remote places on different platforms into server side database. This also provides user authentication and permissions to access various modules in the application.

This application is the client-server interface so, using this server needs to access the database at the client side for that we need some softwares to be installed on both client side and server side. 

## Technologies used….
The application is developed using Java Server Pages as frontend which has html, javascript, css and java code to connect to backend mysql database.

#### Netbeans IDE 8.1 :
NetBeans IDE is a free and open source integrated development environment for application development on Windows, Mac, Linux, and Solaris operating systems. The IDE simplifies the development of web, enterprise, desktop, and mobile applications that use the Java and HTML5 platforms.

#### MySQL Workbench :
MySQL Workbench is GUI based tool to work with MySQL Server(version 5.7 is used in this project). You may use this for Server  Administration, for creating Entity Relationship Diagrams and for SQL Development (run queries etc).

## Installations….
### Client side :
#### Mysql for Windows:
**Prerequisites:**   
  •	Microsoft .NET Framework 4.5 (turn it on using ‘Turn Windows features on or off’)   
  •	Visual C++ Redistributable for Visual Studio 2015 (download using [this link](https://www.microsoft.com/en-us/download/details.aspx?id=48145))
  
Download mysql-installer-community-5.7.17.0.ms from [this link](https://dev.mysql.com/downloads/installer/) and install mysql server, mysql workbench, connector/j.   
After the installation set the password for the default user ‘root’
#### Mysql for Ubuntu:   
I followed [this](http://www.devopsservice.com/install-mysql-workbench-on-ubuntu-14-04-and-centos-6/) tutorial to install it on Ubuntu.   
After installing open mysql workbench, login with default user ‘root’.   
Create a schema named ‘db1’ and add the tables needed for that device (refer [client_tables](https://github.com/Ravali1996/MainProject/blob/master/client_tables.md) file).   

**Creating a database user at the client side using workbench:**   
Login with default user ‘root’ and go to ‘management’ tab which is located at left side of the screen, then click ‘Users and Privileges’, then a list of all users is displayed on the screen. now click on ‘Add Account’ button on the left side bottom then a screen appears where you can set the username and password for the new user.   

**Under login tab:**   
Login name : user   
Authentication Type : Standard   
Limits to Hosts Matching : % (which means any host can access database with username ‘user’)   
Password : password   
Confirm password : password   

**Under Administrative Roles tab:**   
Select all the checkboxes and now click on apply, a new user is created.   

#### Changing max_allowed_packet_size to 1GB:
According to application we are transfering data which contains images,videos,text files etc from client to the server. By default the max_allowed_packet_size for MySQL is 4MB which is insufficient for the application so, we need to increase the max_allowed_packet_size in the following way   

Go to ControlPanel-->file explorer option-->view-->turn on ‘show hidden files,folders and drives   
Now locate Program Data folder in the C: drive which is a hidden folder, in that locate   
MySQL-->MySQL Server 5.7-->my.ini file   
Right click on it and click on edit and find ‘max_allowed_packet=4M’ line and change 4M TO 1024M.

### Server side :
#### Mysql for Windows:    
**Prerequisites:**
  •	Microsoft .NET Framework 4.5 (turn it on using ‘Turn Windows features on or off’)   
  •	Visual C++ Redistributable for Visual Studio 2015 (download using [this link](https://www.microsoft.com/en-us/download/details.aspx?id=48145))    
Download mysql-installer-community-5.7.17.0.ms from [this link](https://dev.mysql.com/downloads/installer/) and install mysql server, mysql workbench, connector/j.   
After the installation set the password ‘password’ for the default user ‘root’.   
Create a schema named ‘mydb2’ and add the tables needed for the Web Application (refer [server_tables](https://github.com/Ravali1996/MainProject/blob/master/server_tables.md) file).   

**Changing max_allowed_packet_size to 1GB:**   
According to application we are transfering data which contains images,videos,text files etc from client to the server. By default the max_allowed_packet_size for MySQL is 4MB which is insufficient for the application so, we need to increase the max_allowed_packet_size in the following way   
Go to ControlPanel-->file explorer option-->view-->turn on ‘show hidden files,folders and drives.   
Now locate Program Data folder in the C: drive which is a hidden folder, in that locate   
MySQL-->MySQL Server 5.7-->my.ini file    
Right click on it and click on edit and find ‘max_allowed_packet=4M’ line and change 4M TO 1024M.   

## Deploying the Web Application in Apache-Tomcat-Server-7.0.75   
Download the server from [this link](https://tomcat.apache.org/download-70.cgi) under binary distributions-->core-->64-bit windows zip.   
I followed [this](http://www.c-sharpcorner.com/UploadFile/fd0172/how-to-configure-and-install-apache-tomcat-server-in-windows/) tutorial for installing and configuring it on windows system.   
For making apache tomcat as the windows service open the command prompt go to bin directory using ‘cd’ command and run the command in the following way   
C:\>apache-tomcat-7.0.75\bin\service.bat install   

Then go to services(win+r-->services.msc-->ok), you can see apache-tomcat-7.0-Tomact 7 as the windows service where you can start it manually or make it automatic using properties (right click on the service to go to its properties)   
According to the tutorial for configuring the apache tomcat server, in the conf\server.xml file, connector port for http is changed to port number 9999, but we need to change that to port=”80” in the following way   
<Connector port="80" protocol="HTTP/1.1" connectionTimeout="20000" redirectPort="8443" />   
Add the application folder to the webapps folder which is in apache-tomcat-7.0.75 folder and in the browser type localhost:80/application_folder_name you can see the index page here.

