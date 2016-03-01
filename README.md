# db2express-c
These files allow you create an IBM Business Process Manager 8.5.6 DB2 Express-C database.

# Requirements
1. entrypoint.sh
2. db2.tar - These are the database scripts from a create deployment environment where bpm.de.deferSchemaCreation=true
3. Dockerfile

# To build
docker build -t gmortel/db2express-c:database-created.v1.1 .

# To start db2 then runc659e405a2d3 a bash shell
docker run -it --name=DB2Server -p 50000:50000 -e DB2INST1_PASSWORD=<password> -e LICENSE=accept gmortel/db2express-c:database-created.v1.0 -bash

# To just start db2
docker run -d --name=DB2Server -p 50000:50000 -e DB2INST1_PASSWORD=<password> -e LICENSE=accept gmortel/db2express-c:database-created.v1.0
