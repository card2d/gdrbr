require("lib/class")
require("lib/lube")

clients = {}

function onConnect(id)
  clients[id] = true
  print("Connection: " .. tostring(id))
end
function onReceive(data, id)
  print(data .. " received from " .. tostring(id))
end
function onDisconnect(id)
  clients[id] = nil
  print("Disconnection: " .. id)
end

server = lube:tcpServer()
server.callbacks.connect = onConnect
server.callbacks.recv = onReceive
server.callbacks.disconnect = onDisconnect
server.handshake = "Hi!"
server:listen("18025")

function love.update(deltatime)
  server:update(deltatime)
end
