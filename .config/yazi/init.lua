-- ~/.config/yazi/init.lua
require("relative-motions"):setup({ show_numbers = "relative", show_motion = true, enter_mode = "first" })
require("sshfs"):setup()
require("sduf"):setup()

function Status:length()
	local style = self:style()

	local text
	if self._tab.mode.is_select then
		local files = self._current.files
		local n = #files
		local count = 0
		if n > 0 then
			local cursor = math.min(self._current.cursor, n - 1)

			local left, l = 0, cursor
			while files[l + 1]:is_marked() == 1 do
				left = left + 1
				l = l - 1
				if l < 0 then l = n - 1 end
				if l == cursor then break end
			end

			local right = 0
			if left < n then
				local r = cursor
				while true do
					r = r + 1
					if r >= n then r = 0 end
					if r == cursor or files[r + 1]:is_marked() ~= 1 then break end
					right = right + 1
				end
			end
			count = left + right
		end
		text = tostring(count)
	else
		local h = self._current.hovered
		text = ya.readable_size(h and h.cha.len or 0)
	end

	return ui.Line {
		ui.Span(" " .. text .. " "):style(style.alt),
		ui.Span(th.status.sep_left.close):fg(style.alt:bg()),
	}
end
