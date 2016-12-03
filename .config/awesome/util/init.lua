--------------------------------------------------------------------------------
-- Author Ivan Trubach
-- Copyright (c) 2016 Ivan Trubach
--------------------------------------------------------------------------------

local math = require("math")
local string = require("string")

local markup = require("lain.util.markup")
local read_pipe = require("lain.helpers").read_pipe

module("util")

function weather_text(data)
	local date_cmd = "date -u -d @%d +'%%A %%d'"
	-- time of data forecasted
	local day = string.gsub(
		read_pipe(string.format(date_cmd, data["dt"])),
		"\n", "")

	-- weather condition
	local description = data["weather"][1]["description"]

	-- temperatures, units are defined above
	local tmin = math.floor(data["temp"]["min"])   -- min daily
	local tmax = math.floor(data["temp"]["max"])   -- max daily
	local tmor = math.floor(data["temp"]["morn"])  -- morning
	local tday = math.floor(data["temp"]["day"])   -- day
	local teve = math.floor(data["temp"]["eve"])   -- evening
	local tnig = math.floor(data["temp"]["night"]) -- night

	-- pressure, hPa
	local pressure = math.floor(data["pressure"])

	-- humidity, %
	local humidity = math.floor(data["humidity"])

	-- wind speed, miles/hour if units are imperial, meter/sec otherwise
	local wspeed = math.floor(data["speed"])

	-- wind degrees, meteorological degrees
	local wdeg = math.floor(data["deg"])

	-- cloudliness, %
	local clouds = math.floor(data["clouds"])

	local fmt = [[
<b>%s</b> %s
max/min: %d %d
Pressure: %d hPa
Humidity: %d%%
Wind: %d m/s at %d°
Cloudliness: %d%%
]]

	return string.format(fmt,
		day, description, tmax, tmin, pressure,
		humidity, wspeed, wdeg, clouds)
end

function batidx(nperc)
	if nperc <= 15 then
		return 5
	elseif nperc <= 50 then
		return 4
	elseif nperc <= 75 then
		return 3
	elseif nperc < 90 then
		return 2
	else
		return 1
	end
end

function volidx(level)
	if level < 30 then
		return 1
	elseif level < 75 then
		return 2
	else
		return 3
	end
end

function make_icon(glyph, fontName)
	fontName = fontName or "FontAwesome"
	return markup.font(fontName, glyph)
end
