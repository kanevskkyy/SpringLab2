@import org.example.sportify.data.entites.Music
@import org.example.sportify.data.entites.Author
@import org.example.sportify.data.entites.Genre
@import java.util.List
@param List<Music> music
@param List<Author> authors
@param List<Genre> genres

<!doctype html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Керування музикою</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .controls {
            display: flex;
            gap: 15px;
            align-items: center;
            margin-bottom: 20px;
            padding: 15px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            flex-wrap: wrap;
        }

        .search-group {
            flex: 1;
            min-width: 250px;
        }

        .search-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            font-size: 14px;
        }

        .search-group input {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .sort-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .sort-group label {
            font-weight: bold;
            font-size: 14px;
            white-space: nowrap;
        }

        .sort-select {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            min-width: 150px;
        }

        .sort-btn {
            padding: 8px 12px;
            border: 1px solid #007bff;
            border-radius: 4px;
            background: white;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.2s;
            color: #007bff;
            min-width: 100px;
        }

        .sort-btn:hover {
            background: #007bff;
            color: white;
        }

        .sort-btn.active {
            background: #007bff;
            color: white;
        }

        .results-info {
            margin-bottom: 15px;
            color: #666;
            font-size: 14px;
        }

        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            margin: 0 5px;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }

        .btn-success {
            background-color: #28a745;
            color: white;
        }

        .btn-warning {
            background-color: #ffc107;
            color: black;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        .btn:hover {
            opacity: 0.8;
        }

        .music-item {
            background: white;
            padding: 15px;
            margin: 10px 0;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: transform 0.2s;
        }

        .music-item:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }

        .music-actions {
            margin-top: 10px;
        }

        .no-results {
            text-align: center;
            padding: 40px;
            color: #666;
            font-style: italic;
        }

        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
        }

        .modal-content {
            background-color: white;
            margin: 15% auto;
            padding: 20px;
            border-radius: 8px;
            width: 90%;
            max-width: 500px;
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover {
            color: black;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .error {
            color: #dc3545;
            background-color: #f8d7da;
            padding: 10px;
            border-radius: 4px;
            margin: 10px 0;
        }

        .success {
            color: #155724;
            background-color: #d4edda;
            padding: 10px;
            border-radius: 4px;
            margin: 10px 0;
        }

        @media (max-width: 768px) {
            .controls {
                flex-direction: column;
                align-items: stretch;
            }

            .search-group {
                min-width: auto;
            }

            .sort-group {
                justify-content: space-between;
                flex-wrap: wrap;
            }
        }
    </style>
</head>
<body>
<div class="header">
    <h1>Керування музикою</h1>
    <button class="btn btn-success" onclick="openCreateModal()">Додати нову пісню</button>
</div>

<div id="error-message"></div>
<div id="success-message"></div>

<!-- Контролі пошуку та сортування -->
<div class="controls">
    <div class="search-group">
        <label for="searchInput">Пошук по назві пісні:</label>
        <input type="text" id="searchInput" placeholder="Введіть назву пісні..." onkeyup="filterMusic()">
    </div>

    <div class="sort-group">
        <label>Сортувати за:</label>
        <select id="sortSelect" class="sort-select" onchange="sortMusic()">
            <option value="title-asc">Назва (А-Я)</option>
            <option value="title-desc">Назва (Я-А)</option>
            <option value="author-asc">Виконавець (А-Я)</option>
            <option value="author-desc">Виконавець (Я-А)</option>
            <option value="genre-asc">Жанр (А-Я)</option>
            <option value="genre-desc">Жанр (Я-А)</option>
            <option value="likes-asc">Лайки (менше)</option>
            <option value="likes-desc">Лайки (більше)</option>
        </select>
    </div>
</div>

<div class="results-info">
    <span id="resultsCount">Показано: ${music.size()} пісень</span>
</div>

<div id="music-list">
    @for(Music mus : music)
        <div class="music-item"
             data-title="${mus.getTitle().toLowerCase()}"
             data-author="@if(mus.getAuthor() != null)${mus.getAuthor().getName().toLowerCase()}@else невідомо@endif"
             data-genre="@if(mus.getGenre() != null)${mus.getGenre().getName().toLowerCase()}@else невідомо@endif"
             data-likes="@if(mus.getLikes() != null)${mus.getLikes()}@else 0@endif">
            <p><strong>Назва пісні:</strong> ${mus.getTitle()}</p>
            <p><strong>Жанр:</strong> @if(mus.getGenre() != null)${mus.getGenre().getName()}@else Невідомо@endif 🎵</p>
            <p><strong>Виконавець:</strong> @if(mus.getAuthor() != null)${mus.getAuthor().getName()}@else Невідомо@endif</p>
            <p><strong>Кількість лайків:</strong> @if(mus.getLikes() != null)${mus.getLikes()}@else 0@endif</p>
            <div class="music-actions">
                <button class="btn btn-warning"
                        data-id="${mus.getId()}"
                        data-title="${mus.getTitle()}"
                        data-author-id="@if(mus.getAuthor() != null)${mus.getAuthor().getId()}@else 0@endif"
                        data-genre-id="@if(mus.getGenre() != null)${mus.getGenre().getId()}@else 0@endif"
                        data-duration="@if(mus.getDuration() != null)${mus.getDuration()}@else 0@endif"
                        data-likes="@if(mus.getLikes() != null)${mus.getLikes()}@else 0@endif"
                        onclick="openEditModalFromData(this)">
                    Редагувати
                </button>
                <button class="btn btn-danger"
                        data-id="${mus.getId()}"
                        data-title="${mus.getTitle()}"
                        onclick="openDeleteModalFromData(this)">
                    Видалити
                </button>
            </div>
        </div>
    @endfor

    @if(music.isEmpty())
        <div class="no-results">
            <p>Немає доданої музики</p>
        </div>
    @endif
</div>

<div id="no-search-results" class="no-results" style="display: none;">
    <p>За вашим запитом нічого не знайдено</p>
</div>

<!-- Create/Edit Modal -->
<div id="musicModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2 id="modal-title">Додати нову пісню</h2>
            <span class="close" onclick="closeModal()">&times;</span>
        </div>
        <form id="musicForm">
            <input type="hidden" id="musicId" value="">

            <div class="form-group">
                <label for="title">Назва пісні:</label>
                <input type="text" id="title" name="title" required>
            </div>

            <div class="form-group">
                <label for="authorId">Виконавець:</label>
                <select id="authorId" name="authorId" required>
                    <option value="">Оберіть виконавця</option>
                    @for(Author author : authors)
                        <option value="${author.getId()}">${author.getName()}</option>
                    @endfor
                </select>
            </div>

            <div class="form-group">
                <label for="genreId">Жанр:</label>
                <select id="genreId" name="genreId" required>
                    <option value="">Оберіть жанр</option>
                    @for(Genre genre : genres)
                        <option value="${genre.getId()}">${genre.getName()}</option>
                    @endfor
                </select>
            </div>

            <div class="form-group">
                <label for="duration">Тривалість (секунди):</label>
                <input type="number" id="duration" name="duration" min="1" required>
            </div>

            <div class="form-group">
                <label for="likes">Кількість лайків:</label>
                <input type="number" id="likes" name="likes" min="0" value="0">
            </div>

            <div style="text-align: right;">
                <button type="button" class="btn" onclick="closeModal()">Скасувати</button>
                <button type="submit" class="btn btn-primary">Зберегти</button>
            </div>
        </form>
    </div>
</div>

<div id="deleteModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Підтвердження видалення</h2>
            <span class="close" onclick="closeDeleteModal()">&times;</span>
        </div>
        <p>Ви дійсно хочете видалити пісню "<span id="deleteTitle"></span>"?</p>
        <div style="text-align: right;">
            <button type="button" class="btn" onclick="closeDeleteModal()">Скасувати</button>
            <button type="button" class="btn btn-danger" onclick="confirmDelete()">Видалити</button>
        </div>
    </div>
</div>

<script>
    var currentDeleteId = null;
    var apiBase = '/api/music';
    var allMusicItems = [];
    var filteredItems = [];

    // Ініціалізація при завантаженні сторінки
    document.addEventListener('DOMContentLoaded', function() {
        allMusicItems = Array.from(document.querySelectorAll('.music-item'));
        filteredItems = [...allMusicItems];
        updateResultsCount();
    });

    // Функція пошуку
    function filterMusic() {
        var searchTerm = document.getElementById('searchInput').value.toLowerCase().trim();
        var noResultsDiv = document.getElementById('no-search-results');

        if (searchTerm === '') {
            // Показати всі елементи
            filteredItems = [...allMusicItems];
            allMusicItems.forEach(function(item) {
                item.style.display = 'block';
            });
            noResultsDiv.style.display = 'none';
        } else {
            // Фільтрувати по назві пісні
            filteredItems = allMusicItems.filter(function(item) {
                var title = item.getAttribute('data-title');
                return title.includes(searchTerm);
            });

            allMusicItems.forEach(function(item) {
                var title = item.getAttribute('data-title');
                if (title.includes(searchTerm)) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });

            // Показати повідомлення про відсутність результатів
            if (filteredItems.length === 0) {
                noResultsDiv.style.display = 'block';
            } else {
                noResultsDiv.style.display = 'none';
            }
        }

        updateResultsCount();

        // Перезастосувати сортування до відфільтрованих елементів
        var currentSort = document.getElementById('sortSelect').value;
        applySorting(currentSort);
    }

    // Функція сортування
    function sortMusic() {
        var sortValue = document.getElementById('sortSelect').value;
        applySorting(sortValue);
    }

    function applySorting(sortValue) {
        var musicList = document.getElementById('music-list');
        var visibleItems = filteredItems.filter(function(item) {
            return item.style.display !== 'none';
        });

        // Сортування видимих елементів
        visibleItems.sort(function(a, b) {
            var aValue, bValue;

            switch(sortValue) {
                case 'title-asc':
                    aValue = a.getAttribute('data-title');
                    bValue = b.getAttribute('data-title');
                    return aValue.localeCompare(bValue, 'uk');

                case 'title-desc':
                    aValue = a.getAttribute('data-title');
                    bValue = b.getAttribute('data-title');
                    return bValue.localeCompare(aValue, 'uk');

                case 'author-asc':
                    aValue = a.getAttribute('data-author');
                    bValue = b.getAttribute('data-author');
                    return aValue.localeCompare(bValue, 'uk');

                case 'author-desc':
                    aValue = a.getAttribute('data-author');
                    bValue = b.getAttribute('data-author');
                    return bValue.localeCompare(aValue, 'uk');

                case 'genre-asc':
                    aValue = a.getAttribute('data-genre');
                    bValue = b.getAttribute('data-genre');
                    return aValue.localeCompare(bValue, 'uk');

                case 'genre-desc':
                    aValue = a.getAttribute('data-genre');
                    bValue = b.getAttribute('data-genre');
                    return bValue.localeCompare(aValue, 'uk');

                case 'likes-asc':
                    aValue = parseInt(a.getAttribute('data-likes')) || 0;
                    bValue = parseInt(b.getAttribute('data-likes')) || 0;
                    return aValue - bValue;

                case 'likes-desc':
                    aValue = parseInt(a.getAttribute('data-likes')) || 0;
                    bValue = parseInt(b.getAttribute('data-likes')) || 0;
                    return bValue - aValue;

                default:
                    return 0;
            }
        });

        // Перевставити відсортовані елементи
        visibleItems.forEach(function(item) {
            musicList.appendChild(item);
        });
    }

    function updateResultsCount() {
        var count = filteredItems.filter(function(item) {
            return item.style.display !== 'none';
        }).length;

        document.getElementById('resultsCount').textContent = 'Показано: ' + count + ' пісень';
    }

    // Оригінальні функції модальних вікон
    function openCreateModal() {
        document.getElementById('modal-title').textContent = 'Додати нову пісню';
        document.getElementById('musicForm').reset();
        document.getElementById('musicId').value = '';
        document.getElementById('musicModal').style.display = 'block';
    }

    function openEditModalFromData(button) {
        var id = button.getAttribute('data-id');
        var title = button.getAttribute('data-title');
        var authorId = button.getAttribute('data-author-id');
        var genreId = button.getAttribute('data-genre-id');
        var duration = button.getAttribute('data-duration');
        var likes = button.getAttribute('data-likes');

        openEditModal(id, title, authorId, genreId, duration, likes);
    }

    function openDeleteModalFromData(button) {
        var id = button.getAttribute('data-id');
        var title = button.getAttribute('data-title');

        openDeleteModal(id, title);
    }

    function openEditModal(id, title, authorId, genreId, duration, likes) {
        document.getElementById('modal-title').textContent = 'Редагувати пісню';
        document.getElementById('musicId').value = id;
        document.getElementById('title').value = title;
        document.getElementById('authorId').value = authorId;
        document.getElementById('genreId').value = genreId;
        document.getElementById('duration').value = duration;
        document.getElementById('likes').value = likes;

        document.getElementById('musicModal').style.display = 'block';
    }

    function openDeleteModal(id, title) {
        currentDeleteId = id;
        document.getElementById('deleteTitle').textContent = title;
        document.getElementById('deleteModal').style.display = 'block';
    }

    function closeModal() {
        document.getElementById('musicModal').style.display = 'none';
    }

    function closeDeleteModal() {
        document.getElementById('deleteModal').style.display = 'none';
        currentDeleteId = null;
    }

    document.getElementById('musicForm').addEventListener('submit', function(e) {
        e.preventDefault();

        var formData = new FormData(this);
        var musicData = {
            title: formData.get('title'),
            authorId: parseInt(formData.get('authorId')),
            genreId: parseInt(formData.get('genreId')),
            duration: parseInt(formData.get('duration')),
            likes: parseInt(formData.get('likes')) || 0
        };

        var musicId = document.getElementById('musicId').value;

        var url = musicId ? apiBase + '/' + musicId : apiBase;
        var method = musicId ? 'PUT' : 'POST';

        fetch(url, {
            method: method,
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(musicData)
        })
            .then(function(response) {
                if (!response.ok) {
                    throw new Error('Помилка збереження музики');
                }
                closeModal();
                showSuccess(musicId ? 'Пісню успішно оновлено!' : 'Пісню успішно додано!');
                setTimeout(function() {
                    window.location.reload();
                }, 1000);
            })
            .catch(function(error) {
                showError('Помилка збереження: ' + error.message);
            });
    });

    function confirmDelete() {
        if (!currentDeleteId) return;

        fetch(apiBase + '/' + currentDeleteId, {
            method: 'DELETE'
        })
            .then(function(response) {
                if (!response.ok) {
                    throw new Error('Помилка видалення музики');
                }
                closeDeleteModal();
                showSuccess('Пісню успішно видалено!');
                setTimeout(function() {
                    window.location.reload();
                }, 1000);
            })
            .catch(function(error) {
                showError('Помилка видалення: ' + error.message);
            });
    }

    function showError(message) {
        var errorDiv = document.getElementById('error-message');
        errorDiv.innerHTML = '<div class="error">' + message + '</div>';
        setTimeout(function() {
            errorDiv.innerHTML = '';
        }, 5000);
    }

    function showSuccess(message) {
        var successDiv = document.getElementById('success-message');
        successDiv.innerHTML = '<div class="success">' + message + '</div>';
        setTimeout(function() {
            successDiv.innerHTML = '';
        }, 3000);
    }

    window.onclick = function(event) {
        var musicModal = document.getElementById('musicModal');
        var deleteModal = document.getElementById('deleteModal');

        if (event.target === musicModal) {
            closeModal();
        }
        if (event.target === deleteModal) {
            closeDeleteModal();
        }
    }
</script>
</body>
</html>