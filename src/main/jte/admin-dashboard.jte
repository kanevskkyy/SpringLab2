@param String username
<!doctype html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Адмін панель - Sportify</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .header { background: #007bff; color: white; padding: 20px; border-radius: 5px; margin-bottom: 20px; }
        .logout-btn { background: #dc3545; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; }
    </style>
</head>
<body>
<div class="header">
    <h1>👑 Адмін панель - Sportify</h1>
    <p>Вітаємо, адміністратор <strong>${username}</strong>!</p>
    <a href="/logout" class="logout-btn">Вийти</a>
</div>

<p>Тут буде адмін панель для управління системою.</p>
</body>
</html>