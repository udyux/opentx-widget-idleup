--[[ IdleUp v1.1

https://github.com/udyux/opentx-widget-idleup
Copyright 2020 | Nicolas Udy | MIT License

DISCLAIMER
This script does not rely on telemetry. It does not reflect the actual craft's state and should not
be used in situations where reliable data is critical. It is the user's responsibility to check for
correct operation before use.

**IF IN DOUBT DO NOT FLY!**
]]

local inputs = {
  { "IdleUp", SOURCE, 111 },
  { "IdleUpMin", VALUE, 0, -100, 100 },
  { "IdleUpMax", VALUE, 100, -100, 100 },
  { "ActiveClr", COLOR, WHITE },
  { "LockedClr", COLOR, LIGHTGREY }
}

local function create(zone, options)
  local thr = getFieldInfo("thr").id
  local iuMin = options.IdleUpMin * 10.24
  local iuMax = options.IdleUpMax * 10.24
  return { zone = zone, options = options, thr = thr, iuMin = iuMin, iuMax = iuMax }
end

local function update(widget, options)
  widget.options = options
  widget.iuMin = options.IdleUpMin * 10.24
  widget.iuMax = options.IdleUpMax * 10.24
end

local function background() end

local function refresh(widget)
  local idleUpValue = getValue(widget.options.IdleUp)
  local isIdleUpOff = idleUpValue < widget.iuMin or idleUpValue > widget.iuMax
  local thrValue = isIdleUpOff and 0 or (getValue(widget.thr) + 1024) / 20.48

  lcd.setColor(CUSTOM_COLOR, widget.options.ActiveClr)
  lcd.drawText(widget.zone.x, widget.zone.y, "Throttle", CUSTOM_COLOR)

  if isIdleUpOff then lcd.setColor(CUSTOM_COLOR, widget.options.LockedClr) end

  lcd.drawNumber(widget.zone.x + widget.zone.w - 28, widget.zone.y, thrValue, RIGHT + DBLSIZE + CUSTOM_COLOR)
  lcd.drawText(widget.zone.x + widget.zone.w, widget.zone.y, "%", RIGHT + DBLSIZE + CUSTOM_COLOR)
  lcd.drawText(widget.zone.x + 3, widget.zone.y + 17, "Idle Up", SMLSIZE + CUSTOM_COLOR)
end

return {
  name = "IdleUp",
  options = inputs,
  create  = create,
  background = background,
  update = update,
  refresh = refresh
}
