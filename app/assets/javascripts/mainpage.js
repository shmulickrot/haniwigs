$(document).on('turbolinks:load', function () {
    load_carousel();
    fix_chrome_fregmant();
    animate();

});

function animate() {
    const elements = document.querySelectorAll('li, h1,h3,i,p,img.mb-3');
    elements.forEach(elem => {
        Object.assign(elem.style, {'animation-duration': "3s"})
    });
    observer = new IntersectionObserver((entries) => {
        entries.forEach((function (entry, i) {
            if (entry.intersectionRatio > 0) {
                if (entry.target.classList.contains('logo')) {
                    entry.target.classList.add('animated', 'zoomIn')
                } else {
                    entry.target.classList.add('animated', 'slideInRight');
                }
            } else {
                if (entry.target.classList.contains('zoomIn')) {
                    entry.target.classList.remove('animated', 'zoomIn')
                } else {
                    entry.target.classList.remove('animated', 'slideInRight');
                }
            }
        }))
    });
    elements.forEach(elem => {
        observer.observe(elem)
    })
};

//    element.classList.add(animated,fadeInRight);


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
