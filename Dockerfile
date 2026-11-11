
# Base image with Maven and JDK 17
FROM maven:3.9.9-eclipse-temurin-17

# Set working directory
WORKDIR /app

# Copy pom.xml
COPY pom.xml .

# Download dependencies
RUN mvn dependency:resolve

# Copy source code
COPY src ./src

# Compile and run JUnit test cases
RUN mvn clean test

# Default command
CMD ["mvn", "test"]
