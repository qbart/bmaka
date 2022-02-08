local galaxyline = require('galaxyline')
local config_helper = require('config_helper')
local onedark = require('config_helper.colors').onedark
local ft = vim.bo.filetype
local throttle = require('config_helper.throttle').throttle_leading
local statusline_segments = require('config_helper.statusline_segments')
-- local gps = require("nvim-gps")

local section = galaxyline.section
galaxyline.short_line_list = { 'defx', 'packager', 'vista' }

local getTreesitterContextThrottled = (function()
  local timer = vim.loop.new_timer()
  local ran_recently = false
  local cached_result = nil
  local throttle_ms = 1000

  local wrapped_fn = function()
    if not ran_recently then
      timer:start(throttle_ms, 0, function()
        ran_recently = false
      end)
      cached_result = statusline_segments.getTreesitterContext()
      ran_recently = true
    end
    return cached_result
  end
  return wrapped_fn
end)()

-- Colors
local colors = {
  bg = onedark.bg0,
  bg_inactive = onedark.bg3,
  fg = onedark.fg,
  fg_focus = '#f8f8f2',
  section_bg = onedark.bg0,
  yellow = onedark.bg_yellow,
  cyan = onedark.cyan,
  green = onedark.green,
  orange = onedark.orange,
  magenta = onedark.purple,
  blue = onedark.blue,
  red = onedark.red,
  black = onedark.black,
}

-- Local helper functions
local buffer_not_empty = function()
  return not config_helper.is_buffer_empty()
end

local mode_color = function()
  local mode_colors = {
    n = colors.green,
    i = colors.blue,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red,
  }

  local color = mode_colors[vim.fn.mode()]

  if color == nil then
    color = colors.red
  end

  return color
end

-- LEFT
section.left = {
  {
    ViMode = {
      provider = function()
        local alias = {
          n = 'NORMAL',
          i = 'INSERT',
          c = 'COMMAND',
          V = 'VISUAL',
          [''] = 'VISUAL',
          v = 'VISUAL',
          R = 'REPLACE',
          t = 'TERMINAL',
        }
        vim.api.nvim_command('hi GalaxyViMode gui=bold guibg='..mode_color())
        local alias_mode = alias[vim.fn.mode()]
        if alias_mode == nil then
          alias_mode = vim.fn.mode()
        end
        return '  '..alias_mode..' '
      end,
      separator = ' ',
      highlight = { colors.bg, colors.section_bg },
      separator_highlight = {colors.bg, colors.section_bg },
    },
  },
  {
    FileIcon = {
      provider = 'FileIcon',
      condition = buffer_not_empty,
      highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg },
    },
  },
  {
    FileName = {
      provider = function ()
        return vim.fn.expand('%f')
      end,
      condition = function()
        return buffer_not_empty() and ft ~= "fzf" and ft~= "NvimTree"
      end,
      highlight = { colors.fg, colors.section_bg },
      separator_highlight = {colors.fg, colors.section_bg },
      separator = ' '
    },
    -- nvimGPS = {
    --   provider = function()
    --     return gps.get_location()
    --   end,
    --   condition = function()
    --     return gps.is_available()
    --   end
    -- }
  },
  -- {
  --   Context = {
  --     provider = getTreesitterContextThrottled,
  --     -- provider = statusline_segments.getTreesitterContext,
  --     condition = function()
  --       -- if string.len(vim.fn.expand('%f')) + 40 > vim.fn.winwidth(0) then
  --       --   return false
  --       -- end
  --       return buffer_not_empty() and ft ~= "fzf" and ft~= "NvimTree"
  --     end,
  --     highlight = { colors.fg, colors.section_bg },
  --     separator_highlight = {colors.fg, colors.section_bg },
  --     separator = ' '
  --   }
  -- }
}

-- RIGHT
section.right = {
  {
    Flags = {
      provider = function()
        local flags = {}
        if string.len(vim.fn["gutentags#statusline"]()) > 0 then table.insert(flags, ' ♺') end
        if vim.g.ale_linting then table.insert(flags, 'Linting') end
        if vim.g.ale_fixing then table.insert(flags, 'Fixing') end

        return table.concat(flags, ' ')..' '
      end,
      separator = ' ',
      condition = buffer_not_empty,
      highlight = { colors.yellow, colors.section_bg },
      separator_highlight = { colors.black, colors.section_bg },
    }
  },
  {
    CustomDiagnosticError = {
      provider = function()
        local errors = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR})
        local count = table.getn(errors)
        if count > 0 then
          return count
        else
          return ''
        end
      end,
      condition = buffer_not_empty,
      icon = '   ',
      highlight = {colors.red, colors.section_bg },
    },
  },
  {
    CustomDiagnosticWarn = {
      provider = function()
        local warns = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN})
        local count = table.getn(warns)
        if count > 0 then
          return count
        else
          return ''
        end
      end,
      icon = '   ',
      highlight = {colors.orange, colors.section_bg },
    },
  },
  {
    CustomDiagnosticInfo = {
      provider = function()
        local hints = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT})
        local info = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO})
        local count = table.getn(hints) + table.getn(info)
        if count > 0 then
          return count
        else
          return ''
        end
      end,
      icon = '   ',
      highlight = {colors.blue, colors.section_bg },
    },
  },
  {
    GitInfo = {
      provider = statusline_segments.getGitInfo,
      condition = buffer_not_empty,
      highlight = {colors.fg_active,colors.bg_inactive},
      separator_highlight = { colors.bg, colors.bg },
      separator=' '
    }
  },
  {
    LineColumn = {
      provider = function ()
        vim.api.nvim_command('hi GalaxyLineColumn guibg='..mode_color())
        local max_lines = vim.fn.line('$')
        local line = vim.fn.line('.')
        local column = vim.fn.col('.')
        return string.format("  %3d/%d:%2d ", line, max_lines, column)
      end,
      highlight = { colors.black, mode_color() },
    }
  }
}

section.short_line_left = {
  {
    SpacerInactive = {
      provider = function()
        return '  '
      end,
      highlight = { colors.fg, colors.bg_inactive },
      separator_highlight = {colors.fg, colors.bg_inactive },
    }
  },
  {
    FileIconInactive = {
      provider = 'FileIcon',
      condition = buffer_not_empty,
      separator = ' ',
      highlight = { colors.fg, colors.bg_inactive },
      separator_highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color,  colors.bg_inactive },
    }
  },
  {
    FileNameInactive = {
      provider = function ()
        return vim.fn.expand('%f')
      end,
      separator = ' ',
      condition = buffer_not_empty,
      highlight = { colors.fg, colors.bg_inactive },
      separator_highlight = { colors.fg, colors.bg_inactive },
    }
  },
}

section.short_line_right = {
  {
    GitInfoInactive = {
      provider = statusline_segments.getGitInfo,
      condition = buffer_not_empty,
      highlight = {colors.fg_active,colors.bg_inactive},
      separator_highlight = { colors.fg, colors.bg_inactive },
    }
  },
  {
    LineColumnInactive= {
      provider = function ()
        local max_lines = vim.fn.line('$')
        local line = vim.fn.line('.')
        local column = vim.fn.col('.')
        return string.format("  %3d/%d:%2d ", line, max_lines, column)
      end,
      highlight = { colors.fg, colors.bg_inactive },
    }
  }
}

galaxyline.load_galaxyline()
vim.cmd[[
let g:ale_linting = v:false
let g:ale_fixing = v:false

augroup galaxyline_triggers
autocmd!
autocmd User GutentagsUpdating lua require("galaxyline").load_galaxyline()
autocmd User GutentagsUpdated lua require("galaxyline").load_galaxyline()
augroup END
]]
