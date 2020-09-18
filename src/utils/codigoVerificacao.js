const gerarNumeroValidacaoSms = () => {
  let numero = '';
  for (let i = 0; i < 5; i += 1) {
    numero += Math.trunc(Math.random() * 10);
  }
  return numero;
};

module.exports = { gerarNumeroValidacaoSms };
