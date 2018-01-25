FROM microsoft/dotnet:latest
WORKDIR /app
COPY ./publish .
ENTRYPOINT ["dotnet", "orders.NET.dll"]
