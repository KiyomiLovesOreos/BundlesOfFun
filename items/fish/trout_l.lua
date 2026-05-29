SMODS.Consumable {
    key = "i_trout_l",
    name = "Rainbow Trout Legendary",
    set = "Fish",
    pools = { ["fish_l"] = true },
    -- pos = { x = 0, y = 0 },
    config = {
        extra = {
            
        }
    },
    cost = 4,
    atlas = "placeholder",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,
    add_to_deck = function(self, card, deck)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slots
                return true
            end
        }))
    end,
    calculate = function(self, card, context)

    end,
    remove_from_deck = function(self, card, deck)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.slots
                return true
            end
        }))
    end
}