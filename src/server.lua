require("lib/class")
require("lib/lube")

clients = {}

commands = {target = function(param, id) print("target " .. param) end,
            endturn = function(param, id) print("endturn " .. param) end} 

function onConnect(id)
  clients[id] = {}
  print("Connection: " .. tostring(id))
end
function onReceive(data, id)
  command, param = data:match("^(%S*) (%S*)")
  if commands[command] then
    commands[command](param, id)
  else
    print("Unknown command: \"" .. command .. '"')
  end
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
