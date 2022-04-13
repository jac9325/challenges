
function Reproductor(song,estado,element){
    this.song = song,
    this.estado = estado,
    this.element = element
}

var element = document.getElementById('boton');
const song = new Audio("music.mp3");

var song1 = new Reproductor(song,true,element);


let reproducir=(song1)=>{
    if (song1.estado == true){
        song1.song.play();
        song1.estado = false;
        song1.element.innerHTML = "■";
        
    }else{
        song1.song.pause();
        song1.estado = true;
        song1.element.innerHTML = "►";
    }
}
reproducir(song1);
