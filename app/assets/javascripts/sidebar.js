document.getElementById("menu-toggle").onclick = (function (e) {
  left_sidebar = document.getElementById("wrapper");
  left_sidebar.classList.toggle("toggled");
  e.preventDefault();
});
