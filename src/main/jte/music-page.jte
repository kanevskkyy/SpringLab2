@import org.example.sportify.data.entites.Music
@import java.util.List
@param Long musicCount
@param List<Music> musics
@param String username
<!doctype html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Музика - Sportify</title>
    <style>
        body {
            background-color: #ddddf6;
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        .header {
            background: #bab9b9;
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
        }
        .count{
            color: #151313;
            background-color: #8dadb8;
            border-radius: 20px;
            padding: 20px;
        }
        .music-item{
            background-color: #a59ad3;
            border-radius: 20px;
            color: #130d0d;
            padding: 10px 15px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="header">
    <h1>🎵 Музика - Sportify</h1>
    <p>Вітаємо, <strong>${username}</strong>!</p>
    <a href="/logout" class="logout-btn">Вийти</a>
</div>
<h1 class="count">Всього знайдено пісень: ${musicCount}</h1>
@for(Music music: musics)
    <div class="music-item">
        <p>Назва пісні: ${music.getTitle()}</p>
        <p>Жанр: ${music.getGenre().getName()} 🎵</p>
        <p>Виконавець: ${music.getAuthor().getName()}</p>
        !{var duration = music.getDuration();}
        !{var minutes = duration / 60;}
        !{var seconds = duration % 60;}
        <p>Тривалість: ${minutes} хв ${seconds} сек</p>
        <p>Кількість лайків: ${music.getLikes()}</p>
    </div>
@endfor
</body>
</html>