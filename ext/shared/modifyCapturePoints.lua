function ModifyCapturePoints()

local cqLogicPartitionGuid = Guid('C2AF08B3-F796-4825-B220-3F8467238500')

cpBlueprintCallback = ResourceManager:RegisterInstanceLoadHandler(Guid("6FF061D3-B464-11E0-A8ED-AC9707C24C08"), Guid('0EBE4C00-9840-4D65-49CB-019C23BBC66B'), function(instance)

	if SharedUtils:GetCurrentGameMode() ~= "ConquestLarge0" or SharedUtils:GetLevelName() ~= "Levels/MP_017/MP_017" then
		return
	end
	
	local subWorldData = SubWorldData(ResourceManager:SearchForDataContainer("Levels/MP_017/CQL"))
	subWorldData:MakeWritable()
	
	--CREATE NEW FLAG A
	local cpAObjectData = ReferenceObjectData(ResourceManager:FindInstanceByGuid(cqLogicPartitionGuid, CONFIG.CPA.GUID))
		cpAObjectData:MakeWritable()
		cpAObjectData.blueprintTransform = CONFIG.CPA.POS
		ReplaceCapZone(subWorldData, cpAObjectData, CONFIG.CPA.CAPZONE)
		ClearSpawnPoints(subWorldData, cpAObjectData)
		CreateSpawnPoints(subWorldData, cpAObjectData, CONFIG.CPA.USSPAWNS, "USCP")
		CreateSpawnPoints(subWorldData, cpAObjectData, CONFIG.CPA.RUSPAWNS, "RUCP")

	local cpBObjectData = ReferenceObjectData(ResourceManager:FindInstanceByGuid(cqLogicPartitionGuid, CONFIG.CPB.GUID))
		cpBObjectData:MakeWritable()
		cpBObjectData.blueprintTransform = CONFIG.CPB.POS
		ReplaceCapZone(subWorldData, cpBObjectData, CONFIG.CPB.CAPZONE)
		ClearSpawnPoints(subWorldData, cpBObjectData)
		CreateSpawnPoints(subWorldData, cpBObjectData, CONFIG.CPB.USSPAWNS, "USCP")
		CreateSpawnPoints(subWorldData, cpBObjectData, CONFIG.CPB.RUSPAWNS, "RUCP")
	
	local cpCObjectData = ReferenceObjectData(ResourceManager:FindInstanceByGuid(cqLogicPartitionGuid, CONFIG.CPC.GUID))
		cpCObjectData:MakeWritable()
		cpCObjectData.blueprintTransform = CONFIG.CPC.POS
		ReplaceCapZone(subWorldData, cpCObjectData, CONFIG.CPC.CAPZONE)
		ClearSpawnPoints(subWorldData, cpCObjectData)
		CreateSpawnPoints(subWorldData, cpCObjectData, CONFIG.CPC.USSPAWNS, "USCP")
		CreateSpawnPoints(subWorldData, cpCObjectData, CONFIG.CPC.RUSPAWNS, "RUCP")
		
	local cpDObjectData = ReferenceObjectData(ResourceManager:FindInstanceByGuid(cqLogicPartitionGuid, CONFIG.CPD.GUID))
		cpDObjectData:MakeWritable()
		cpDObjectData.blueprintTransform = CONFIG.CPD.POS
		ReplaceCapZone(subWorldData, cpDObjectData, CONFIG.CPD.CAPZONE)
		ClearSpawnPoints(subWorldData, cpDObjectData)
		CreateSpawnPoints(subWorldData, cpDObjectData, CONFIG.CPD.USSPAWNS, "USCP")
		CreateSpawnPoints(subWorldData, cpDObjectData, CONFIG.CPD.RUSPAWNS, "RUCP")
		
	local cpEObjectData = ReferenceObjectData(ResourceManager:FindInstanceByGuid(cqLogicPartitionGuid, CONFIG.CPE.GUID))
		cpEObjectData:MakeWritable()
		cpEObjectData.blueprintTransform = CONFIG.CPE.POS
		ReplaceCapZone(subWorldData, cpEObjectData, CONFIG.CPE.CAPZONE)
		ClearSpawnPoints(subWorldData, cpEObjectData)
		CreateSpawnPoints(subWorldData, cpEObjectData, CONFIG.CPE.USSPAWNS, "USCP")
		CreateSpawnPoints(subWorldData, cpEObjectData, CONFIG.CPE.RUSPAWNS, "RUCP")

	local usHqObjectData = ReferenceObjectData(ResourceManager:FindInstanceByGuid(cqLogicPartitionGuid, CONFIG.USHQ.GUID))
		usHqObjectData:MakeWritable()
		usHqObjectData.blueprintTransform = CONFIG.USHQ.POS
		ClearSpawnPoints(subWorldData, usHqObjectData)
		CreateSpawnPoints(subWorldData, usHqObjectData, CONFIG.USHQ.SPAWNS, "USHQ")
		
	local ruHqObjectData = ReferenceObjectData(ResourceManager:FindInstanceByGuid(cqLogicPartitionGuid, CONFIG.RUHQ.GUID))
		ruHqObjectData:MakeWritable()
		ruHqObjectData.blueprintTransform = CONFIG.RUHQ.POS
		ClearSpawnPoints(subWorldData, ruHqObjectData)
		CreateSpawnPoints(subWorldData, ruHqObjectData, CONFIG.RUHQ.SPAWNS, "RUHQ")
	
	local usRedzoneVectorData = VolumeVectorShapeData(ResourceManager:FindInstanceByGuid(Guid('B38FA966-3FB4-469B-BCE9-5D48AACC275F'), Guid('F21FE4E0-8D41-4EBC-A25C-3F20AAF7BCBF')))
	usRedzoneVectorData:MakeWritable()
	ReplacePoints(usRedzoneVectorData.points, CONFIG.USPLAYZONE)

	local ruRedzoneVectorData = VolumeVectorShapeData(ResourceManager:FindInstanceByGuid(Guid('DA72945E-3141-4144-89BE-C7F94DDB81E2'), Guid('8B8E7E7E-018F-4024-89D8-F21404E00D77')))
	ruRedzoneVectorData:MakeWritable()
	ReplacePoints(ruRedzoneVectorData.points, CONFIG.RUPLAYZONE)
end)

function ReplaceCapZone(subWorldData, cpObjectData, points)

	for _, connection in pairs(subWorldData.linkConnections) do

		if connection.target:Is("VolumeVectorShapeData") then

			if connection.source == cpObjectData then

				vectorData = VolumeVectorShapeData(connection.target)
				vectorData:MakeWritable()
				
				ReplacePoints(vectorData.points, points)
			end
		end
	end
end

function ReplacePoints(fbArray, luaTable)

	fbArray:clear()

	for _,point in pairs(luaTable) do

		fbArray:add(point)
	end
end

function ClearSpawnPoints(subWorldData, cpObjectData)
	
	for i = #subWorldData.linkConnections, 1, -1 do

		local connection = subWorldData.linkConnections[i]

		if connection.target:Is("AlternateSpawnEntityData") then

			if connection.source == cpObjectData then

				subWorldData.linkConnections:erase(i)
			end
		end
	end
end

local teamAndHash = {
	["USCP"] = { 0, 1751730141 },	--
	["RUCP"] = { 0, 1879290430 },	--
	["USHQ"] = { 1, -2001390482 },	--"AlternativeSpawnPoints"
	["RUHQ"] = { 2, -2001390482 },	--"AlternativeSpawnPoints"
}

function CreateSpawnPoints(subWorldData, cpObjectData, spawns, type)
	
	for _, spawnTransform in pairs(spawns) do

		local alternateSpawn = AlternateSpawnEntityData()
		alternateSpawn.team = teamAndHash[type][1]
		alternateSpawn.transform = spawnTransform
		
		-- The sourceFieldId depends on what team the spawn belongs to. Base spawns have a different one as well.
		local connection = LinkConnection()
		connection.target = alternateSpawn
		connection.source = cpObjectData
		connection.sourceFieldId = teamAndHash[type][2]
		subWorldData.linkConnections:add(connection)
	end
end

end

return ModifyCapturePoints