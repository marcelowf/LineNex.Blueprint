function isDarkModePreferred() {
    if (window.matchMedia) {
      return window.matchMedia('(prefers-color-scheme: dark)').matches;
    }
    return false;
  }

  document.addEventListener('DOMContentLoaded', function() {
    let isThemeSet = localStorage.getItem('style');

    if (isThemeSet == null) {
      if (isDarkModePreferred) {
        switchStyle('dark');
        localStorage.setItem('style', 'dark');
      }
      else {
        switchStyle('light');
        localStorage.setItem('style', 'light');
      }
    }
  });

  function switchStyle(style) {
    let darktheme = document.getElementById('dark-theme');
    let body = document.body;

    if (style === 'dark') {
      darktheme.disabled = false;
      body.setAttribute('data-theme', 'dark');
    }
    else {
      darktheme.disabled = true;
      body.removeAttribute('data-theme', 'dark');
    }
  }
  
  document.addEventListener('DOMContentLoaded', function () {
    let savedStyle = localStorage.getItem('style');

    if (!savedStyle) {
      savedStyle = 'light';
      localStorage.setItem('style', 'light');
    }

    switchStyle(savedStyle);
  });

  function toggleDarkMode(){
    let body = document.body;
    let isDarkMode = body.getAttribute('data-theme') === 'dark';

    if (!isDarkMode) {
      switchStyle('dark');
      localStorage.setItem('style', 'dark');
    }
    else {
      switchStyle('light');
      localStorage.setItem('style', 'light');
    }
  }