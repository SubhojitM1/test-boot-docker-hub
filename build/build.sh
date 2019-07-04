#!/bin/bash
source ./config.sh
setup(){
	if [ ! -d "./jdk1.8.0_131" ]; then
	  	  curl -L -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz | tar -xzC $BASE_HOME
	fi
	
	if [ ! -d "./apache-maven-3.0.5" ]; then 
	  curl -sL https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.0.5/apache-maven-3.0.5-bin.tar.gz | tar -xzC $BASE_HOME
	fi

	export M2_HOME=$BASE_HOME/apache-maven-3.0.5/
	export M2=$M2_HOME/bin
	export JAVA_HOME=$BASE_HOME/jdk1.8.0_131
	export PATH=$PATH:$JAVA_HOME/bin/
	export PATH=$M2:$PATH
	echo $PATH
}
setup

build(){
	cd $BASE_HOME/$1
        mvn clean install -P$BUILD_ENV
}



builddocker() {
	docker build -f ./build/Dockerfile -t test-boot-docker-hub .
}

build test-boot-docker-hub


builddocker test-boot-docker-hub
