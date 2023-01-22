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
  love.graphics.printf('Hello Pong!', 0, VIRTUAL_HEIGHT / 2 - 6, VIRTUAL_WIDTH, 'center')
  push:apply('end')
end
