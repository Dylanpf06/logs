function sanitize(string)
    return string:gsub('%@', '')
end

exports('sanitize', function(string)
    sanitize(string)
end)

RegisterNetEvent("discordLogs")
AddEventHandler("discordLogs", function(message, color, channel)
    discordLog(message, color, channel)
end)

-- Get exports from server side
exports('discord', function(message, id, id2, color, channel)


	local ids = ExtractIdentifiers(id)
	local postal = getPlayerLocation(id)
	if Config.postal then _postal = "\n**Nearest Postal:** ".. postal .."" else _postal = "" end
	if Config.discordID then if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end else _discordID = "" end
	if Config.steamID then if ids.steam ~= "" then _steamID ="\n**Steam ID:** " ..ids.steam.."" else _steamID = "\n**Steam ID:** N/A" end else _steamID = "" end
	if Config.steamURL then  if ids.steam ~= "" then _steamURL ="\nhttps://steamcommunity.com/profiles/" ..tonumber(ids.steam:gsub("steam:", ""),16).."" else _steamURL = "\n**Steam URL:** N/A" end else _steamURL = "" end
	if Config.playerID then _playerID ="\n**Player ID:** " ..id.."" else _playerID = "" end
	local player1 = message..'\n'.._playerID..''.. _postal ..''.. _discordID..''.._steamID..''.._steamURL
	_message = player1

	if id2 ~= 0 then
	local ids2 = ExtractIdentifiers(id2)
	local postal2 = getPlayerLocation(id2)
	if Config.postal then _postal2 = "\n**Nearest Postal:** ".. postal2 .."" else _postal2 = "" end
	if Config.discordID then if ids2.discord ~= "" then _discordID2 ="\n**Discord ID:** <@" ..ids2.discord:gsub("discord:", "")..">" else _discordID2 = "\n**Discord ID:** N/A" end else _discordID2 = "" end
	if Config.steamID then if ids2.steam ~= "" then _steamID2 ="\n**Steam ID:** " ..ids2.steam.."" else _steamID2 = "\n**Steam ID:** N/A" end else _steamID2 = "" end
	if Config.steamURL then  if ids2.steam ~= "" then _steamURL2 ="\nhttps://steamcommunity.com/profiles/" ..tonumber(ids2.steam:gsub("steam:", ""),16).."" else _steamURL2 = "\n**Steam URL:** N/A" end else _steamURL2 = "" end
	if Config.playerID then _playerID2 ="\n**Player ID:** " ..id2.."" else _playerID2 = "" end
	local player2 = _playerID2..''.. _postal2 ..''.. _discordID2..''.._steamID2..''.._steamURL2
	_message = player1..'\n'..player2
	end

    discordLog(_message, color, channel)
end)

-- Sending message to the All Logs channel and to the channel it has listed
function discordLog(message, color, channel)
  if Config.AllLogs then
	PerformHttpRequest(Config.webhooks["all"], function(err, text, headers) end, 'POST', json.encode({username = Config.username, embeds = {{["color"] = color, ["author"] = {["name"] = Config.communtiyName,["icon_url"] = Config.communtiyLogo}, ["description"] = "".. message .."",["footer"] = {["text"] = "© ServiceShop - "..os.date("%x %X %p"),["icon_url"] = "https://imgur.com/nOWLulV.png",},}}, avatar_url = Config.avatar}), { ['Content-Type'] = 'application/json' })
  end
	PerformHttpRequest(Config.webhooks[channel], function(err, text, headers) end, 'POST', json.encode({username = Config.username, embeds = {{["color"] = color, ["author"] = {["name"] = Config.communtiyName,["icon_url"] = Config.communtiyLogo}, ["description"] = "".. message .."",["footer"] = {["text"] = "© ServiceShop - "..os.date("%x %X %p"),["icon_url"] = "https://imgur.com/nOWLulV.png",},}}, avatar_url = Config.avatar}), { ['Content-Type'] = 'application/json' })
end

-- Event Handlers

--Remover Dinheiro
dEventHandler('esx:removeMoney', function(source, amount)
	local ids = ExtractIdentifiers(source)
	local postal = getPlayerLocation(source)
	if Config.postal then _postal = "\n**Nearest Postal:** ".. postal .."" else _postal = "" end
	if Config.discordID then if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end else _discordID = "" end
	if Config.steamID then if ids.steam ~= "" then _steamID ="\n**Steam ID:** " ..ids.steam.."" else _steamID = "\n**Steam ID:** N/A" end else _steamID = "" end
	if Config.steamURL then  if ids.steam ~= "" then _steamURL ="\nhttps://steamcommunity.com/profiles/" ..tonumber(ids.steam:gsub("steam:", ""),16).."" else _steamURL = "\n**Steam URL:** N/A" end else _steamID = "" end
	if Config.playerID then _playerID ="\n**Player ID:** " ..source.."" else _playerID = "" end

	discordLog('**' .. sanitize(GetPlayerName(source)) .. '**: ``' .. amount .. '``'.._playerID..''.. _postal ..''.. _discordID..''.._steamID..''.._steamURL..'', Config.removecolor, 'removemoney')
end)

--Depositar Dinheiro
dEventHandler('esx:addMoney', function(source, amount)
	local ids = ExtractIdentifiers(source)
	local postal = getPlayerLocation(source)
	if Config.postal then _postal = "\n**Nearest Postal:** ".. postal .."" else _postal = "" end
	if Config.discordID then if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end else _discordID = "" end
	if Config.steamID then if ids.steam ~= "" then _steamID ="\n**Steam ID:** " ..ids.steam.."" else _steamID = "\n**Steam ID:** N/A" end else _steamID = "" end
	if Config.steamURL then  if ids.steam ~= "" then _steamURL ="\nhttps://steamcommunity.com/profiles/" ..tonumber(ids.steam:gsub("steam:", ""),16).."" else _steamURL = "\n**Steam URL:** N/A" end else _steamID = "" end
	if Config.playerID then _playerID ="\n**Player ID:** " ..source.."" else _playerID = "" end

	discordLog('**' .. sanitize(GetPlayerName(source)) .. '**: ``' .. amount .. '``'.._playerID..''.. _postal ..''.. _discordID..''.._steamID..''.._steamURL..'', Config.addMoneycolor, 'addMoney')
end)

-- Dar fatura
dEventHandler('esx_billing:sendBill', function(source, playerId, amount)
	local ids = ExtractIdentifiers(source)
	local postal = getPlayerLocation(source)
	if Config.postal then _postal = "\n**Nearest Postal:** ".. postal .."" else _postal = "" end
	if Config.discordID then if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end else _discordID = "" end
	if Config.steamID then if ids.steam ~= "" then _steamID ="\n**Steam ID:** " ..ids.steam.."" else _steamID = "\n**Steam ID:** N/A" end else _steamID = "" end
	if Config.steamURL then  if ids.steam ~= "" then _steamURL ="\nhttps://steamcommunity.com/profiles/" ..tonumber(ids.steam:gsub("steam:", ""),16).."" else _steamURL = "\n**Steam URL:** N/A" end else _steamID = "" end
	if Config.playerID then _playerID ="\n**Player ID:** " ..source.."" else _playerID = "" end

	discordLog('**' .. sanitize(GetPlayerName(source)) .. '**: ``' .. amount .. '``'.._playerID..''.. _postal ..''.. _discordID..''.._steamID..''.._steamURL..'', Config.faturacolor, 'fatura')
end)

-- Pagar fatura
dEventHandler('esx_billing:payBill', function(source, playerId, amount)
	local ids = ExtractIdentifiers(source)
	local postal = getPlayerLocation(source)
	if Config.postal then _postal = "\n**Nearest Postal:** ".. postal .."" else _postal = "" end
	if Config.discordID then if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end else _discordID = "" end
	if Config.steamID then if ids.steam ~= "" then _steamID ="\n**Steam ID:** " ..ids.steam.."" else _steamID = "\n**Steam ID:** N/A" end else _steamID = "" end
	if Config.steamURL then  if ids.steam ~= "" then _steamURL ="\nhttps://steamcommunity.com/profiles/" ..tonumber(ids.steam:gsub("steam:", ""),16).."" else _steamURL = "\n**Steam URL:** N/A" end else _steamID = "" end
	if Config.playerID then _playerID ="\n**Player ID:** " ..source.."" else _playerID = "" end

	discordLog('**' .. sanitize(GetPlayerName(source)) .. '**: ``' .. amount .. '``'.._playerID..''.. _postal ..''.. _discordID..''.._steamID..''.._steamURL..'', Config.faturapagacolor, 'faturapaga')
end)

--Transferencia bancaria
dEventHandler('esx_bankerjob:transfer', function(source, from, to, amount)
	local ids = ExtractIdentifiers(source)
	local postal = getPlayerLocation(source)
    local toName = toXPlayer.name
	if Config.postal then _postal = "\n**Nearest Postal:** ".. postal .."" else _postal = "" end
	if Config.discordID then if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end else _discordID = "" end
	if Config.steamID then if ids.steam ~= "" then _steamID ="\n**Steam ID:** " ..ids.steam.."" else _steamID = "\n**Steam ID:** N/A" end else _steamID = "" end
	if Config.steamURL then  if ids.steam ~= "" then _steamURL ="\nhttps://steamcommunity.com/profiles/" ..tonumber(ids.steam:gsub("steam:", ""),16).."" else _steamURL = "\n**Steam URL:** N/A" end else _steamID = "" end
	if Config.playerID then _playerID ="\n**Player ID:** " ..source.."" else _playerID = "" end

	discordLog('**' .. sanitize(GetPlayerName(source)) .. '**: ``' .. amount .. '`` ``' .. toXPlayer.name .. '`` '.._playerID..''.. _postal ..''.. _discordID..''.._steamID..''.._steamURL..'', Config.transferenciaColor, 'transferencia')
end)






-- Getting exports from clientside
RegisterServerEvent('ClientDiscord')
AddEventHandler('ClientDiscord', function(message, id, id2, color, channel)

	local ids = ExtractIdentifiers(id)
	local postal = getPlayerLocation(id)
	if Config.postal then _postal = "\n**Nearest Postal:** ".. postal .."" else _postal = "" end
	if Config.discordID then if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end else _discordID = "" end
	if Config.steamID then if ids.steam ~= "" then _steamID ="\n**Steam ID:** " ..ids.steam.."" else _steamID = "\n**Steam ID:** N/A" end else _steamID = "" end
	if Config.steamURL then  if ids.steam ~= "" then _steamURL ="\nhttps://steamcommunity.com/profiles/" ..tonumber(ids.steam:gsub("steam:", ""),16).."" else _steamURL = "\n**Steam URL:** N/A" end else _steamURL = "" end
	if Config.playerID then _playerID ="\n**Player ID:** " ..id.."" else _playerID = "" end
	local player1 = message..'\n'.._playerID..''.. _postal ..''.. _discordID..''.._steamID..''.._steamURL
	_message = player1

	if id2 ~= 0 then
	local ids2 = ExtractIdentifiers(id2)
	local postal2 = getPlayerLocation(id2)
	if Config.postal then _postal2 = "\n**Nearest Postal:** ".. postal2 .."" else _postal2 = "" end
	if Config.discordID then if ids2.discord ~= "" then _discordID2 ="\n**Discord ID:** <@" ..ids2.discord:gsub("discord:", "")..">" else _discordID2 = "\n**Discord ID:** N/A" end else _discordID2 = "" end
	if Config.steamID then if ids2.steam ~= "" then _steamID2 ="\n**Steam ID:** " ..ids2.steam.."" else _steamID2 = "\n**Steam ID:** N/A" end else _steamID2 = "" end
	if Config.steamURL then  if ids2.steam ~= "" then _steamURL2 ="\nhttps://steamcommunity.com/profiles/" ..tonumber(ids2.steam:gsub("steam:", ""),16).."" else _steamURL2 = "\n**Steam URL:** N/A" end else _steamURL2 = "" end
	if Config.playerID then _playerID2 ="\n**Player ID:** " ..id2.."" else _playerID2 = "" end
	local player2 = _playerID2..''.. _postal2 ..''.. _discordID2..''.._steamID2..''.._steamURL2
	_message = player1..'\n'..player2
	end

   discordLog(_message, color,  channel)
end)

function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)

        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end

function getPlayerLocation(src)

local raw = LoadResourceFile(GetCurrentResourceName(), GetResourceMetadata(GetCurrentResourceName(), 'postal_file'))
local postals = json.decode(raw)
local nearest = nil

local player = src
local ped = GetPlayerPed(player)
local playerCoords = GetEntityCoords(ped)

local x, y = table.unpack(playerCoords)

	local ndm = -1
	local ni = -1
	for i, p in ipairs(postals) do
		local dm = (x - p.x) ^ 2 + (y - p.y) ^ 2
		if ndm == -1 or dm < ndm then
			ni = i
			ndm = dm
		end
	end

	if ni ~= -1 then
		local nd = math.sqrt(ndm)
		nearest = {i = ni, d = nd}
	end
	_nearest = postals[nearest.i].code
	return _nearest
end