const button = document.getElementById('submitForm');
const form = document.querySelector('.form');

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
});const button = document.getElementById('submitForm');
const form = document.querySelector('.form');

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