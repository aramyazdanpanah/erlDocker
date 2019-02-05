# erlDocker
a docker file to create image from erlang application   while the application is made with SEPC structure (https://github.com/mohsenmoqadam/SEPC) <br />
for example and test this Dockerfile use https://github.com/aramyazdanpanah/cowboy_hello

# run and test
run
```
docker build --no-cache . -t cowboy_hello:test
docker run -d -p 90:80 cowboy_hello:test
```
test
```
    $ curl localhost:90
    REST Hello World as HTML!
```
 
 # How do I create image from my own application? 
 for create image from self application while this application create with SEPC structe you must be chenge two variable
in Docker file <br />
1- GitUrl <br />
2- ApplicationName <br />
```
## ===change application name and git repository 
ARG ApplicationName=cowboy_hello
ARG GitUrl="https://github.com/aramyazdanpanah/cowboy_hello"
```
for example I want create image from https://github.com/aramyazdanpanah/cowboy_hello and my application is cowboy_hello <br />

# Note
for create image that has able  attach to erlang console you must cheage
```
CMD ["bin/application", "foreground"]
```
To 
```
CMD ["bin/application", "console"]
```
Note that you must run this image with -it flag

```
docker run -it -p 90:80 cowboy_hello:test
```
or 
```
docker run -itd -p 90:80 cowboy_hello:test
```
