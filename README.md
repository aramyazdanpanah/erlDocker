# erlDocker
a docker file to create image from erlang application   while the application is made with SEPC structure (https://github.com/mohsenmoqadam/SEPC) <br />
for example and test this Dockerfile use https://github.com/aramyazdanpanah/cowboy_hello

#run
```
docker build --no-cache . -t cowboy_hello:test
docker run -d -p 90:80 cowboy_hello:test
```
test
```
    $ curl localhost:90
    REST Hello World as HTML!
```
