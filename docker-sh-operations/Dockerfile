FROM golang
RUN mkdir /app
ADD calculator.go /app/
WORKDIR /app
RUN go get -u github.com/gorilla/mux
RUN go build -o calculator .
CMD ["./calculator"]