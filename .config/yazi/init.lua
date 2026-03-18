-- ~/.config/yazi/init.lua
require("relative-motions"):setup({ show_numbers = "relative", show_motion = true, enter_mode = "first" })
require("sshfs"):setup()

Status:children_add(function()
  -- Get used and total in human-readable form
  local cmd_ht = 'df -h . 2>/dev/null | awk \'NR==2 {printf "%s / %s", $3, $2}\''
  local pipe_ht = io.popen(cmd_ht)
  local used_total = pipe_ht and pipe_ht:read('*a'):gsub("%s+$", "") or "??"
  if pipe_ht then pipe_ht:close() end

  -- Get percentage used (from non-human-readable df)
  local cmd_perc = 'df . 2>/dev/null | awk \'NR==2 {printf "%d%%", $5}\''
  local pipe_perc = io.popen(cmd_perc)
  local percent = pipe_perc and pipe_perc:read('*a'):gsub("%s+$", "") or "??"
  if pipe_perc then pipe_perc:close() end

  local display = used_total .. " (" .. percent .. ")"
  if used_total == "??" or percent == "??" then
    display = "Disk: ??"
  end

  -- Optional: color based on usage level
  local color = "green"
  local num = tonumber(percent:match("%d+"))
  if num then
    if num >= 90 then
      color = "red"
    elseif num >= 75 then
      color = "yellow"
    end
  end

  return ui.Span("  " .. display .. "  "):fg(color)
end, 2900, Status.CENTER)
