const hamburger = document.getElementById("hamburger");
const navMenu = document.getElementById("navbar");

hamburger.addEventListener("click", () => {
    navMenu.classList.toggle("active");
});