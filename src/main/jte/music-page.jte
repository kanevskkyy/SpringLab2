@import org.example.sportify.data.Music
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
        body { font-family: Arial, sans-serif; margin: 40px; }
        .header { background: #f4f4f4; padding: 20px; border-radius: 5px; margin-bottom: 20px; }
        .logout-btn { background: #dc3545; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; }
    </style>
</head>
<body>
<div class="header">
    <h1>🎵 Музика - Sportify</h1>
    <p>Вітаємо, <strong>${username}</strong>!</p>
    <a href="/logout" class="logout-btn">Вийти</a>
</div>
<h1>Всього знайдено пісень: ${musicCount}</h1>
@for(Music music: musics)
    <div>
        <p>Назва пісні: ${music.getTitle()}</p>
        <p>Жанр: ${music.getGenre().getName()} 🎵</p>
        <p>Виконавець: ${music.getAuthor().getName()}</p>
        !{var duration = music.getDuration();}
        !{var minutes = duration / 60;}
        !{var seconds = duration % 60;}
        <p>Тривалість: ${minutes} хв ${seconds} сек</p>
        <p>Кількість лайків: ${music.getLikes()}</p>
        <hr/>
    </div>
@endfor
</body>
</html>