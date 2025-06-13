require("which-key").setup {
    preset = "modern",
  plugins = {
    marks = true,    -- Mostrar as marcas
    registers = true, -- Mostrar registros
    spelling = {
      enabled = true,  -- Habilitar verificação ortográfica
      suggestions = 20  -- Número de sugestões
    },
  },
  layout = {
    align = 'center', -- Centraliza as combinações de teclas no pop-up
    height = { min = 4, max = 25 }, -- Altura mínima e máxima do pop-up
    width = { min = 20, max = 50 }, -- Largura mínima e máxima do pop-up
  },
  show_help = true,       -- Exibe a ajuda quando pressionado ?
}

