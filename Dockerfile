FROM mcr.microsoft.com/dotnet/sdk:6.0 as base

RUN mkdir -p /usr/src/app
COPY . /usr/src/app

WORKDIR /usr/src/app/DotnetTemplate.Web

RUN curl -fsSL https://deb.nodesource.com/setup_18.x |\ 
    apt-get install -y nodejs &&\
    dotnet nuget add source https://api.nuget.org/v3/index.json -n nuget.org &&\
    apt-get update &&\ 
    apt-get install -y build-essential &&\
    npm install &&\
    npm install --save-dev jasmine &&\
    npm run build

WORKDIR /usr/src/app

ENTRYPOINT ["dotnet", "run"]
    



