-- ~/.config/yazi/init.lua
require("relative-motions"):setup({ show_numbers = "relative", show_motion = true, enter_mode = "first" })
require("sshfs"):setup()

Status:children_add(function()
	-- Get used and total in human-readable form
	local cmd_ht = "df -h . 2>/dev/null | awk 'NR==2 {printf \"%s/%s\", $3, $2}'"
	local pipe_ht = io.popen(cmd_ht)
	local used_total = pipe_ht and pipe_ht:read("*a"):gsub("%s+$", "") or "??"
	if pipe_ht then
		pipe_ht:close()
	end

	-- Get percentage used
	local cmd_perc = "df . 2>/dev/null | awk 'NR==2 {printf \"%d%%\", $5}'"
	local pipe_perc = io.popen(cmd_perc)
	local percent = pipe_perc and pipe_perc:read("*a"):gsub("%s+$", "") or "??"
	if pipe_perc then
		pipe_perc:close()
	end

	local display = " " .. used_total .. " " .. percent .. " "
	local num = tonumber(percent:match("%d+"))

	-- Fallback if disk is unreadable
	if used_total == "??" or not num then
		return ui.Line({ ui.Span(" Disk: ?? "):fg("red") })
	end

	-- 1. Define colors
	local filled_bg = "#227d02"
	if num >= 90 then
		filled_bg = "#F38BA8"
	elseif num >= 75 then
		filled_bg = "#F9E2AF"
	end

	local unfilled_bg = "#45475A" -- Dark empty track
	local text_fg = "#FFFFFF" -- White text

	-- 2. Calculate the split
	local len = #display
	local split_idx = math.floor((num / 100) * len)

	local s1 = display:sub(1, split_idx)
	local s2 = display:sub(split_idx + 1)

	-- 3. Determine the color of the rounded end caps
	-- If the disk is somehow 0% or 100%, we ensure the caps match the correct color
	local left_cap_color = (split_idx > 0) and filled_bg or unfilled_bg
	local right_cap_color = (split_idx < len) and unfilled_bg or filled_bg

	-- 4. Return the assembled line with margins and rounded caps
	return ui.Line({
		ui.Span(" "), -- LEFT MARGIN

		ui.Span(""):fg(left_cap_color),
		ui.Span(s1):bg(filled_bg):fg(text_fg),
		ui.Span(s2):bg(unfilled_bg):fg(text_fg),
		ui.Span(""):fg(right_cap_color),
	})
end, 2900, Status.CENTER)
