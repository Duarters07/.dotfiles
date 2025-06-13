-- Configuração do Bufferline
require('bufferline').setup {
  options = {
    -- Mostra os números dos buffers
    numbers = "ordinal",  -- Opções: "none", "ordinal", "both"
    close_command = "bdelete! %d",  -- Comando para fechar o buffer
    right_mouse_command = "bdelete! %d",  -- Comando com o botão direito
    left_mouse_command = "buffer %d",  -- Comando para abrir buffer ao clicar
    indicator = {
      style = 'icon',  -- Pode ser 'icon' ou 'underline'
      icon = '▎',  -- Ícone para o indicador do buffer
    },
    -- buffer_close_icon = '',  -- Ícone para fechar o buffer
    modified_icon = '●',  -- Ícone para arquivos m.luaodificados
    close_icon = '',  -- Ícone para o botão de fechar
    left_trunc_marker = '',  -- Ícone para buffers truncados à esquerda
    right_trunc_marker = '',  -- Ícone para buffers truncados à direita
    tab_size = 18,  -- Tamanho dos buffers (ajuste conforme necessário)
    max_name_length = 18,  -- Tamanho máximo do nome do buffer
    max_prefix_length = 15,  -- Prefixo máximo do nome do buffer
    diagnostics = "nvim_lsp",  -- Mostra diagnósticos LSP no buffer
    diagnostics_update_in_insert = false,  -- Atualiza diagnósticos no modo de inserção
    offsets = { 
      {
        filetype = "NvimTree",  -- Offset para o NvimTree
        text = "File Explorer",  -- Texto de título
        text_align = "center",  -- Alinhamento do texto
        separator = true,  -- Adiciona uma linha de separação entre o NvimTree e o Bufferline
      }
    },
  },
}

-- Mapeamento para alternar entre buffers
vim.api.nvim_set_keymap('n', '<leader>bn', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })  -- Próximo buffer
vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })  -- Buffer anterior

-- Mapeamento para fechar o buffer atual
vim.api.nvim_set_keymap('n', '<leader>bc', ':bdelete<CR>', { noremap = true, silent = true })
