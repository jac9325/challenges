class Reproductor{
    constructor(audio, estado, element){
        this.audio = audio;;
        this.estado = estado;
        this.element = element;
    }

    reproducir(){
        if (this.estado == true){
            song.play();
            this.estado = false;
            element.innerHTML = "■";
            console.log(this.estado);
            
        }else{
            song.pause();
            this.estado = true;
            element.innerHTML = "►";
            console.log(this.estado);
        }
    }
}
    var element = document.getElementById('boton');
    const song = new Audio("music.mp3");
    const reproductor1 = new Reproductor(song, true, element);    
