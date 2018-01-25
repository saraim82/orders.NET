FROM microsoft/aspnetcore-build:1.0
WORKDIR /app
COPY ./publish .
RUN apt-get update && apt-get install -y tcpdump jq
ENTRYPOINT ["dotnet", "orders.NET.dll"]