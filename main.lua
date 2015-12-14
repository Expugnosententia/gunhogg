function love.load()
	canvas = love.graphics.newCanvas(800, 600)
 
	-- Rectangle is drawn to the canvas with the alpha blend mode.
	love.graphics.setCanvas(canvas)
		canvas:clear()
		love.graphics.setBlendMode('alpha')
		love.graphics.setColor(255, 0, 100, 128)
		love.graphics.rectangle('fill', 50,25, 700, 500)
	love.graphics.setCanvas()
	hero = {} -- new table for the hero
    hero.x = 300    -- x,y coordinates of the hero    
    hero.y = 450
    hero.speed = 100
end
 
function love.draw()
	love.graphics.setColor(255, 255, 255, 255)
 
	-- The rectangle from the Canvas was already alpha blended.
	-- Use the premultiplied blend mode when drawing the Canvas itself to prevent another blending.
	love.graphics.setBlendMode('premultiplied')
	love.graphics.draw(canvas)
	-- Observe the difference if the Canvas is drawn with the alpha blend mode instead.
--	love.graphics.setBlendMode('alpha')
--	love.graphics.draw(canvas, 100, 0)
 love.graphics.setColor(255,255,0,255)
 love.graphics.rectangle("fill", hero.x,hero.y, 30, 15)
 
	-- Rectangle is drawn directly to the screen with the alpha blend mode.
	--love.graphics.setBlendMode('alpha')
	--love.graphics.setColor(255, 0, 0, 128)
	--love.graphics.rectangle('fill', 200, 0, 100, 100)
end


function love.update(dt)
 if love.keyboard.isDown("left") then
   hero.x = hero.x - hero.speed*dt
 elseif love.keyboard.isDown("right") then
   hero.x = hero.x + hero.speed*dt
 elseif love.keyboard.isDown("up") then
 	hero.y = hero.y - hero.speed*dt
 elseif love.keyboard.isDown("down") then
 	hero.y = hero.y + hero.speed*dt
 	if hero.y > 500 then
 		hero.y = 25
 	end 
 elseif love.keyboard.isDown("escape") then
     love.event.quit()
 end
end


