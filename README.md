# db2express-c
# Purpose: To create the BPMDB, CMNDB and PDWDB for BPM 8.5.6

# Requirements
1. entrypoint.sh - So db2 starts when container is run
2. db2.tar - These are the database scripts from a create deployment environment where bpm.de.deferSchemaCreation=true
3. Dockerfile

# To build
docker build -t gmortel/db2express-c:database-created .

# To start db2 then run a bash shell
docker run -it --name=DB2Server -p 50000:50000 -e DB2INST1_PASSWORD=Bpmr0cks -e LICENSE=accept gmortel/db2express-c:database-created -bash

# To just start db2
docker run -d --name=DB2Server -p 50000:50000 -e DB2INST1_PASSWORD=Bpmr0cks -e LICENSE=accept gmortel/db2express-c:database-created
