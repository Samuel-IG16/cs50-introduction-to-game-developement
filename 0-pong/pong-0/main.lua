WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

--[[
    Run when the game first starts up. Used to initialize the game
]]
function love.load()
  love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
      fullscreen = false,
      resizable = false,
      vsync = true
  })
end
--[[
    Called after update by love2D. Use to draw anything unto the screen
]]
function love.draw()
  love.graphics.printf(
    'Hello Pong!',
    0,
    WINDOW_HEIGHT / 2 - 6,
    WINDOW_WIDTH,
    'center'
  )
end
