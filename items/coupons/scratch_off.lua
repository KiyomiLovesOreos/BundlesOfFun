BundlesOfFun.Voucher {
    key = "scratch_off",
    name = "Scratch-Off",
    bundle = "coupons",
    atlas = "voucher",
    pos = { x = 2, y = 0 },
    redeem = function(self, card, area)
        G.GAME.bof_scratch_off_shop_reroll_count = 0
    end
}