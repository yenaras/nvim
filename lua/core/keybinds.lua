-- Define map to set key mappings
local map = vim.api.nvim_set_keymap

-- define options for key mappings
local opts = { noremap = true, silent = true }

-- set leader key to space bar
vim.g.mapleader = " "

-- barbar keybinds (buffer navigation and manipulation)
-- Move to previous/next buffer using Alt+, and Alt+.
map("n", "<A-,>", ":BufferPrevious<CR>", opts)
map("n", "<A-.>", ":BufferNext<CR>", opts)

-- Re-order to previous/next buffer with Alt+< and Alt+>
map("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
map("n", "<A->>", " :BufferMoveNext<CR>", opts)
-- Go to specific buffer positions with Alt+number
map("n", "<A-1>", ":BufferGoto 1<CR>", opts)
map("n", "<A-2>", ":BufferGoto 2<CR>", opts)
map("n", "<A-3>", ":BufferGoto 3<CR>", opts)
map("n", "<A-4>", ":BufferGoto 4<CR>", opts)
map("n", "<A-5>", ":BufferGoto 5<CR>", opts)
map("n", "<A-6>", ":BufferGoto 6<CR>", opts)
map("n", "<A-7>", ":BufferGoto 7<CR>", opts)
map("n", "<A-8>", ":BufferGoto 8<CR>", opts)
map("n", "<A-9>", ":BufferGoto 9<CR>", opts)
map("n", "<A-0>", ":BufferLast<CR>", opts)

-- Close current buffer using Alt+c, or close all buffers except current with Ctrl+c
map("n", "<A-c>", ":BufferClose<CR>", opts)
map("n", "<C-c>", ":BufferCloseAllButCurrent<CR>", opts)

-- Enable buffer-picking mode using Ctrl+p (magic buffer-picking)
map("n", "<C-p>", ":BufferPick<CR>", opts)

-- Sort buffers automatically by buffer number, directory, or language
-------------------------------------------------------------------
--sort by number with <leader>bb
--sort by Directory with <leader>bd
--sort by language with <leader>bl>
map("n", "<leader>bb", ":BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bd", ":BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bl", ":BufferOrderByLanguage<CR>", opts)


-- lsp keybinds

map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)          --> jumps to the definition of the symbol under the cursor
map("n", "<leader>lh", ":lua vim.lsp.buf.hover()<CR>", opts)       --> information about the symbol under the cursos in a floating window
map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)      --> lists all the implementations for the symbol under the cursor in the quickfix window
map("n", "<leader>rn", ":lua vim.lsp.util.rename()<CR>", opts)     --> renaname old_fname to new_fname
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts) --> selects a code action available at the current cursor position
map("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)          --> lists all the references to the symbl under the cursor in the quickfix window
map("n", "<leader>ld", ":lua vim.diagnostic.open_float()<CR>", opts)
map("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
map("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
map("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
map("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>", opts)
