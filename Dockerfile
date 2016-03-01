# Requirements
# 1. entrypoint.sh
# 2. db2.tar - These are the database scripts from a create deployment environment where bpm.de.deferSchemaCreation=true
# 3. Dockerfile

# To build
# docker build -t gmortel/db2express-c:database-created.v1.1 .

# To start db2 then runc659e405a2d3 a bash shell
# docker run -it --name=DB2Server -p 50000:50000 -e DB2INST1_PASSWORD=<password> -e LICENSE=accept gmortel/db2express-c:database-created.v1.0 -bash

# To just start db2
# docker run -d --name=DB2Server -p 50000:50000 -e DB2INST1_PASSWORD=<password> -e LICENSE=accept gmortel/db2express-c:database-created.v1.0

FROM ibmcom/db2express-c
MAINTAINER Gerard Mortel "gmortel@us.ibm.com / gerard.mortel@gmail.com"

ADD db2.tar /tmp/
RUN ["/bin/bash", "-c", "su - db2inst1 -c '/home/db2inst1/sqllib/adm/db2start && cd /tmp/DB2/QBPMDB85 && ./createDatabase.sh && cd /tmp/DB2/QCMNDB85 && ./createDatabase.sh && cd /tmp/DB2/QPDWDB85 && ./createDatabase.sh'"]
ADD entrypoint.sh /
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22 50000

