FROM golang AS build
COPY . .
RUN go build quelpoke

FROM gcr.io/distroless/base-debian12
COPY --from=build /go/quelpoke /quelpoke
ENTRYPOINT [ "/quelpoke" ]