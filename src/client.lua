require("lib/class")
require("lib/lube")

function onConnect()
  
end
function onReceive(data) 
  key, isRepeat = data:match("^(%S*) (%S*)")
  print(key)
end
function onDisconnect()
 
end
function love.keypressed(key, isRepeat)
  if key == "e" then
    client:send("endturn e")
  elseif key == "t" then
    client:send("target t")
  end
end

client = lube:tcpClient()
client.callbacks.connect = onConnect
client.callbacks.recv = onReceive
client.callbacks.disconnect = onDisconnect
client.handshake = "Hi!"
success, er = client:connect("127.0.0.1", 18025)
print("Success when connecting to server: " .. tostring(success))


function love.update(deltatime)
  client:update(deltatime)
end
