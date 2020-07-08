const nodeExternals = require('webpack-node-externals')
const path = require('path');

module.exports = {
  target: 'node',
  externals: [nodeExternals({
    whitelist:['telegraf']
  })],
  entry: './dist/',
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
          }], "es2015"
        ]
      }
    }]
  },
  resolve: {
    extensions: ['.json', '.js']
  }
};