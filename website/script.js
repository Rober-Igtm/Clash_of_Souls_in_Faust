window.addEventListener("DOMContentLoaded", init, false);
function init() {
    const buttons = document.querySelectorAll(".button");
    for (var i = 0; i < buttons.length; i++) {
        buttons[i].addEventListener("click", toggle, false);
    }
    const checkboxes = document.querySelectorAll("input[type='checkbox']");
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].addEventListener("click", highlight, false);
    }
}
function toggle() {
    const panels = document.querySelectorAll("#main > div");
    for (var i = 0; i < panels.length; i++) {
        panels[i].style.display = "none";
    }
    const selected = this.id + "text";
    document.querySelector("#" + selected).style.display = "block";
}

function highlight() {
    var targets = document.getElementsByClassName(this.id);
    if (this.checked) {
        for (var i = 0; i < targets.length; i++) {
            targets[i].classList.add("highlight" + this.id);
        }
    } else {
        for (var i = 0; i < targets.length; i++) {
            targets[i].classList.remove("highlight" + this.id);
        }
    }
}