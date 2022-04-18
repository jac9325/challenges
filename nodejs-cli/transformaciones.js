/* eslint-disable no-console */
const prompt = require('prompt-sync')({ sigint: true });

const arr = [1, 2, 3, 4, 5, 6];
console.log('********************************');
// eslint-disable-next-line no-console
console.log(`Transformaciones de la lista: [${arr}] por consola`);
// eslint-disable-next-line no-console
console.log('********************************');
const opcion = prompt('Qué desea hacer: 1. Imprimir 2.Duplicar?');
switch (Number(opcion)) {
  case 1:
    arr.forEach((element) => {
      console.log(`${element}`);
    });
    break;

  case 2:
    arr.forEach((element) => {
      // eslint-disable-next-line no-console
      console.log(`${element * 2}`);
    });
    break;

  default:
    break;
}
