View = require 'views/base/view'
Camera = require '../../models/Camera'
CVImage = require '../../models/Image'


module.exports = class HomePageView extends View
  autoRender: true
  className: 'home-page'
  template: require './templates/home'
