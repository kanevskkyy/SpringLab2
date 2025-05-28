@param String username
@param Long musicCount = 0L
@param Long genreCount = 0L
@param Long authorCount = 0L

<!doctype html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Адмін панель - Sportify</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f8f9fa;
        }
        .header {
            background: #007bff;
            color: white;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .logout-btn {
            background: #dc3545;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            float: right;
        }
        .stats-container {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
        }
        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            flex: 1;
            text-align: center;
        }
        .stat-number {
            font-size: 2em;
            font-weight: bold;
            color: #007bff;
        }
        .management-section {
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .management-links {
            display: flex;
            justify-content: space-around;
            list-style: none;
            padding: 0;
        }
        .management-links li {
            margin: 15px 0;
        }
        .management-links a {
            display: inline-block;
            background: #28a745;
            color: white;
            padding: 15px 25px;
            text-decoration: none;
            border-radius: 5px;
            width: 250px;
            text-align: center;
            transition: background-color 0.3s;
        }
        .management-links a:hover {
            background: #218838;
        }
    </style>
</head>
<body>
<div class="header">
    <a href="/logout" class="logout-btn">Вийти</a>
    <h1>👑 Адмін панель - Sportify</h1>
    <p>Вітаємо, адміністратор <strong>${username}</strong>!</p>
</div>

<div class="stats-container">
    <div class="stat-card">
        <div class="stat-number">${musicCount}</div>
        <div>Пісень</div>
    </div>
    <div class="stat-card">
        <div class="stat-number">${genreCount}</div>
        <div>Жанрів</div>
    </div>
    <div class="stat-card">
        <div class="stat-number">${authorCount}</div>
        <div>Авторів</div>
    </div>
</div>
<div class="management-section">
    <ul class="management-links">
        <li>
            <a href="/admin/musics">🎼 Керування музикою</a>
        </li>
    </ul>
</div>
</body>
</html>