'use strict';

require( './styles/main.scss' );

var Elm = require( '../src/Main' );

var app = Elm.Elm.Main.init({flags: {
  baseUrl: "localhost:5000"
}});
