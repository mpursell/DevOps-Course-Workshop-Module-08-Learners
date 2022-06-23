FROM mcr.microsoft.com/dotnet/sdk:6.0 as base

RUN mkdir -p /usr/src/app
COPY . /usr/src/app

WORKDIR /usr/src/app/DotnetTemplate.Web

RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash - &&\
    apt-get install -y nodejs &&\
    apt-get update &&\ 
    apt-get install -y build-essential &&\
    npm install --save-dev jasmine &&\
    npm run build &&\
    dotnet build

EXPOSE 5000

ENTRYPOINT ["dotnet", "run"]