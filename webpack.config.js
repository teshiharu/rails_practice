const path = require('path');

module.exports = function(env) {
  return [{
    entry: {
      practice: path.resolve("src/entry.js"),
    },
    output: {
      path: path.resolve('public/packs/dev'),
      filename: '[name].js',
    },
    module:{
      rules: [
        {
          test: /\.css$/i,
          use: [
            'style-loader',
            'css-loader',
            'sass-loader',
          ],
        },
        {
          test: /\.(erb.vue|erb.js)$/,
          enforce: 'pre',
          exclude: /node_modules/,
          loader: 'rails-erb-loader',
          options: {
            runner: 'bin/rails-runner',
          },
        },
        {
          test: /\.(png|jpg|gif)$/,
          use: [
            {
              loader: 'url-loader',
              options: {}
            }
          ],
        },
        {
          test: /\.js$/,
          exclude: /node_modules/,
          loader: 'babel-loader',
          options: {
            presets: ['es2015', 'stage-2']
          }
        },
        {
          test: /\.vue$/,
          loader: 'vue-loader',
          options: {
            loaders: {
              js: [{
                exclude: /node_modules/,
                loader: 'babel-loader',
                options: {
                  presets: ['es2015', 'stage-2'],
                }
              }],
              file: 'file-loader',
              sass: 'vue-style-loader!css-loader!sass-loader?indentedSyntax',
              scss: [
                'vue-style-loader',
                'css-loader',
                'sass-loader',
                {
                  loader: 'sass-resources-loader',
                  options: {
                    resources: [
                      path.resolve('src/styles/constants.scss'),
                      path.resolve('src/styles/mixins.scss'),
                    ],
                  }
                }
              ]
            }
          }
        },
      ],
    },
    resolve: {
      extensions: ['.js', '.vue'],
      modules: [
        "node_modules",
        "src",
      ],
      alias: {
        vue: 'vue/dist/vue.esm.js',
      },
    },
    plugins: [],
    resolveLoader: {
      modules: ['lib/node_modules', 'node_modules'],
    },
  }];
}
