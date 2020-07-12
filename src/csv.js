const createCsvWriter = require('csv-writer').createObjectCsvWriter;
const path = require('path')

const criarArquivoCSV = async (cabecalho, dados, nomeDoArquivo) => {
    const csvWriter = createCsvWriter({
        path: path.join(__dirname, '..', 'csv', nomeDoArquivo),
        header: criarCabecalho(cabecalho)
    })

    await csvWriter.writeRecords(dados)
}

const criarCabecalho = (titulos) => {
    return titulos.map(titulo => {
        return {id: titulo.toLowerCase().replace(/ /g, "_"), title: titulo}
    })
}

module.exports = { criarArquivoCSV }