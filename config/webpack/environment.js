const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ["@popperjs/core@2/dist/umd/popper.js", "default"],
    moment: 'moment',
  })
)

module.exports = environment
