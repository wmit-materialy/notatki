-- Pandoc filter that transforms fenced divs of classes .theorem/.lemma/.example
-- to respective tcolorbox environments assuming following header is included:
-- ```latex
--   \usepackage{tcolorbox}
--   \tcbuselibrary{theorems,skins,breakable}
--
--   \newtcbtheorem[number within=section]{theorem}{Twierdzenie}%
--   {enhanced, breakable,
--    skin first=enhanced, skin middle=enhanced, skin last=enhanced,
--    colback=green!5, colframe=green!35!black, fonttitle=\bfseries}{thm}
--
--   \newtcbtheorem[number within=section]{lemma}{Lemat}%
--   {enhanced, breakable,
--    skin first=enhanced, skin middle=enhanced, skin last=enhanced,
--    colback=blue!5, colframe=blue!35!black, fonttitle=\bfseries}{lem}
--
--   \newtcbtheorem[number within=section]{example}{Przykład}%
--   {enhanced, breakable,
--    skin first=enhanced, skin middle=enhanced, skin last=enhanced,
--    colback=yellow!5, colframe=yellow!35!black, fonttitle=\bfseries}{ex}
-- ```
-- Author: Aleksey Myshko
-- License: GPLv3

---@module "pandoc"
---@type pandoc
local pandoc = pandoc

local supported_envs = {
  theorem = true,
  lemma = true,
  example = true,
  caution = true,
  proof = true
}

---@param elem Div
---@return BlockFilterResult
local function Div(elem)
  -- Look for one of the target classes in the Div.
  local env = nil
  for _, cls in ipairs(elem.classes) do
    if supported_envs[cls] then
      env = cls
      break
    end
  end

  -- If none of the classes match, leave the Div unchanged.
  if not env then
    return nil
  end

  -- Extract title and ref
  -- title is a name for the theorem
  -- ref is the label of the theorem. Can be referenced with \ref{thm:$ref}
  local title = elem.attributes["title"] or ""
  local ref = elem.attributes["ref"] or ""

  -- Create new blocks: a raw LaTeX begin block, then the Div's contents, then the end block.
  local blocks = {}
  table.insert(blocks, pandoc.RawBlock("latex", string.format("\\begin{%s}{%s}{%s}", env, title, ref)))
  for _, block in ipairs(elem.content) do
    table.insert(blocks, block)
  end
  table.insert(blocks, pandoc.RawBlock("latex", "\\end{" .. env .. "}"))

  return blocks
end

return { Div = Div }
