SMODS.Joker {
    key = "f_shennong",
    name = "Shennong",
    pos = { x = 5, y = 4 },
    soul_pos = { x = 5, y = 5 },
    cost = 20,
    rarity = 4,
    unlocked = false,
    atlas = "joker",
    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.4,
                        func = function()
                            if G.deck and G.deck.cards and #G.deck.cards > 0 then
                                G.deck.cards[1]:set_ability(G.P_CENTERS.m_lucky)
                            end
                            return true
                        end
                    }))
                    return true
                end
            }))
        end
        if context.fix_probability and G.GAME.blind.boss then
            return {
                numerator = context.denominator
            }
        end
    end
}