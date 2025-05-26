@param Boolean isAuthenticated = false
@param String username = null

<!doctype html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sportify - Головна</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; text-align: center; }
        .btn { display: inline-block; padding: 12px 24px; margin: 10px; text-decoration: none; border-radius: 5px; font-weight: bold; }
        .btn-primary { background: #007bff; color: white; }
        .btn-success { background: #28a745; color: white; }
        .btn-danger { background: #dc3545; color: white; }
    </style>
</head>
<body>
<h1>🎵 Вітаємо в Sportify!</h1>

@if(isAuthenticated)
    <p>Вітаємо, <strong>${username}</strong>!</p>
    <a href="/music" class="btn btn-primary">Перейти до музики</a>
    <a href="/logout" class="btn btn-danger">Вийти</a>
@else
    <p>Музична платформа для справжніх меломанів</p>
    <a href="/login" class="btn btn-primary">Увійти</a>
    <a href="/register" class="btn btn-success">Зареєструватися</a>
@endif
</body>
</html>