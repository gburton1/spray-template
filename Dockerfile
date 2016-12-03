FROM java
MAINTAINER Greg Burton "gburton@gmail.com"

COPY run.sh /run.sh
RUN chmod +x /run.sh

COPY target/scala-2.11/source-assembly-0.1.jar /bs.jar

HEALTHCHECK --interval=5s --timeout=3s CMD curl --fail http://localhost || exit 1

CMD ["/run.sh"]

EXPOSE 8080
