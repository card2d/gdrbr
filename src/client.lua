require("lib/class")
require("lib/lube")

function onConnect()
  
end
function onReceive(data)
  print(data .. " received from the server")
end
function onDisconnect()
 
end

client = lube:tcpClient()
client.callbacks.connect = onConnect
client.callbacks.recv = onReceive
client.callbacks.disconnect = onDisconnect
client.handshake = "Hi!"
success, er = client:connect("127.0.0.1", 18025)
print("Success when connecting to server: " .. tostring(success))
client:send("hello")

function love.update(deltatime)
  client:update(deltatime)
end
