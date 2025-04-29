-- Pandoc filter that removes all «proof» headings and their contents
-- Author: Aleksey Myshko
-- License: GPLv3

---@module "pandoc"
---@type pandoc
local pandoc = pandoc

---@param doc Pandoc
---@return Pandoc|nil
function Pandoc(doc)
	local hblocks = {}
	local inProof = false
	local proofHeadingLevel = math.huge

	for _, el in pairs(doc.blocks) do
		if el.t == "Header" then
			---@cast el Header

			-- Get a lowercase string representation of a heading title
			local headingName = pandoc.utils.stringify(el.content)
			headingName = pandoc.text.lower(headingName)

			if headingName:match("dowód") then
				inProof = true
				proofHeadingLevel = math.min(el.level, proofHeadingLevel)
			elseif el.level < proofHeadingLevel then
				-- If we encounter a heading that is of equal or lower level than our
				-- previous proof heading, then set inProof to false
				inProof = false
				proofHeadingLevel = math.huge
			end
		end

		-- Whenever inProof is set, we ignore anything that follows
		if not inProof then
			table.insert(hblocks, el)
		end
	end

  doc.meta.title =
    pandoc.MetaString(
      ("%s (bez dowodów)"):format(
        pandoc.utils.stringify(doc.meta.title)))

	return pandoc.Pandoc(hblocks, doc.meta)
end
