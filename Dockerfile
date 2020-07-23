FROM golang:latest

# Copy the local package files to the container’s workspace.
COPY . /opencommapi
WORKDIR /opencommapi

# Install our dependencies
RUN go get github.com/go-sql-driver/mysql  
RUN go get github.com/gin-gonic/gin


# Install api binary globally within container 
RUN go build .

EXPOSE 3000
# Set binary as entrypoint
ENTRYPOINT /opencommapi/opencommapi
