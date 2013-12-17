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
    faceDetect: null

    initialize: =>

        @camera = []
        $(=>
            console.log("Test")
            @box = $(".home-page #box")

            #@box.html(cvimg)
            @faceDetect()
            #console.log @box
        )
        return
    count = 0
    faceDetect: =>
        console.log("faceDetect()")
        container = $(".cvImage")

        c = new Camera()
        c.init =>
            setInterval(=>
                me = c.getImage()
                me = me.scale(.5)
                me = me.saturate()
                me.show(box)
            ,1000/60)
        return
