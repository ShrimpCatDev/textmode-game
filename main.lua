require("init")

function love.load()
    defW = 800 -- Default width
    defH = 600 -- Default height
    
    love.window.setMode(defW,defH,{resizable=true})
    local w,h=love.window.getMode()

    scale=((w/defW)+(h/defH))/2

    zoomDefault=5
    zoom=zoomDefault*scale

    camera=require("lib/camera")
    cam=camera(0,0)
    cam:zoomTo(zoom)

    moonshine=require("lib/moonshine")
    font = require("assets/font/skull")
    lg.setFont(font)

    effect=moonshine(moonshine.effects.glow)
end

function love.update(dt)
    input:update()
end 

function love.draw() 
    effect(function()
        lg.clear(0.1,0.5,1)
        cam:attach()
            lg.rectangle("fill",0,0,15,15)
        cam:detach()
    end)
end

function love.resize(w,h)
    local w,h=love.window.getMode()

    scale=((w/defW)+(h/defH))/2

    zoomDefault=5
    zoom=zoomDefault*scale
    cam:zoomTo(zoom)
    effect=moonshine(moonshine.effects.glow)
end
