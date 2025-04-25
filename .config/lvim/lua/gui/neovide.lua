if vim.g.neovide then
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_cursor_animation_length = 0.07
  vim.g.neovide_cursor_trail_size = 0.4
  vim.g.neovide_cursor_antialiasing = true

  -- VFX mode and tuning
  vim.g.neovide_cursor_vfx_mode = "sonicboom" -- or "pixiedust", "sonicboom", "railgun", "ripple", etc.
  vim.g.neovide_cursor_vfx_particle_density = 30
  vim.g.neovide_cursor_vfx_particle_speed = 12.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 0.6

  -- Redraw settings
  vim.g.neovide_refresh_rate = 140
  vim.g.neovide_no_idle = true

  -- Optional UI tweaks
  vim.g.neovide_padding_top = 4
  vim.g.neovide_padding_bottom = 4
  vim.g.neovide_padding_left = 8
  vim.g.neovide_padding_right = 8

  -- Optional: transparent background

  -- Screencast
  -- vim.g.neovide_opacity = 0.50
  -- vim.g.transparency = 0.20
  -- vim.g.neovide_background_color = "#2e3440" .. string.format("%x", math.floor(255 * vim.g.transparency))

  -- Regular
  vim.g.neovide_opacity = 0.30
  -- vim.g.transparency = 0.90
  -- vim.g.neovide_background_color = "#2e3440" .. string.format("%x", math.floor(255 * vim.g.transparency))
end
