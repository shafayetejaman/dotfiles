return {
  "chrisgrieser/nvim-early-retirement",
  config = true,
  event = "VeryLazy",
  defaultOpts = {
    -- If a buffer has been inactive for this many minutes, close it.
    retirementAgeMins = 5,
  }
}
