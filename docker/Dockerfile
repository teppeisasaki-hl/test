FROM golang:1.22 as builder

WORKDIR /app

COPY go.* ./
RUN go mod download
COPY . ./
RUN CGO_ENABLED=0 go build -v -o main ./main.go

FROM gcr.io/distroless/static:nonroot 
COPY --from=builder --chown=nonroot:nonroot /app/main /main

ENV PORT=9000
ENV DB_HOST=database
ENV DB_PORT=5432
ENV DB_USER=postgres
ENV DB_PASSWORD=postgres
ENV DB_NAME=database

EXPOSE 9000
CMD ["/main"]
