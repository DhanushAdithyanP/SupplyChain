const sideMenu = document.querySelector('aside');
const menuBtn = document.querySelector('#menu_bar');
const closeBtn = document.querySelector('#close_btn');
const themeToggler = document.querySelector('.theme-toggler');

// Function to apply dark theme
function applyDarkTheme() {
    document.body.classList.add('dark-theme-variables');
    themeToggler.querySelector('span:nth-child(1)').classList.add('active');
    themeToggler.querySelector('span:nth-child(2)').classList.remove('active');
}

// Function to remove dark theme
function removeDarkTheme() {
    document.body.classList.remove('dark-theme-variables');
    themeToggler.querySelector('span:nth-child(1)').classList.remove('active');
    themeToggler.querySelector('span:nth-child(2)').classList.add('active');
}

// Check localStorage for theme preference
if (localStorage.getItem('theme') === 'dark') {
    applyDarkTheme();
} else {
    removeDarkTheme();
}

menuBtn.addEventListener('click', () => {
    sideMenu.style.display = "block";
});
closeBtn.addEventListener('click', () => {
    sideMenu.style.display = "none";
});

themeToggler.addEventListener('click', () => {
    if (document.body.classList.contains('dark-theme-variables')) {
        removeDarkTheme();
        localStorage.setItem('theme', 'light');
    } else {
        applyDarkTheme();
        localStorage.setItem('theme', 'dark');
    }
});
