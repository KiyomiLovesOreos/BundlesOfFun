SMODS.Joker({
	key = "j_schlitzohr",
	name = "Schlitzohr",
	pos = { x = 4, y = 2 },
	cost = 8,
	rarity = 3,
	blueprint_compat = true,
	atlas = "joker",
	calculate = function(self, card, context)
		if context.destroy_card and (context.cardarea == G.play or context.cardarea == "unscored") and G.GAME.current_round.hands_left > 0 then
			if not G.GAME.bof_schlitzohr_destroyed then
				if not G.GAME.bof_schlitzohr_target then
					G.GAME.bof_schlitzohr_target = pseudorandom_element(G.play.cards, pseudoseed("j_bof_j_schlitzohr"))
				end
				if context.destroy_card == G.GAME.bof_schlitzohr_target then
					G.GAME.bof_schlitzohr_destroyed = true
					G.GAME.bof_schlitzohr_target = nil
					return {
						remove = true
					}
				end
			end
		end
		if context.after then
			G.GAME.bof_schlitzohr_target = nil
			G.GAME.bof_schlitzohr_destroyed = nil
		end
	end
})