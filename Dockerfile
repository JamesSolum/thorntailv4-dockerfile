FROM maven:3.3-jdk-8

WORKDIR /root

RUN git clone 'https://github.com/kg6zvp/thorntail'> /dev/null && \
    cd thorntail/ && git checkout 4x_stable && \
    mvn -DskipDocker -DskipTests install -pl '!docs,!howto/openshift,!howto/openshift-s2i' \
    -s /usr/share/maven/ref/settings-docker.xml dependency:resolve && \
    cd .. && rm -rf thorntail
