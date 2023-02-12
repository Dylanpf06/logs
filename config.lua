--------------------------
--  ServiceShop         --
--      Logs            --
--------------------------

Config = {}

Config.AllLogs = true											
Config.postal = true  								
Config.username = "Logs_RiseRP"                                                                                             --Nome do Bot
Config.avatar = "https://cdn.discordapp.com/attachments/909254901111078964/956527312235536464/RiseRP_Logo.png"	            -- Avatar do Bot
Config.communtiyName = "RiseRP"			
Config.communtiyLogo = "https://cdn.discordapp.com/attachments/909254901111078964/956527312235536464/RiseRP_Logo.png"		-- Icon da embed


-- Config.weaponLog = true  			-- set to false to disable the shooting weapon logs
-- Config.weaponLogDelay = 1000		-- delay to wait after someone fired a weapon to check again in ms (put to 0 to disable) Best to keep this at atleast 1000

Config.playerID = true				
Config.steamID = true				
Config.steamURL = true				
Config.discordID = true				

-- Mudar Cores das logs  
Config.removecolor = "3863105" 		-- Player Connecting
Config.addMoneycolor = "15874618"		-- Player Disconnected
Config.faturacolor = "10592673"		-- Chat Message
Config.faturapagacolor = "10373"		-- Shooting a weapon
Config.transferenciaColor = "000000"		-- Player Died
Config.resourceColor = "15461951"	-- Resource Stopped/Started



Config.webhooks = {
    all = "https://discord.com/api/webhooks/1074297831868858438/wFn4ZVMy-gjFVyLO-_h-D_9QWJgmOU7hCGblGBV95zKw1GFXODvpWqBuegBsU63o4v5c",
	removemoney = "https://discord.com/api/webhooks/1074297831868858438/wFn4ZVMy-gjFVyLO-_h-D_9QWJgmOU7hCGblGBV95zKw1GFXODvpWqBuegBsU63o4v5c",
	addMoney = "https://discord.com/api/webhooks/1074297831868858438/wFn4ZVMy-gjFVyLO-_h-D_9QWJgmOU7hCGblGBV95zKw1GFXODvpWqBuegBsU63o4v5c",
	fatura = "https://discord.com/api/webhooks/1074297831868858438/wFn4ZVMy-gjFVyLO-_h-D_9QWJgmOU7hCGblGBV95zKw1GFXODvpWqBuegBsU63o4v5c",
	faturapaga = "https://discord.com/api/webhooks/1074297831868858438/wFn4ZVMy-gjFVyLO-_h-D_9QWJgmOU7hCGblGBV95zKw1GFXODvpWqBuegBsU63o4v5c",
	transferencia = "https://discord.com/api/webhooks/1074297831868858438/wFn4ZVMy-gjFVyLO-_h-D_9QWJgmOU7hCGblGBV95zKw1GFXODvpWqBuegBsU63o4v5c",
	-- shooting = "https://discord.com/api/webhooks/1059074219062853682/TTlVDeDjcS0lPBOxoofcCaGifyL-iQ-Qx2SHiYSuh4SutZatq_1ZZXGZ5OWHUNZ2A6zF",
	-- resources = "https://discord.com/api/webhooks/1059074743766110258/0jimqMB8N5Rl57LR2_LIlkDYI9QBQkaIrHbDX6-Gjb2tcSNksMWDw77HTHgdKGyId0fj",
	-- gps = "https://discord.com/api/webhooks/1059162561255313519/VPP4aDJxsHx_BMTWJ-q8hFDZmXjC22dnXjeLagLpg2x-67jgyQZ5ufTBQtMw3sfcg4Vu",
}


