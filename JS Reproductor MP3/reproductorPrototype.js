function Reproductor(song,estado,element){
    this.song = song,
    this.estado = estado,
    this.element = element
}

Reproductor.prototype.reproducir = function(){
    if (this.estado == true){
        this.song.play();
        this.estado = false;
        this.element.innerHTML = "■";
        
    }else{
        this.song.pause();
        this.estado = true;
        this.element.innerHTML = "►";
    }
}
