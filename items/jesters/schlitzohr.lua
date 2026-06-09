SMODS.Joker({
	key = "j_schlitzohr",
	name = "Schlitzohr",
	config = { extra = { card = nil } },
	pos = { x = 4, y = 2 },
	cost = 8,
	rarity = 3,
	blueprint_compat = true,
	atlas = "joker",
	calculate = function(self, card, context)
		if context.before then
			if context.blueprint then
				local available_cards = {}
				for _, c in ipairs(context.full_hand) do
					if c.unique_val ~= card.ability.extra.card then
						table.insert(available_cards, c)
					end
				end
				if #available_cards > 0 then
					context.blueprint_card.ability.bof_schlitzohr_card = pseudorandom_element(available_cards, self.key).unique_val
				else
					context.blueprint_card.ability.bof_schlitzohr_card = nil
				end
				return nil
			end
			card.ability.extra.card = pseudorandom_element(context.full_hand, self.key).unique_val
		end
		if context.destroy_card and (context.cardarea == G.play or context.cardarea == "unscored") and G.GAME.current_round.hands_left > 0 then
			if (context.blueprint and context.blueprint_card.ability.bof_schlitzohr_card and context.destroy_card.unique_val == context.blueprint_card.ability.bof_schlitzohr_card) or context.destroy_card.unique_val == card.ability.extra.card then
				local card = context.blueprint_card or card
				return {
					remove = true,
					func = function()
						G.E_MANAGER:add_event(Event({
							func = function()
								card:juice_up(0.3, 0.5)
								return true
							end
						}))
					end
				}
			end
		end
	end
})