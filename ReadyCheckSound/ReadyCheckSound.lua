local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("READY_CHECK")
frame:RegisterEvent("LFG_PROPOSAL_SHOW")
frame:RegisterEvent("LFG_ROLE_CHECK_SHOW")


local function PlayDefaultSound(sound_id)
    UnmuteSoundFile(sound_id)
    PlaySoundFile(sound_id, "Master")
    MuteSoundFile(sound_id)
end

frame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "ReadyCheckSound" then
        MuteSoundFile(567478)
    elseif event == "READY_CHECK" then
        local customSoundPath = "Interface\\AddOns\\ReadyCheckSound\\sound.ogg"
        if PlaySoundFile(customSoundPath, "Master") then
            PlaySoundFile(customSoundPath, "Master")
        else
            PlayDefaultSound(567478)
        end
    elseif event == "LFG_PROPOSAL_SHOW" then
        PlayDefaultSound(567478)
    elseif event == "LFG_ROLE_CHECK_SHOW" then
        PlayDefaultSound(567478)
    end
end)