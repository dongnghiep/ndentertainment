
var then = window.pageYOffset;
window.onscroll = function () { nav() }
function backToTop() {
    if (document.body.scrollTop > 600 || document.documentElement.scrollTop > 600) {
        backTo.style.display = "block";
    } else {
        backTo.style.display = "none";
    }
}

function nav() {
    var now = window.pageYOffset;
    if (then > now) {
        document.getElementById("menu").style.top = "0";
    } else {
        document.getElementById("menu").style.top = "-100px";
    }
    then = now;
}