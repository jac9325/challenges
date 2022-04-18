const prompt = require('prompt-sync')({ sigint: true });

const adivina = () => {
  const numero = 1;
  let estado = false;

  while (estado === false) {
    const numero2 = prompt('Ingresa un número entre 1 y 5: ', '2');
    if (Number(numero2) < 1 || Number(numero2) > 5) {
      console.log('Error, solo ingresar números entre 1 y 5');
    } else {
      if (Number(numero2) === numero) {
        console.log('Adivinaste!!!');
                estado = true;
    }else
    }        
    }
}

adivina();



