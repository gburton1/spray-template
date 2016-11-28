FROM java
MAINTAINER Greg Burton "gburton@gmail.com"

COPY run.sh /run.sh
RUN chmod +x /run.sh

COPY target/scala-2.10/books-ms-assembly-1.0.jar /bs.jar

CMD ["/run.sh"]

EXPOSE 8080
