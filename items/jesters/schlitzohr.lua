SMODS.Joker({
	key = "j_schlitzohr",
	name = "Schlitzohr",
	config = { extra = { cards = 4 } },
	pos = { x = 4, y = 2 },
	cost = 6,
	rarity = 2,
	blueprint_compat = false,
	atlas = "joker",
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.cards } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind then
			G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				local card = context.blueprint_card or card
				play_sound("tarot1")
				card:juice_up(0.3, 0.5)
				return true
			end
			}))
			for i = 1, card.ability.extra.cards do
				local percent = 1.15 - (i - 0.999) / (card.ability.extra.cards - 0.998) * 0.3
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.15,
					func = function()
						play_sound("card1", percent)
						return true
					end
				}))
			end
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.4,
				func = function()
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.15,
						func = function()
							if G.deck and G.deck.cards then
								local sorted_cards = {}
								for _, c in ipairs(G.deck.cards) do
									table.insert(sorted_cards, c)
								end
								table.sort(sorted_cards, function(a, b) return (a:get_id() or 0) < (b:get_id() or 0) end)
								local target_cards = {}
								for i = 1, math.min(card.ability.extra.cards, #sorted_cards) do
									table.insert(target_cards, sorted_cards[i])
								end
								for i, target_card in ipairs(target_cards) do
									G.E_MANAGER:add_event(Event({
										trigger = "after",
										delay = 0.15,
										func = function()
											local _rank = pseudorandom_element(SMODS.Ranks, "random_rank")
											assert(SMODS.change_base(target_card, nil, _rank.key))
											return true
										end
									}))
								end
							end
							return true
						end
					}))
					for i = 1, card.ability.extra.cards do
						local percent = 0.85 + (i - 0.999) / (card.ability.extra.cards - 0.998) * 0.3
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.15,
							func = function()
								play_sound("tarot2", percent, 0.6)
								return true
							end
						}))
					end
					return true
				end
			}))
		end
	end
})