BundlesOfFun.Voucher {
    key = "dark_alley",
    name = "Dark Alley",
    bundle = "coupons",
    pos = { x = 0, y = 0 },
    atlas = "voucher",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "e_negative_consumable", set = "Edition", config = { extra = 1 } }
    end,
    redeem = function(self, card, area) -- this is done this way to make sure that this does not affect ghost deck
        if G.GAME.spectral_rate < 1 then
            G.GAME.spectral_rate = 1
        end
    end,
    unredeem = function(self, card, area)
        if G.GAME.spectral_rate == 1 then
            G.GAME.spectral_rate = 0
        end
    end
}