FROM maven:3.6.3-jdk-11
ARG skip_unit_tests=false
WORKDIR /app
COPY common /app/common/
RUN echo "done... 0"
COPY common-swagger /app/common-swagger/
COPY pom-common-maven-dependencies.xml /app/pom.xml
RUN mvn install -Dmaven.test.skip=$skip_unit_tests
RUN rm -rf pom.xml common common-swagger
RUN echo "done... 1"