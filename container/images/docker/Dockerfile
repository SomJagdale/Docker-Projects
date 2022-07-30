# First stage: JDK 11 with required modules
FROM debian:stretch-slim as JavaPackager

WORKDIR /install
COPY container-resources/openjdk-11.0.1_linux-x64_bin.tar.gz .
RUN { \
       echo Installing JDK 11 && \
           tar xf /install/openjdk-11.0.1_linux-x64_bin.tar.gz -C /opt/ ;\
    }
ENV JAVA_HOME="/opt/jdk-11.0.1"
ENV PATH="$PATH:${JAVA_HOME}/bin"

# Second stage: Install libfontconfig and freetype
FROM redhat/ubi8-minimal as FontPackager
RUN microdnf install freetype fontconfig

# Third stage: add our minimal "JRE" distro, libraries for phantomjs and our app
FROM redhat/ubi8-minimal

RUN microdnf update -y \
    && microdnf install tar gzip procps vim shadow-utils \
    && ln -s /opt/jdk-11.0.1/bin/java /usr/bin/java \
    && groupadd roamware \
    && useradd -d /opt/Roamware -g 'roamware' roamware ;

ENV JAVA_HOME="/opt/jdk-11.0.1"
ENV PATH="$PATH:$JAVA_HOME/bin"

COPY --from=JavaPackager "$JAVA_HOME" "$JAVA_HOME"
COPY --from=FontPackager \
   /lib64/libfontconfig.so.1 \
   /lib64/libfreetype.so.6 \
   /lib64/libgcc_s.so.1 \
   /lib64/libbz2.so.1 \
   /lib64/libpng16.so.16 \
   /lib64/libm.so.6 \
   /lib64/libbz2.so.1 \
   /lib64/libexpat.so.1 \
   /lib64/libuuid.so.1 \
   /lib64/

# Prepare the Mobileum environment now

USER roamware
ENV HOME=/opt/Roamware
WORKDIR /opt/Roamware

RUN set -x ;
RUN mkdir -p /opt/Roamware/binaries \
        && mkdir -p /opt/Roamware/scripts \
        && mkdir -p /opt/Roamware/binaries/ntr90 \
        && mkdir -p /opt/Roamware/logs/ntr90 \
        && mkdir -p /opt/Roamware/logs/ntr90/soraf \
        && mkdir -p /opt/Roamware/logs/ntr90/workarea \
        && mkdir -p /opt/Roamware/logs/ntr90/csvprocessor ;

COPY --chown=roamware:roamware staging/binaries/sds.tar.gz /opt/Roamware/binaries/
COPY --chown=roamware:roamware staging/binaries/sds5g.tar.gz /opt/Roamware/binaries/
COPY --chown=roamware:roamware staging/binaries/ntr90/soraf.tar.gz /opt/Roamware/binaries/ntr90/
COPY --chown=roamware:roamware staging/scripts/operations.tar.gz /opt/Roamware/scripts/
COPY --chown=roamware:roamware startup.sh /opt/Roamware/scripts/

ENV ROAMWARE_HOME=/opt/Roamware

RUN chmod +x /opt/Roamware/scripts/startup.sh

ENTRYPOINT ["sh", "-c", "/opt/Roamware/scripts/startup.sh"]
