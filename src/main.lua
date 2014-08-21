first = true

function love.keypressed(key, isRepeat)
  if first then
    first = false
    if key == 's' then
      print("Server selected")
      dofile "server.lua"
    elseif key == 'c' then
      print("Client selected")
      dofile "client.lua"
    end
  end
end
print("Press s for server and c for client")
