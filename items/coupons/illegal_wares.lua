BundlesOfFun.Voucher {
    key = "illegal_wares",
    name = "Illegal Wares",
    bundle = "coupons",
    requires = { "v_bof_dark_alley" },
    config = { extra = { spectral_rate = 3 } },
    pos = { x = 0, y = 1 },
    unlocked = false,
    atlas = "voucher",
    redeem = function(self, card, area)
        if G.GAME.spectral_rate < self.config.extra.spectral_rate then
            G.GAME.spectral_rate = self.config.extra.spectral_rate
        end
    end,
    check_for_unlock = function(self, args)
        if G.consumeables and G.consumeables.cards then
            local count = 0
            for _, c in ipairs(G.consumeables.cards) do
                if c.ability and c.ability.set == "Spectral" then
                    count = count + 1
                    if count >= 3 then
                        return true
                    end
                end
            end
        end
    end
}