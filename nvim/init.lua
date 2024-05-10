-- Indicate via environment variable that we inside vim
vim.fn.setenv("INSIDE_NVIM", 1)

-- How relative line numbers and min number colomn width
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

-- Tab autoindent stuff
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Always show tabs
vim.opt.showtabline = 2

-- Hide search counter and the search end messages
vim.opt.shortmess:append('Ss')

-- Show spaces, tabs and trail whitespace
vim.opt.list = true
vim.opt.listchars = {
  space  = "ˑ",
  tab   = "»—",
  trail = "■"}

-- Set tab autocomplete schema
vim.opt.wildmode="full"

-- Set the clipboard as the default register
vim.opt.clipboard="unnamedplus"

-- Disable swap file
vim.opt.swapfile = false

-- Disable backup files
vim.opt.backup = false
vim.opt.writebackup = false

-- Disable mode show (lightline plugin shows mode now)
vim.opt.showmode = false

-- Set input delay
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 100

-- Set width exceeding line hint
vim.opt.colorcolumn = "81"

-- Words aren't divided on line break
vim.opt.wrap = true
vim.opt.linebreak = true

-- Set how often file is written to disk. Affects gitgutter plugin update time
vim.opt.updatetime = 100

-- Set light colorscheme
vim.opt.background = "light"

-- Always show sign column
vim.opt.signcolumn = "yes:1"

-- Disable colorcolumn for quickfix list
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"qf"},
  callback = function() vim.opt_local.colorcolumn = "" end,
})

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Clear highligth on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Cnext cpevious hotkeys
vim.keymap.set('n', 'gn', '<cmd>cnext<CR>')
vim.keymap.set('n', 'gp', '<cmd>cprev<CR>')

-- Swap physical line move up/down with display line one's
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'gj', 'j')
vim.keymap.set('n', 'gk', 'k')

-- Shortcuts
vim.keymap.set('n', '<C-s>', '<cmd>wa<CR>')
vim.keymap.set('n', '<space>m', ':wa <bar> make <CR>')

-- Remap iteration hotkeys in insert mode
vim.keymap.set('i', '<C-J>', '<C-N>')
vim.keymap.set('i', '<C-K>', '<C-P>')

-- Tab stuff
vim.keymap.set('n', '<C-t>','<cmd>tab split<CR>', {silent = true})
vim.keymap.set('n', 'K','<cmd>tabn<CR>', {silent = true})
vim.keymap.set('n', 'J','<cmd>tabp<CR>', {silent = true})

vim.keymap.set('n', '<space>1','1gt', {silent = true})
vim.keymap.set('n', '<space>2','2gt', {silent = true})
vim.keymap.set('n', '<space>3','3gt', {silent = true})
vim.keymap.set('n', '<space>4','4gt', {silent = true})
vim.keymap.set('n', '<space>5','5gt', {silent = true})
vim.keymap.set('n', '<space>6','6gt', {silent = true})
vim.keymap.set('n', '<space>7','7gt', {silent = true})
vim.keymap.set('n', '<space>8','8gt', {silent = true})
vim.keymap.set('n', '<space>9','9gt', {silent = true})

-- TODO
-- Preview substitutions live, as you type!
-- vim.opt.inccommand = 'split'

-- " Set sigh column color
-- highlight clear SignColumn
-- :set signcolumn=yes:1

-- Toggle quickfix window
function ToggleQuickfix()
  windows_count = #vim.api.nvim_list_wins()
  vim.cmd "cclose"
  if (windows_count == #vim.api.nvim_list_wins())
  then
    vim.cmd "copen"
  end
end

vim.keymap.set('n', '<space>q', ToggleQuickfix, {silent = true})

-- Replace grep with ripgrep
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

-- Bootstrap lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'tpope/vim-sleuth',
  'airblade/vim-gitgutter',
  'kshenoy/vim-signature',
  'tpope/vim-fugitive',
  {'numToStr/Comment.nvim', opts = {}},
  {
    'echasnovski/mini.move',
    opts = {
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = '',
        right = '',
        down = '<C-j>',
        up = '<C-k>',

        -- Move current line in Normal mode
        line_left = '',
        line_right = '',
        line_down = '<C-j>',
        line_up = '<C-k>',
      }
    }
  },
  {
    'shaunsingh/solarized.nvim',
    priority = 1000,
    init = function()
      require('solarized').set()
    end
  },
  {
    'luukvbaal/nnn.nvim',
    config = function()
      local nnn = require("nnn")
      nnn.setup({
        replace_netrw = "picker",
        mappings = {
          { "<C-t>", nnn.builtin.open_in_tab }, -- open file(s) in tab
        }
      })
      vim.keymap.set('n', '<C-n>','<cmd>NnnPicker %:p:h<CR>')
    end
  },
  {
    'seblj/nvim-tabline',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      no_name = '[No Name]',    -- Name for buffers with no name
      modified_icon = '',      -- Icon for showing modified buffer
      close_icon = '',          -- Icon for closing tab with mouse
      separator = "┃",          -- Separator icon on the left side
      padding = 3,              -- Prefix and suffix space
      color_all_icons = true,   -- Color devicons in active and inactive tabs
      right_separator = false,  -- Show right separator on the last tab
      show_index = false,       -- Shows the index of tab before filename
      show_icon = true,         -- Shows the devicon
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'solarized_light'
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1
          },
          'searchcount'
        },
      }
    }
  },
  {
    'windwp/nvim-autopairs',
    opts = {}
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'}
    },
    config = function()
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<C-g>', builtin.live_grep, {})

      local actions = require("telescope.actions")
      require("telescope").setup{
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous
            },
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--fixed-strings" -- don't need to escape special characters
          }
        }
      }

      require('telescope').load_extension('fzf')
    end
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup()

      vim.keymap.set('n', '<space>t', '<cmd>ToggleTerm dir=%:p:h direction=float<CR>')
    end
  },
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "cmake",
          "cpp",
          "make",
          "lua",
          "python"
        },
        highlight = {enable = true}
      })
    end
  },
  {'RRethy/vim-illuminate'},
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'neovim/nvim-lspconfig'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/nvim-cmp'},
      {'L3MON4D3/LuaSnip'},
      {"nvim-treesitter/nvim-treesitter"}
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {"markdown"}
      })
      local lsp_zero = require('lsp-zero')

      local function allow_format(servers)
        return function(client) return vim.tbl_contains(servers, client.name) end
      end

      lsp_zero.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        local builtin = require('telescope.builtin')

        vim.keymap.set("n", "<space>d", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<space>i", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<space>f", function() vim.lsp.buf.code_action({apply = true}) end, opts)
        vim.keymap.set("n", "<space>n", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('n', '<space>s', builtin.lsp_dynamic_workspace_symbols, {buffer = bufnr})
        vim.keymap.set('n', '<space>r', builtin.lsp_references, {buffer = bufnr})
        vim.keymap.set('n', '<C-a>', '<cmd>ClangdSwitchSourceHeader<CR>', {buffer = bufnr})

        vim.keymap.set({'n', 'x'}, '<space>w', function()
          vim.lsp.buf.format({
            async = false,
            timeout_ms = 10000,
            filter = allow_format({'clangd'})
          })
        end, opts)
      end)

      local cmp = require('cmp')

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-k>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item({behavior = 'insert'})
            else
              cmp.complete()
            end
          end),
          ['<C-j>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_next_item({behavior = 'insert'})
            else
              cmp.complete()
            end
          end),

          -- scroll up and down the documentation window
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
        }),
      })

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {'clangd','bashls','pylsp'},
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        },
      })
    end
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    dependencies = {'nvim-treesitter/nvim-treesitter'}
  },
})

