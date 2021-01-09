
require("__shared/_CONFIG")

local ModifyCapturePoints = require('__shared/modifyCapturePoints')

Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)
	
	local levelDestroyEvent = Events:Subscribe('Level:Destroy', OnLevelDestroy)

	-- Don't do anything if the wrong level/gamemode is loaded
	if levelName ~= "Levels/MP_017/MP_017" or gameMode ~= "ConquestLarge0" then
		levelDestroyEvent:Unsubscribe()
		return
	end
	
	-- Change flag positions
	ModifyCapturePoints()
	
end)

-- Deregistering, uninstalling and uninstalling in case the next level isn't MP_Subway
function OnLevelDestroy()

    -- entityResourceEvent:Unsubscribe()
    -- bundleMounterEvent:Unsubscribe()
	-- bundleHook:Uninstall()
    -- subWorldDataCallback:Deregister()
    -- cpBlueprintCallback:Deregister()
	
	subWorldDataCallback = nil
	entityResourceEvent = nil
	cpBlueprintCallback = nil
	bundleHook = nil
	
end


--VEHICLE PLACEMENTS BOATS AND LAND
CONFIG.BOATS = {
    USBOATSPAWNS = {
        {
        --BOAT 1 US DONE
        Partition = 'B38FA966-3FB4-469B-BCE9-5D48AACC275F',
        Instance = '679C7228-74E1-4556-A91C-25430BC096E9',
        AltInstance = '48C9158F-DE1C-5B10-C3A0-F96C205D783C',
        Transform = LinearTransform(
            Vec3(1.000000, 0.000000, 0.000000),
            Vec3(0.000000, 1.000000, 0.000000),
            Vec3(0.000000, 0.000000, 1.000000),
            Vec3(-140.679840, 67.5, 191.913666))
        },
        --BOAT 2 US DONE
        {
        Partition = 'B38FA966-3FB4-469B-BCE9-5D48AACC275F',
        Instance = '429F6585-AF11-4658-AA0A-9BCC644E7E54',
        AltInstance = '0EC2857F-C785-D3B7-76F7-D3E6157D7C6C',
        Transform = LinearTransform(
            Vec3(1.000000, 0.000000, 0.000000),
            Vec3(0.000000, 1.000000, 0.000000),
            Vec3(0.000000, 0.000000, 1.000000),
            Vec3(-118.547974, 67.5, 213.540741))
        },
        -- BOAT 3 US DONE
        {
        Partition = 'B38FA966-3FB4-469B-BCE9-5D48AACC275F',
        Instance = '579793A9-507A-4404-887A-275FE53A90C2',
        AltInstance = '9AEE4697-2FD0-6147-5981-7E04E568E246',
        Transform = LinearTransform(
            Vec3(1.000000, 0.000000, 0.000000),
            Vec3(0.000000, 1.000000, 0.000000),
            Vec3(0.000000, 0.000000, 1.000000),
            Vec3(-126.765755, 67.5, 220.794601))
        },
		-- US AAV DONE
        {
        Partition = 'B38FA966-3FB4-469B-BCE9-5D48AACC275F',
        Instance = '411E5974-36CE-44B1-ACD1-C0A129177526',
        AltInstance = '3293E211-13BD-B32F-E3F3-668370EFB695',
        Transform = LinearTransform(
            Vec3(0.955337, 0.000000, 0.295520),
            Vec3(-0.000000, 1.000000, 0.000000),
            Vec3(-0.295520, -0.000000, 0.955337),
            Vec3(-127.193604, 67.527214, 229.717926))
        },
		-- US LAV DONE
        {
        Partition = 'B38FA966-3FB4-469B-BCE9-5D48AACC275F',
        Instance = '99F4AA56-1C11-4AC9-A2B3-7B8DE14FA8BD',
        AltInstance = '756A0103-3349-4961-4ED0-60549C4B38B3',
        Transform = LinearTransform(
            Vec3(0.621610, 0.000000, 0.783327),
            Vec3(-0.000000, 1.000000, -0.000000),
            Vec3(-0.783327, -0.000000, 0.621610),
            Vec3(-82.458549, 70.452515, 183.381134))
        },
		-- RU BMP DONE
        {
        Partition = 'DA72945E-3141-4144-89BE-C7F94DDB81E2',
        Instance = '6F494074-2D3B-4232-A95F-3998192F60FD',
        AltInstance = '4E63D8AF-C2AC-B72F-A53C-3ABA8E19A701',
        Transform = LinearTransform(
            Vec3(1.000000, 0.000000, 0.000000),
            Vec3(0.000000, 1.000000, 0.000000),
            Vec3(0.000000, 0.000000, 1.000000),
            Vec3(-282.382202, 65.735287, 791.371643))
        },
		-- BOAT 1 RU
        {
        Partition = 'DA72945E-3141-4144-89BE-C7F94DDB81E2',
        Instance = 'EB5B98D2-081E-4A3E-A182-76A6D95242BC',
        AltInstance = 'AB834445-047B-5A31-6D3C-9DE949D2DAAA',
        Transform = LinearTransform(
            Vec3(1.000000, 0.000000, 0.000000),
            Vec3(0.000000, 1.000000, 0.000000),
            Vec3(0.000000, 0.000000, 1.000000),
            Vec3(-276.392395, 60.735279, 806.099976))
        }
    }
}

CONFIG.AIR = {
    AIRSPAWNS = {
		-- RU JET
        {
        Partition = 'DA72945E-3141-4144-89BE-C7F94DDB81E2',
        Instance = 'A05433EA-9FD3-476D-9289-C94084BCBBFD',
        Transform = LinearTransform(
            Vec3(-0.896759, 0.000000, -0.442519),
            Vec3(0.000000, 1.000000, -0.000000),
            Vec3(0.442519, -0.000000, -0.896759),
            Vec3(-305.908875, 900.735287, 849.528687))
        },
		-- US JET
        {
        Partition = 'B38FA966-3FB4-469B-BCE9-5D48AACC275F',
        Instance = '86D00251-82A7-4333-9747-9F97720E160E',
        Transform = LinearTransform(
            Vec3(0.955337, 0.000000, 0.295520),
            Vec3(-0.000000, 1.000000, 0.000000),
            Vec3(-0.295520, -0.000000, 0.955337),
            Vec3(-34.147846, 900.685822, 130.274689))
        },
		-- RU HAVOK
        {
        Partition = 'DA72945E-3141-4144-89BE-C7F94DDB81E2',
        Instance = 'BF93AC0A-A0E1-4301-8D67-D48A2146BF45',
        Transform = LinearTransform(
            Vec3(-0.896759, 0.000000, -0.442519),
            Vec3(0.000000, 1.000000, -0.000000),
            Vec3(0.442519, -0.000000, -0.896759),
            Vec3(-305.908875, 800.735287, 849.528687))
        },
		-- US VIPER
        {
        Partition = 'B38FA966-3FB4-469B-BCE9-5D48AACC275F',
        Instance = 'F453BBC0-5BBF-407A-9070-41C0084C08B3',
        Transform = LinearTransform(
            Vec3(0.955337, 0.000000, 0.295520),
            Vec3(-0.000000, 1.000000, 0.000000),
            Vec3(-0.295520, -0.000000, 0.955337),
            Vec3(-34.147846, 800.685822, 130.274689))
        },
		-- US CRAM
        {
        Partition = 'B38FA966-3FB4-469B-BCE9-5D48AACC275F',
        Instance = 'D63F000B-CC7C-4FAE-B3BC-B65C6CE30CA1',
        Transform = LinearTransform(
            Vec3(0.825336, 0.000000, 0.564642),
            Vec3(-0.000000, 1.000000, 0.000000),
            Vec3(-0.564642, -0.000000, 0.825336),
            Vec3(-150.575104, 92.905960, 188.451385))
        },
		-- US VENOM
        {
        Partition = 'B38FA966-3FB4-469B-BCE9-5D48AACC275F',
        Instance = '270F5DD2-A95A-4A66-AEA8-567BD1D203DB',
        Transform = LinearTransform(
            Vec3(0.825336, 0.000000, -0.564642),
            Vec3(-0.000000, 1.000000, 0.000000),
            Vec3(0.564642, -0.000000, 0.825336),
            Vec3(-206.273544, 70.434402, 197.124069))
        }
	}
}	
		
		
--CHANGE BOATS AND LAND
for _,team in pairs(CONFIG.BOATS) do
    for boat=1, #team do
        ResourceManager:RegisterInstanceLoadHandler(Guid(team[boat].Partition), Guid(team[boat].Instance), function(instance)
            local boatSpawn = VehicleSpawnReferenceObjectData(instance)
            boatSpawn:MakeWritable()
            boatSpawn.blueprintTransform = team[boat].Transform
        end)

        ResourceManager:RegisterInstanceLoadHandler(Guid(team[boat].Partition), Guid(team[boat].AltInstance), function(instance)
            local altBoatSpawn = AlternateSpawnEntityData(instance)
            altBoatSpawn:MakeWritable()
            altBoatSpawn.transform = team[boat].Transform
        end)
    end
end

for _,team in pairs(CONFIG.AIR) do
    for air=1, #team do
        ResourceManager:RegisterInstanceLoadHandler(Guid(team[air].Partition), Guid(team[air].Instance), function(instance)
            local airSpawn = ReferenceObjectData(instance)
            airSpawn:MakeWritable()
            airSpawn.blueprintTransform = team[air].Transform
        end)
    end
end