const hamburger = document.getElementById("hamburger");
const navMenu = document.getElementById("navmenu");

hamburger.addEventListener("click", () => {
    navMenu.classList.toggle("active");
});