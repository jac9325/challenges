var element = document.getElementById('boton');
const song = new Audio("music.mp3");

var repro = true;

var Reproducir =()=>{
    if (repro==true){
        
        song.play();
        repro = false;
        element.innerHTML = "■";
        console.log(repro);
        
    }else{
        song.pause();
        repro = true;
        element.innerHTML = "►";
        console.log(repro);
    }   
} 

