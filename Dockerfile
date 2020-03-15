FROM stefanscherer/node-windows:12.16.1-windowsservercore-2019 as build

ARG APP=angular-realworld-example-app
ARG BUILD_DIR=C:\\$APP
ARG APP_DIR=C:\\Inetpub\\wwwroot\\$APP

RUN git clone https://github.com/kobibasson/$env:APP

WORKDIR $BUILD_DIR
    
RUN npm install
RUN npm install -g @angular/cli@7.3.9
RUN ng build --output-path=dist

FROM mcr.microsoft.com/windows/servercore/iis:windowsservercore-1803
COPY --from=build  C:/angular-realworld-example-app/dist C:/inetpub/wwwroot/$APP/
