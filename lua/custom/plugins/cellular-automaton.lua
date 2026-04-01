return {
  {
    'eandrju/cellular-automaton.nvim',
    cmd = 'CellularAutomaton',
    keys = {
      { '<leader>fml', '<cmd>CellularAutomaton make_it_rain<cr>', desc = 'Make it rain' },
      { '<leader>fgl', '<cmd>CellularAutomaton game_of_life<cr>', desc = 'Game of life' },
    },
  },
}
