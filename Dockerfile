FROM alpine:latest as build
ADD https://github.com/sosedoff/pgweb/releases/download/v0.9.12/pgweb_linux_amd64.zip  ./
RUN apk add unzip && unzip pgweb_linux_amd64.zip

FROM alpine:latest
COPY --from=build ./ ./app
EXPOSE 8080
CMD [ "./app/pgweb_linux_amd64", "--sessions" ,"--bind=0.0.0.0", "--listen=8080" ]
