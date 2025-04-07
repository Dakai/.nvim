local status, render = pcall(require, "render-markdown")
if (not status) then
  print("render not installed")
  return
end

render.setup({
  latex = {
    -- Whether LaTeX should be rendered, mainly used for health check
    enabled = true,
    -- Additional modes to render LaTeX
    render_modes = true,
    -- Executable used to convert latex formula to rendered unicode
    converter = 'latex2text',
    -- Highlight for LaTeX blocks
    highlight = 'RenderMarkdownMath',
    -- Amount of empty lines above LaTeX blocks
    top_pad = 0,
    -- Amount of empty lines below LaTeX blocks
    bottom_pad = 0,
  },
})
