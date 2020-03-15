FROM win-node

ARG BUILD_DIR=C:\build
ARG APP_DIR=C:\Inetpub\wwwroot 
WORKDIR $BUILD_DIR

COPY package.json $BUILD_DIR
RUN npm install
RUN npm install -g @angular/cli@7.3.9
COPY . ${BUILD_DIR}
RUN ng build --output-path=dist

FROM win-node
COPY --from=build $BUILD_DIR/dist/ $APP_DIR