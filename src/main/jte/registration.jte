<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration form</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            background: radial-gradient(circle at center, #12101c, #0a0a12);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form{
            border-radius: 20px;
            padding: 20px 30px;
            background-color: #1a1d2e;
            width: 300px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            gap: 16px;
        }

        input {
            background-color: #26233b;
            color: #ccc;
            padding: 12px;
            border: 2px solid #3b3760;
            border-radius: 12px;
            font-size: 16px;
            outline: none;
            transition: border 0.3s;
        }

        input:focus {
            border-color: #6a5acd;
        }

        h3{
            color: #e0e0e2;
            font-size: 26px;
            text-align: center;
            padding-bottom: 5px;
        }

        .form__label {
            font-size: 16px;
            display: block;
            margin-bottom: 4px;
        }

        .form__body{
            gap: 20px;
            display: flex;
            flex-direction: column;
            color: #a8abb9;
        }
        .form__footer{
            display: flex;
            justify-content: flex-start;
            gap: 5px;
        }
        .form__show-password{
            color: #9fa3b4;
            cursor: pointer;
        }
        .form__show-password:hover{
            text-decoration: underline;
        }
        button{
            background-color: #272641;
            color: #e4e3e6;
            border: none;
            cursor: pointer;
            display: inline-flex;
            width: 150px;
            border-radius: 20px;
            padding: 5px 75px;
            justify-content: center;
            align-items: center;
            transition: 0.2s;
        }
        button:hover{
            background-color: #2d2b4a;
        }
        .form__input--error {
            border: 2px solid red;
            outline: none;
        }
    </style>
</head>
<body>
<form class="form" action="/api/register" method="post">
    <div class="form__header">
        <h3>Register</h3>
    </div>
    <div class="form__body">
        <div class="form__group">
            <label for="username" class="form__label">Username</label>
            <input type="text" placeholder="Username" id="username" name="username" />
        </div>
        <div class="form__group">
            <label for="password" class="form__label">Password</label>
            <input type="password" placeholder="Password" id="password" name="password" />
        </div>
    </div>
    <div class="form__footer">
        <input type="checkbox" id="checkbox" class="form__checkbox" name="checkbox">
        <label for="checkbox" class="form__show-password" id="show-password">Show password</label>
    </div>
    <button id="submitForm" type="submit">Create account</button>
</form>

<script>
    const button = document.getElementById('submitForm');
    const form = document.querySelector('.form');

    const checkBox = document.getElementById('checkbox');

    checkBox.addEventListener('change', () => {
        const passwordInput = document.getElementById('password');
        if (checkBox.checked) passwordInput.type = 'text';
         else passwordInput.type = 'password';
    });

    const validatePassword = (password) => password.length >= 8;
    const showError = (input) => input.classList.add('form__input--error');
    const clearError = (input) => input.classList.remove('form__input--error');

    button.addEventListener('click', (e) => {
        e.preventDefault();
        const usernameInput = document.getElementById('username');
        const passwordInput = document.getElementById('password');

        const username = usernameInput.value.trim();
        const password = passwordInput.value.trim();

        let isValid = true;


        clearError(usernameInput);
        clearError(passwordInput);


        if (username === '') {
            showError(usernameInput);
            isValid = false;
        }

        if (password === '') {
            showError(passwordInput);
            isValid = false;
        }
        if (!validatePassword(password)) {
            showError(passwordInput);
            isValid = false;
        }

        if (isValid)  form.submit();
    });
</script>
</body>
</html>