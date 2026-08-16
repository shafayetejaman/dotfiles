-- ~/.config/yazi/init.lua
require("relative-motions"):setup({ show_numbers = "relative", show_motion = true, enter_mode = "first" })
require("sshfs"):setup()
require("sduf"):setup()

local function visual_count(a, w, c, n)
	if w == 0 then
		return math.abs(c - a) + 1
	elseif w == 1 and a > c + 1 then
		return (c + 1) + (n - a)
	elseif w == -1 and c > a + 1 then
		return (a + 1) + (n - c)
	else
		return n
	end
end

function Status:length()
	local style = self:style()

	local text
	if self._tab.mode.is_select then
		local n = #self._current.files
		local cursor = math.min(self._current.cursor, n > 0 and n - 1 or 0)

		if not _v_sel then
			_v_anchor, _v_wraps = cursor, 0
			_v_count = n > 0 and 1 or 0
		elseif n > 0 and _v_cursor ~= cursor then
			local d = cursor - _v_cursor
			if d ~= 1 and d ~= -1 then
				if d < 0 then _v_wraps = _v_wraps + 1 else _v_wraps = _v_wraps - 1 end
			end
			_v_anchor = math.min(_v_anchor, n - 1)
			_v_count = visual_count(_v_anchor, _v_wraps, cursor, n)
		end

		_v_sel, _v_cursor = true, cursor
		text = tostring(_v_count)
	else
		_v_sel = false
		local h = self._current.hovered
		text = ya.readable_size(h and h.cha.len or 0)
	end

	return ui.Line {
		ui.Span(" " .. text .. " "):style(style.alt),
		ui.Span(th.status.sep_left.close):fg(style.alt:bg()),
	}
end
