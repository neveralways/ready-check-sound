local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("READY_CHECK")

local function fileExists(filePath)
    local file = io.open(filePath, "r")
    if file then
        file:close()
        return true
    else
        return false
    end
end

frame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "ReadyCheckSound" then
        MuteSoundFile(567478)
    elseif event == "READY_CHECK" then
        local customSoundPath = "Interface\\AddOns\\ReadyCheckSound\\sound.ogg"
        if PlaySoundFile(customSoundPath, "Master") then
            PlaySoundFile(customSoundPath, "Master")
        else
            PlaySoundFile(567478, "Master")
        end
    end
end)