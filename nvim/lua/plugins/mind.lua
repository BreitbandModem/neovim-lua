-- note taking
return {
  -- 'phaazon/mind.nvim',
  -- branch = 'v2.2',
  'BreitbandModem/mind.nvim',
  branch = 'feature/default-node-icon',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    persistence = {
      state_path = "~/gdrive/mind.nvim/mind.json",
      data_dir = "~/gdrive/mind.nvim/data",
    },
    ui = {
      default_icon = '󰄱 ',
    },
  },
}
