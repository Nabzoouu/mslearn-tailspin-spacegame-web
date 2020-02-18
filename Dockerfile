FROM ubuntu:18.04

ENV http_proxy=http://webcache.generalicloud.net:3128/
ENV https_proxy=http://webcache.generalicloud.net:3128/
ENV HTTP_PROXY=http://webcache.generalicloud.net:3128/
ENV HTTPS_PROXY=http://webcache.generalicloud.net:3128/

RUN apt-get -y update
RUN apt-get -y install wget software-properties-common
RUN wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get -y update
RUN apt-get -y install apt-transport-https
RUN apt-get -y update
RUN apt-get -y install dotnet-sdk-3.1
RUN apt-get -y update
RUN apt-get -y install aspnetcore-runtime-3.1
RUN apt-get -y update
RUN apt-get -y install dotnet-runtime-3.1
RUN apt-get -y install git
RUN add-apt-repository -y ppa:git-core/ppa
RUN apt -y update
RUN apt -y install git

RUN mkdir /mslearn-tailspin-spacegame-web 
WORKDIR /mslearn-tailspin-spacegame-web
COPY . /mslearn-tailspin-spacegame-web

EXPOSE 5000

CMD echo "dotnet build --configuration Release"; echo "dotnet run --configuration Release --no-build --project Tailspin.SpaceGame.Web"; /bin/bash