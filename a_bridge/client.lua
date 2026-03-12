AddEventHandler('a_skills:collectSkills', function()
    for skillId, skill in pairs(BridgeSkills) do
        exports['a_skills']:registerSkill({
            id            = skillId,
            name          = skill.name          or skillId,
            cost          = skill.cost          or 1,
            category      = skill.category      or 'civilian',
            categoryLabel = skill.categoryLabel or nil,
            categoryColor = skill.categoryColor or nil,
            desc          = skill.desc          or '',
            effects       = skill.effects       or {},
            icon          = skill.icon          or '',
            onPurchase    = skill.onPurchaseClient or nil,
        })
    end
end)