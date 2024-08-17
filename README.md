# Passo a Passo

docker run -d -p 3306:3306 --name mysql --env MYSQL_ROOT_PASSWORD=password -v db-data:/var/lib/mysql mysql:8.0.27
Azure Portal
https://portal.azure.com/

1. Criação do cluser EKS

2. Criação do Azure Container Registry


-> execução Mysql

docker volume create db-data

  docker run -d -p 3306:3306 --name mydocker run -d -p 3306:3306 --name mysql --env MYSQL_ROOT_PASSWORD=password -v db-data:/var/lib/mysql mysql:8.0.27
Azure Portal
https://portal.azure.com/

1. Criação do cluser EKS

2. Criação do Azure Container Registry


-> execução Mysql

docker volume create db-data

  docker run -d -p 3306:3306 --name mysql --env MYSQL_ROOT_PASSWORD=password -v db-data:/var/lib/mysql mysql:8.0.27

# docker run -d -p 3306:3306 --name mysql --platform linux/x86_64 --env MYSQL_ROOT_PASSWORD=password -v db-data:/var/lib/mysql mysql:8.0.27


-> adiconar a seguinte entrada no arquivo hosts: 
127.0.0.1    mysql-headless   

Extensões do VSCode
1. Extension Pack for Java
2. Extension Pack for Spring Boot
3. Lombok Annotations Suppor for VS Code


-> application.properties

spring.datasource.driverClassName=com.mysql.cj.jdbc.Driver
spring.datasource.url=jdbc:mysql://mysql-headless:3306/db_workshop?createDatabaseIfNotExist=true&allowPublicKeyRetrieval=true&useSSL=false
spring.datasource.username=root
spring.datasource.password=password
spring.datasource.hikari.connection-timeout=60000
spring.datasource.hikari.maximum-pool-size=5

spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect
logging.level.org.hibernate.type.descriptor.sql.BasicBinder=trace
spring.jpa.hibernate.ddl-auto=update
spring.jpa.generate-ddl=true
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true

Após isso, é necessário fazer o build para construir o nosso arquivo .jar, então usa-se:
    mvn clean package -DskipTests
assim, vai estar criando

Azure DevOps
https://dev.azure.com/

 1. Criação da Organização
2. Criação do Projeto
3. Criação Personal Access Token (PAT)
4. Copiar os arquivos da pasta k8s para a raiz do projeto: https://github.com/norberto-enomoto/springboot-dio
5. Adicionar o repo do projeto no VSCode
6. Realizar o push do projeto

Obter as credenciais do cluster AKS
az login 
az account set --subscription <subscription>
az aks get-credentials --resource-group <resource-group> --name <cluster-name>

Instalação do Mysql no Cluster AKS
1. Criação do namespace dev
2. Criação do namespace prod
4. Instalação do MySQL no namespace dev e prod

5. Executar os seguintes comandos para liberar acesso ao Mysql de qualquer host:
    kubectl exec -it mysql-statefulset-0 /bin/bash -n <namespace>
    mysql -uroot -p
    select user, host from mysql.user;
    UPDATE mysql.user SET host='%' WHERE user='root';
    select user, host from mysql.user;
    exit
    exit
    kubectl delete pod mysql-statefulset-0 -n <namespace>
    
6. Criação do secret
		kubectl create secret docker-registry regcred --docker-server=livecoding.azurecr.io --docker-username=livecoding --docker-password=RIpet73EV1DG5zB=gRNr1x4EXr1RLQO5 --docker-email=norberto.enomoto@gmail.com
    
Criação da Pipeline
  Adicionar o seguinte treco no final do pipeline para ciar o artifact:
      - publish: $(System.DefaultWorkingDirectory)/k8s
      artifact: k8s
      
Criação da Release

Azure Portal
https://portal.azure.com/

1. Criação do cluser EKS

2. Criação do Azure Container Registry


-> execução Mysql

docker volume create db-data

docker run -d -p 3306:3306 --name mysql --env MYSQL_ROOT_PASSWORD=password -v db-data:/var/lib/mysql mysql:8.0.27

# docker run -d -p 3306:3306 --name mysql --platform linux/x86_64 --env MYSQL_ROOT_PASSWORD=password -v db-data:/var/lib/mysql mysql:8.0.27


-> adiconar a seguinte entrada no arquivo hosts: 
127.0.0.1    mysql-headless   

Extensões do VSCode
1. Extension Pack for Java
2. Extension Pack for Spring Boot
3. Lombok Annotations Suppor for VS Code


-> application.properties

spring.datasource.driverClassName=com.mysql.cj.jdbc.Driver
spring.datasource.url=jdbc:mysql://mysql-headless:3306/db_workshop?createDatabaseIfNotExist=true&allowPublicKeyRetrieval=true&useSSL=false

spring.datasource.username=root

spring.datasource.password=password

spring.datasource.hikari.connection-timeout=60000

spring.datasource.hikari.maximum-pool-size=5

spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect

logging.level.org.hibernate.type.descriptor.sql.BasicBinder=trace

spring.jpa.hibernate.ddl-auto=update

spring.jpa.generate-ddl=true

spring.jpa.show-sql=true

spring.jpa.properties.hibernate.format_sql=true


Azure DevOps
https://dev.azure.com/

 1. Criação da Organização
2. Criação do Projeto
3. Criação Personal Access Token (PAT)
4. Copiar os arquivos da pasta k8s para a raiz do projeto: https://github.com/norberto-enomoto/springboot-dio
5. Adicionar o repo do projeto no VSCode
6. Realizar o push do projeto

Obter as credenciais do cluster AKS
az login 
az account set --subscription <subscription>
az aks get-credentials --resource-group <resource-group> --name <cluster-name>

Instalação do Mysql no Cluster AKS
1. Criação do namespace dev
2. Criação do namespace prod
4. Instalação do MySQL no namespace dev e prod

5. Executar os seguintes comandos para liberar acesso ao Mysql de qualquer host:
    kubectl exec -it mysql-statefulset-0 /bin/bash -n <namespace>
    mysql -uroot -p
    select user, host from mysql.user;
    UPDATE mysql.user SET host='%' WHERE user='root';
    select user, host from mysql.user;
    exit
    exit
    kubectl delete pod mysql-statefulset-0 -n <namespace>
    
6. Criação do secret
		kubectl create secret docker-registry regcred --docker-server=livecoding.azurecr.io --docker-username=livecoding --docker-password=RIpet73EV1DG5zB=gRNr1x4EXr1RLQO5 --docker-email=norberto.enomoto@gmail.com
    
Criação da Pipeline
  Adicionar o seguinte treco no final do pipeline para ciar o artifact:
      - publish: $(System.DefaultWorkingDirectory)/k8s
      artifact: k8s
      
Criação da Release