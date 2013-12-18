View = require 'views/base/view'
Camera = require '../../models/Camera'
CVImage = require '../../models/Image'
Colors = require '../../models/Color'
Display = require '../../models/Display'

module.exports = class HomePageView extends View
    autoRender: true
    className: 'home-page'
    template: require './templates/home'
    box: null
    camInput: null

    camInput: =>
        c = new Camera()
        c.init =>
            display = new Display(box)
            size = display.resolution()
            setInterval(=>
                me = c.getImage()
                me = me.resize size[0], size[1]
                me = me.saturate()
                dl = me.addDrawingLayer()
                dl.noFill()
                faces = me.getFaces()
                for face in faces
                    dl.rect(face.x, face.y ,face.width, face.height)
                    console.log(face)
                me.show(display)
            ,1000/60)
        return
    initialize: =>
        @camera = []
        $(=>
            @box = $("#box")
            @camInput()
        )
        return
        
