local jumpCooldown = 0
local isJumpDisabled = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- Change the wait time to 0 for more responsiveness
        
        -- Ragdoll player if jumping while jump disabled
        if isJumpDisabled and jumpCooldown > 0 and IsPedJumping(PlayerPedId()) then
            ApplyForceToEntity(PlayerPedId(), 3, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, true, true, true, true, true, true)
            Citizen.Wait(50) -- Wait for the force to be applied before ragdolling
            
            -- Ragdoll with parameters from the config file
            SetPedToRagdoll(PlayerPedId(), Config.ragdollTime, Config.ragdollTime, 0, true, true, false)
            jumpCooldown = 0
        end
        
        -- Disable jump and start cooldown
        if not isJumpDisabled and IsPedJumping(PlayerPedId()) then
            isJumpDisabled = true
            jumpCooldown = Config.jumpCooldown
            Citizen.Wait(1200) -- Wait before re-enabling jump to ensure player lands
        end
        
        -- Cooldown countdown
        if jumpCooldown > 0 then
            jumpCooldown = jumpCooldown - 1
        else
            -- Reset jump disable
            if isJumpDisabled then
                jumpCooldown = 0
                isJumpDisabled = false
            end
        end
    end
end)
