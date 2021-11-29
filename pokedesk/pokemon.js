const url = 'https://pokeapi.co/api/v2/pokemon/';
fetch(url)
.then(response=>response.json())
.then(pokemonObj => pokemonHtml(pokemonObj));

const pokemonHtml = (pokemonObj) =>{
  const pokeList = pokemonObj.results;

  pokeList.forEach((pok, i) => {
    fetch(pok.url)
    .then(response=>response.json())
    .then(pokemon =>pokeHabilidades(pokemon,i));
  });
}

const divPadre = document.getElementById('container')

const pokeHabilidades = (pokemon,i) => {
    console.log(pokemon);
    const pokemonContainer = document.createElement('div');
    

    divPadre.append(pokemonContainer);
    pokemonContainer.classList.add('pokemon');
    pokemonContainer.setAttribute("id",`pokemon${(i+1)}`);
    

    const pokemonImageHtml = document.createElement('p');
    pokemonImageHtml.setAttribute("id",`pokemon${(i+1)}`);
    pokemonImageHtml.setAttribute('onclick',"evento(this)");


    const pokemonAbilitieHtml = document.createElement('p');
    
 
    const pokemonNameHtml = document.createElement('p');
    const pokemonBaseHtml = document.createElement('p');
    const pokemonHabilidades = document.createElement('p');



    pokemonNameHtml.innerHTML = "<b>"+pokemon.name+"</b>";
    pokemonImageHtml.innerHTML = '<img src="' +pokemon.sprites.front_default+ '"></img>'
    pokemonHabilidades.innerHTML = "<b>Habilidades : </b> "+pokemon.abilities[0].ability.name;
    pokemonBaseHtml.innerHTML = "<b>Experiencia base: </b>" +pokemon.base_experience;

    pokemonContainer.append(pokemonImageHtml, pokemonNameHtml, pokemonAbilitieHtml, pokemonBaseHtml, pokemonHabilidades);
    

}

