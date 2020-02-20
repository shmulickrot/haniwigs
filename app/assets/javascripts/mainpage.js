$(document).on('turbolinks:load', function () {
    load_carousel()
    fix_chrome_fregmant()
});

function load_carousel() {
    $('.carousel').carousel({
        interval: 5000
    })
}

function fix_chrome_fregmant() {
    var isChrome = /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor);
    if (window.location.hash && isChrome) {
        setTimeout(function () {
            var hash = window.location.hash;
            window.location.hash = "";
            window.location.hash = hash;
        }, 300);
    }
}

if (document.getElementById("error_field")) {
    location.hash = '#form';
}
// document.addEventListener("turbolinks:load", function() { alert("ok!") });
