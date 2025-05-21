@import org.example.sportify.data.Music
@import java.util.List
@param Long musicCount
@param List<Music> musics
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
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