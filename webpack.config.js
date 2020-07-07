const nodeExternals = require('webpack-node-externals')
const path = require('path');

module.exports = {
  target: 'node',
  externals: [nodeExternals({
<<<<<<< HEAD
    whitelist:['telegraf', 'babel-loader']
=======
    whitelist:['telegraf']
>>>>>>> 3f213b9b573435c809992ca428863196f66e7408
  })],
  entry: './src/app.js',
  output: {
    path: path.join(__dirname, 'dist'),
    filename: "app.js",
  },
  module: {
    rules: [{
      test: /\.js$/,
      exclude: /(node_modules)/,
      loader: 'babel-loader',
      query: {
        presets: [
          ["env", {
            "targets": {
              "node": "current"
            }
          }]
        ]
      }
    }]
  },
  resolve: {
    extensions: ['.json', '.js']
  }
};