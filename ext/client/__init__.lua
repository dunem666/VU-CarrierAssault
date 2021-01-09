ResourceManager:RegisterInstanceLoadHandler(Guid('CA5F4B43-D313-11E0-B4CA-E16EACB9ACAE'), Guid('CE37503F-F1FB-B7B1-CFAD-1F2AA4F8E991'), function(instance)
    if levelName ~= "Levels/MP_017/MP_017" or gameMode ~= "ConquestLarge0" then
		local caAsset = VeniceUICombatAreaAsset(instance)
		caAsset:MakeWritable()
		caAsset.distanceField = nil
		caAsset.surroundingDistanceField = nil
	end
end)

ResourceManager:RegisterInstanceLoadHandler(Guid('7F4D63EA-A17A-454B-9B36-7B82CA2DF4F9'), Guid('B2ABD79F-6224-45A9-BDBB-C23C0C5C8D80'), function(instance)
    if levelName ~= "Levels/MP_017/MP_017" or gameMode ~= "ConquestLarge0" then
		local caAsset = VeniceUICombatAreaAsset(instance)
		caAsset:MakeWritable()
		caAsset.distanceField = nil
		caAsset.surroundingDistanceField = nil
	end
end)

ResourceManager:RegisterInstanceLoadHandler(Guid("74CB44C4-DD2E-4CB2-9914-C2579E68567B"), Guid('9745D59D-CA59-6E72-96C9-5CF44078BA67'), function(instance)
    if levelName ~= "Levels/MP_017/MP_017" or gameMode ~= "ConquestLarge0" then
		instance = InterfaceDescriptorData (instance)
		instance:MakeWritable()
		DataField(instance.fields[6]).value = 'CString "STERN"'
		DataField(instance.fields[2]).value = 'CString "LOWER DECK"'
		DataField(instance.fields[3]).value = 'CString "UPPER DECK"'
		DataField(instance.fields[4]).value = 'CString "RADAR"'
		DataField(instance.fields[5]).value = 'CString "BRIDGE"'
	end
end)