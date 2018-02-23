FROM frolvlad/alpine-oraclejdk8

RUN apk update
RUN apk upgrade
RUN apk --no-cache add openssl

WORKDIR /opt/dynamodb-local

RUN wget https://s3-ap-northeast-1.amazonaws.com/dynamodb-local-tokyo/dynamodb_local_latest.tar.gz -O dynamodb-local.tgz
RUN tar xzf dynamodb-local.tgz && rm -f dynamodb-local.tgz

EXPOSE 8000

ENTRYPOINT ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-inMemory"]

