push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

--[[
    Run when the game first starts up. Used to initialize the game
]]
function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
      fullscreen = false,
      resizable = true,
      vsync = true
  })
  
  smallfont = love.graphics.newFont('font.ttf', 8)
  scorefont = love.graphics.newFont('font.ttf', 32)
  love.graphics.setFont(smallfont)
  
  player1score = 0
  player2score = 0
  
  player1Y = 30
  player2Y = VIRTUAL_HEIGHT - 50
end
--[[
    Called by love2D each frame
]]
function love.update(dt)
  if love.keyboard.isDown('w') then
    player1Y = player1Y + -PADDLE_SPEED * dt
  elseif love.keyboard.isDown('s') then
    player1Y = player1Y + PADDLE_SPEED * dt
  end
  
  if love.keyboard.isDown('up') then
    player2Y = player2Y + -PADDLE_SPEED * dt
  elseif love.keyboard.isDown('down') then
    player2Y = player2Y + PADDLE_SPEED * dt
  end
end
--[[
    Keyboard handling, called by love2D each frame; passes in the key we pressed so we can access it
]]
function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
end
--[[
    Called after update by love2D. Use to draw anything unto the screen once they have changed
]]
function love.draw()
  push:apply('start')
  love.graphics.clear(40/255, 45/255, 52/255, 255/255)
  
  love.graphics.setFont(smallfont)
  love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')
  
  love.graphics.setFont(scorefont)
  love.graphics.print(tostring(player1score), VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 3)
  love.graphics.print(tostring(player2score), VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)
  
  love.graphics.rectangle('fill', 10, player1Y, 5, 20)
  love.graphics.rectangle('fill', VIRTUAL_WIDTH - 15, player2Y, 5, 20)
  love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)
  
  push:apply('end')
end
