BridgeSkills = {}

--   HOW TO ADD A SKILL:
--
--   BridgeSkills['your_skill_id'] = {
--       name       = 'Display Name',
--       cost       = 3,               -- SP cost
--       category   = 'civilian',      -- identity | survival | combat | civilian
--                                     -- OR any new string for a new category
--       desc       = 'Description shown in the purchase panel.',
--       effects    = { 'Tag 1', 'Tag 2' },   -- shown as pills in the panel
--       icon       = '<path d="..."/>',       -- SVG path, viewBox 0 0 24 24
--                                             -- get icons at fonts.google.com/icons
--                                             -- click icon > Android > copy path
--
--       -- Optional: runs on the SERVER when the player purchases this skill
--       onPurchaseServer = function(src, xPlayer)
--           -- src     = player server id
--           -- xPlayer = ESX player object
--           -- Example: xPlayer.addInventoryItem('lockpick', 1)
--       end,
--
--       -- Optional: runs on the CLIENT when the player purchases this skill
--       onPurchaseClient = function()
--           -- Example: TriggerEvent('myresource:skillUnlocked')
--       end,
--   }
--


--EXAMPLE SKILLS (delete or edit these)

BridgeSkills['lockpicking'] = {
    name     = 'Lockpicking',
    cost     = 4,
    category = 'identity',
    desc     = 'Unlocks the /lockpick command. Allows you to pick locks on doors and vehicles.',
    effects  = { 'Unlocks /lockpick', '+30% success rate' },
    icon     = '<path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zm-6 9c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zm3.1-9H8.9V6c0-1.71 1.39-3.1 3.1-3.1 1.71 0 3.1 1.39 3.1 3.1v2z"/>',
    onPurchaseServer = function(src, xPlayer)
        -- Give a lockpick item on purchase
        -- xPlayer.addInventoryItem('lockpick', 1)
        print('[A Bridge] ' .. xPlayer.getName() .. ' unlocked Lockpicking')
    end,
    onPurchaseClient = function()
        -- Notify another resource that this skill was unlocked
        -- TriggerEvent('lockpicking:skillGranted')
    end,
}

BridgeSkills['pickpocket'] = {
    name     = 'Pickpocket',
    cost     = 3,
    category = 'identity',
    desc     = 'Unlocks the /pickpocket command. Target nearby players to steal cash or small items.',
    effects  = { 'Unlocks /pickpocket', '25% base success rate' },
    icon     = '<path d="M9 11.24V7.5C9 6.12 10.12 5 11.5 5S14 6.12 14 7.5v3.74c1.21-.81 2-2.18 2-3.74C16 5.01 13.99 3 11.5 3S7 5.01 7 7.5c0 1.56.79 2.93 2 3.74zm9.84 4.63l-4.54-2.26c-.17-.07-.35-.11-.54-.11H13v-6c0-.83-.67-1.5-1.5-1.5S10 6.67 10 7.5v10.74l-3.43-.72c-.08-.01-.15-.03-.24-.03-.31 0-.59.13-.79.33l-.79.8 4.94 4.94c.27.27.65.44 1.06.44h6.79c.75 0 1.33-.55 1.44-1.28l.75-5.27c.01-.07.02-.14.02-.2 0-.62-.38-1.16-.91-1.38z"/>',
    onPurchaseServer = function(src, xPlayer)
        xPlayer.setMetadata('can_pickpocket', true)
    end,
}

BridgeSkills['hacker'] = {
    name     = 'Hacker',
    cost     = 6,
    category = 'civilian',
    desc     = 'Unlocks advanced hacking minigames and ATM skimming abilities.',
    effects  = { 'Unlocks /hack', 'ATM skimming', '+15% hack speed' },
    icon     = '<path d="M20 18c1.1 0 1.99-.9 1.99-2L22 6c0-1.1-.9-2-2-2H4c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2H0v2h24v-2h-4zM4 6h16v10H4V6z"/><path d="M6 10h2v2H6zm3 0h2v2H9zm3 0h2v2h-2z"/>',
    onPurchaseServer = function(src, xPlayer)
        xPlayer.setMetadata('hacker', true)
    end,
}

-- Example of a CUSTOM CATEGORY 
-- Using a category string that doesn't exist yet
-- will automatically create a new section in the skill tree.

BridgeSkills['medic_training'] = {
    name     = 'Medic Training',
    cost     = 5,
    category = 'medical',           -- new category gets created automatically
    desc     = 'Unlocks the ability to use advanced medical equipment and revive downed players.',
    effects  = { 'Unlocks /revive', '+40% heal speed', 'Use medkits on others' },
    icon     = '<path d="M19 3H5c-1.1 0-1.99.9-1.99 2L3 19c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-1 11h-4v4h-4v-4H6v-4h4V6h4v4h4v4z"/>',
    onPurchaseServer = function(src, xPlayer)
        xPlayer.setMetadata('medic_trained', true)
    end,
    onPurchaseClient = function()
        TriggerEvent('medical:trainingUnlocked')
    end,
}
