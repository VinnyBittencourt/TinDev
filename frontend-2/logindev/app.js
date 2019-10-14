var btn = window.getElementsByClassName("btn");

btn.addEventListener("click", func(btn));

function func() {
  preventDefault();
  btn.style.backgroundColor = rgba(128, 0, 128, 0.7);
}
