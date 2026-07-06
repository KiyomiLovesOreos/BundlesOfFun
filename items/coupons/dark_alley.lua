BundlesOfFun.Voucher {
    key = "dark_alley",
    name = "Dark Alley",
    bundle = "coupons",
    config = { extra = { spectral_rate = 1 } },
    pos = { x = 0, y = 0 },
    atlas = "voucher",
    redeem = function(self, card, area)
        if G.GAME.spectral_rate < self.config.extra.spectral_rate then
            G.GAME.spectral_rate = self.config.extra.spectral_rate
        end
    end
}