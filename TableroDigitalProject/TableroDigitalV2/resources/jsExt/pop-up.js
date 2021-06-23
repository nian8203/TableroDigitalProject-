 var btnAbrirPopup = document.getElementById("abrir-pop-up"),
    overlay = document.getElementById("overlay"),
    popup = document.getElementById("pop-up"),
    btnCerrarPopup = document.getElementById("btn-cerrar-pop-up");

btnAbrirPopup.addEventListener("click", function(){
    overlay.classList.add("active"); 
    popup.classList.add("active");
});

btnCerrarPopup.addEventListener("click", function(){
    overlay.classList.remove("active"); 
    popup.classList.remove("active");
});

 