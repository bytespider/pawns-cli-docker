FROM alpine:3.15 as build

RUN apk add --no-cache wget
RUN BUILDARCH=$([ "$(uname -m)" == "i686" ] && echo "i386" || uname -m) && \
  wget "https://download.iproyal.com/pawns-cli/latest/linux_${BUILDARCH}/pawns-cli" && \
  chmod +x pawns-cli

FROM alpine:3.15
COPY --from=build /pawns-cli /

ENTRYPOINT [ "/pawns-cli" ]