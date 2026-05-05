var builder = WebApplication.CreateBuilder(args);

var app = builder.Build();

app.MapGet("/", () => Results.Content("""
<!DOCTYPE html>
<html>
<head>
    <title>My Dockerized .NET App</title>
</head>
<body>
    <h1>Hello from my .NET Docker App!</h1>
    <p>This app is running inside a container.</p>
</body>
</html>
""", "text/html"));

app.Run();
