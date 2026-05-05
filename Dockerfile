# Build stage (used to compile the app)
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build

# Set working directory for build
WORKDIR /src

# Copy project files into container
COPY . .

# Build and publish the app
RUN dotnet publish -c Release -o /app


# Runtime stage (used to run the app)
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime

# Set working directory for runtime
WORKDIR /app

# Copy published app from build stage
COPY --from=build /app .

# Tell Docker the app uses this port
EXPOSE 8080

# Start the app
ENTRYPOINT ["dotnet", "MyDockerWebApp.dll"]