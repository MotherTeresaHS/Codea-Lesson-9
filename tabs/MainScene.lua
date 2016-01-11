-- MainScene
-- Lesson 6

-- Created by: Mr Coxall
-- Created on: Nov 2014
-- Created for: ICS2O
-- This is the second scene

MainScene = class()

-- global to this file
local ship

local bullets = {}

function MainScene:init()

    sprite("Space Art:Green Bullet")
    ship = SpriteObject("Space Art:Green Ship", vec2(WIDTH/2, 100))
    ship.draggable = false
end

function MainScene:draw()
    -- Codea does not automatically call this method
    
    background(0, 30, 255, 255)
    ship:draw()
    
    local bulletCounter = 1
    if (#bullets > 0) then
        while (bulletCounter <= #bullets) do
            bullets[bulletCounter]:draw()
            --print(bullets[bulletCounter])
            bullets[bulletCounter].objectCurrentLocation.y = bullets[bulletCounter].objectCurrentLocation.y + 10
            
            if (bullets[bulletCounter].objectCurrentLocation.y > 768) then
                table.remove(bullets,bulletCounter)
            end
            bulletCounter = bulletCounter + 1
        end
    end  
    
end

function MainScene:touched(touch)
    -- Codea does not automatically call this method
    ship:touched(touch) 
        
    if(ship.selected == true) then
        local aSingleBullet
        aSingleBullet = SpriteObject("Space Art:Green Bullet", vec2(WIDTH/2, 125))
        
        table.insert(bullets, aSingleBullet)              
    end
    print(#bullets)
end
