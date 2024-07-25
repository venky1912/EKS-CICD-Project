# Containerize the go application that we have created
# This is the Dockerfile that we will use to build the image
# and run the container

# Stage 1: Build the Go application
FROM golang:1.22 AS base

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files
COPY go.mod ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the Go app
RUN go build -o main .

#######################################################
# Reduce the image size using multi-stage builds
# We will use a distroless image to run the application
# Stage 2: A minimal image with the built Go application
FROM gcr.io/distroless/base

# Copy the Pre-built binary file from the previous stage
COPY --from=base /app/main .

# Copy the static files from the prevoius stage
COPY --from=base /app/static ./static

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./main"]