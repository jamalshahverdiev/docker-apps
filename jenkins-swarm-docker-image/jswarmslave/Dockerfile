FROM openjdk:11-jdk

MAINTAINER Jamal Shahverdiyev <jamal.shahverdiev@gmail.com>

ENV JENKINS_SWARM_VERSION 3.15
ENV HOME /home/jenkins

RUN groupadd -g change_docker_gid_from_host jenkins && useradd -m -g jenkins -c "Jenkins Slave user" -s /bin/bash jenkins && echo "jenkins:jenkins" | chpasswd
# install netstat to allow connection health check with
# netstat -tan | grep ESTABLISHED
RUN apt-get update && apt-get install -y dialog unzip zip apt-utils telnet net-tools dnsutils apt-transport-https ca-certificates curl gnupg-agent software-properties-common && rm -rf /var/lib/apt/lists/*

### Download configure docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/1.26.2/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose \
&& chmod +x /usr/bin/docker-compose

### Download configure kubectl 
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl -o /usr/bin/kubectl && chmod +x /usr/bin/kubectl

### Install Gradle and Maven
COPY ["archives/gradle-6.3-bin.zip", "archives/apache-maven-3.6.3-bin.tar.gz", "./"] 
RUN unzip -d /opt/gradle ./gradle-6.3-bin.zip && mkdir /opt/maven \
	&& tar xf apache-maven-3.6.3-bin.tar.gz --strip-components=1 -C /opt/maven \
	&& rm -rf gradle-6.3-bin.zip apache-maven-3.6.3-bin.tar.gz

### Configure Maven 3.6.3
RUN echo -e "export M2_HOME=/opt/maven \n export MAVEN_HOME=/opt/maven \n export PATH=${M2_HOME}/bin:${PATH}" \
	> /etc/profile.d/maven.sh \
	&& chmod +x /etc/profile.d/maven.sh 

### Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y nodejs

### Install Helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
	&& chmod 700 get_helm.sh && ./get_helm.sh

ENV M2_HOME=/opt/maven
ENV GRADLE_HOME=/opt/gradle/gradle-6.3
ENV MAVEN_HOME=/opt/maven
ENV PATH $PATH:/opt/gradle/gradle-6.3/bin:/opt/maven/bin

# Install Docker from Docker Inc. repositories.
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt update -y && apt install -y docker-ce docker-ce-cli containerd.io && rm -rf /var/lib/apt/lists/*

RUN usermod -a -G docker jenkins

RUN curl --create-dirs -sSLo /usr/share/jenkins/swarm-client-$JENKINS_SWARM_VERSION.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/$JENKINS_SWARM_VERSION/swarm-client-$JENKINS_SWARM_VERSION.jar \
  && chmod 755 /usr/share/jenkins

COPY jenkins-slave.sh /usr/local/bin/jenkins-slave.sh

USER jenkins
VOLUME ["/home/jenkins"]

RUN set -o errexit -o nounset \
    && echo "Testing Gradle installation" \
    && gradle --version  \
    && echo "Testing Maven installation" \
    && mvn --version \ 
    && echo "Testing NPM installation" \
    && npm --version \
    && echo "Testing Docker installation" \
    && docker --version  \
    && echo "Testing Kubectl installation" \
    && which kubectl \
    && echo "Tesing Helm installation" \
    && helm version

ENTRYPOINT ["/usr/local/bin/jenkins-slave.sh"]
