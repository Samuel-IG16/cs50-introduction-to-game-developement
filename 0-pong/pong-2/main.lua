push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

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
  love.graphics.setFont(smallfont)
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
  --love.graphics.clear(40, 45, 52, 255)
  love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')
  love.graphics.rectangle('fill', 10, 30, 5, 20)
  love.graphics.rectangle('fill', VIRTUAL_WIDTH - 15, VIRTUAL_HEIGHT - 50, 5, 20)
  love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)
  push:apply('end')
end
