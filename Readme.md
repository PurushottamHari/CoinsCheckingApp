Run mysql db using docker
docker run -p 6603:3306 --name=docker-mysql --env="MYSQL_ROOT_PASSWORD=root" --env="MYSQL_PASSWORD=root" --env="MYSQL_DATABASE=test" mysql

For now since I could not deploy the backend, I kept the flutter app and server on the same network and used the common ip 
Configure the IP in this file: /frontend/lib/utils/rest_api/endpoints.dart (RestUrl variable)

Screenshots of the app are in screenshots folder.

Test cases for backend and FLow diagram are in the testcases folder.
