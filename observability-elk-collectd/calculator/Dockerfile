FROM golang
RUN mkdir /app
ADD calculator.go /app/
ADD collectd.conf /app/
ADD run.sh /app/
WORKDIR /app

RUN apt-get update
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN apt-get install apt-transport-https
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list
RUN apt-get update && apt-get install vim collectd collectd-utils -y

COPY ./collectd.conf /etc/collectd/

RUN go get -u github.com/gorilla/mux
RUN go build -o calculator .
CMD ["sh", "./run.sh"]