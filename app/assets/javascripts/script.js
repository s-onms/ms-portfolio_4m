var lang = document.querySelector('html').lang;

var opt;
if (lang === 'ja') {
    opt = document.querySelector('option[value="plus.html.erb"]');
} else if (lang === 'en') {
    opt = document.querySelector('option[value="index-en.html.erb"]');
} else if (lang === 'zh') {
    opt = document.querySelector('option[value="index-zh.html.erb"]');
}
opt.selected = true;

document.getElementById('form').select.onchange = function () {
    location.href = document.getElementById('form').select.value;
}