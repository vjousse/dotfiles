local setmetatable = setmetatable
local ipairs = ipairs
local math = math
local base = require('wibox.widget.base')
local color = require("gears.color")
local beautiful = require("beautiful")
local lgi = require("lgi")
local cairo = lgi.cairo
local Pango = lgi.Pango

local assault = { mt = {} }

local data = setmetatable({}, { __mode = "k" })

local properties = { "width", "height" }

function assault.fit (assault, width, height)
	local width = 2 + data[assault].width + (data[assault].stroke_width * 2) + data[assault].peg_width
	local height = 2 + data[assault].height + (data[assault].stroke_width * 2)
	print('fit out: ' .. width .. ' / ' .. height)
	return width, height
end

local round = function (num, idp)
	return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

local acpi_is_on_ac_power = function (adapter)
	local f = io.open('/sys/class/power_supply/' .. adapter .. '/online')
	if f == nil then return false end
	local o = f:read()
	f:close()
	return string.find(o, '1')
end

local acpi_battery_is_present = function (battery)
	local f = io.open('/sys/class/power_supply/' .. battery .. '/present')
	if f == nil then return false end
	local o = f:read()
	f:close()
	return string.find(o, '1')
end

local acpi_battery_is_charging = function (battery)
	local f = io.open('/sys/class/power_supply/' .. battery .. '/status')
	if f == nil then return false end
	local o = f:read()
	f:close()
	return string.find(o, 'Charging')
end

local acpi_battery_percent = function (battery)
	local now  = io.open('/sys/class/power_supply/' .. battery .. '/energy_now') or
		     io.open('/sys/class/power_supply/' .. battery .. '/charge_now')
	local full = io.open('/sys/class/power_supply/' .. battery .. '/energy_full') or
		     io.open('/sys/class/power_supply/' .. battery .. '/charge_full')
	if (now == nil) or (full == nil) then return 0 end
	local out_n = now:read()
	now:close()
	local out_f = full:read()
	full:close()
	return tonumber(out_n)/tonumber(out_f)
end

local battery_bolt_generate = function (width, height)
	local surface = cairo.ImageSurface(cairo.Format.A8, width, height)
	local cr = cairo.Context(surface)

	cr:new_path()

	cr:move_to(width * ( 0.0/19), height * ( 3.0/11))
	cr:line_to(width * (11.0/19), height * (11.0/11))
	cr:line_to(width * (11.0/19), height * ( 5.5/11))
	cr:line_to(width * (19.0/19), height * ( 8.0/11))
	cr:line_to(width * ( 8.0/19), height * ( 0.0/11))
	cr:line_to(width * ( 8.0/19), height * ( 5.5/11))

	cr:close_path()

	return cr:copy_path()
end

local battery_border_generate = function (args)
	local args = args or {}
	local surface = cairo.ImageSurface(cairo.Format.A8, args.width, args.height)
	local cr = cairo.Context(surface)

	local outside_width  = args.width  + (args.stroke_width * 2)
	local outside_height = args.height + (args.stroke_width * 2)

	cr:new_path()

	cr:move_to(0                             , 0                             )
	cr:line_to(outside_width                 , 0                             )
	cr:line_to(outside_width                 , args.peg_top                  )
	cr:line_to(outside_width + args.peg_width, args.peg_top                  )
	cr:line_to(outside_width + args.peg_width, args.peg_top + args.peg_height)
	cr:line_to(outside_width                 , args.peg_top + args.peg_height)
	cr:line_to(outside_width                 , outside_height                )
	cr:line_to(0                             , outside_height                )

	cr:rectangle(args.stroke_width, args.stroke_width, args.width, args.height);

	cr:close_path()

	return cr:copy_path()
end

local battery_text_generate = function (text, font)
	local surface = cairo.ImageSurface(cairo.Format.A8, 100, 100)
	local cr = cairo.Context(surface)
	cr:new_path()
	cr:select_font_face(font:get_family(), cairo.FontSlant.NORMAL, cairo.FontWeight.NORMAL)
	cr:set_font_size(font:get_size() / Pango.SCALE)
	cr:move_to(0, 0)
	cr:text_path(text)
	cr:close_path()
	return cr:copy_path()
end

local battery_text_draw = function (cr, args, text)
	local font = Pango.FontDescription.from_string(args.font)
	--font:set_size(10)

	cr:select_font_face(font:get_family(), cairo.FontSlant.NORMAL, cairo.FontWeight.NORMAL)
	cr:set_font_size(font:get_size() / Pango.SCALE)

	local extents = cr:text_extents(text)
	local text_x = (args.width / 2.0) - ((extents.width + (extents.x_bearing * 2)) / 2.0)
	local text_y = (args.height / 2.0) - ((extents.height + (extents.y_bearing * 2)) / 2.0)

	cr:translate(text_x, text_y)
	cr:append_path(battery_text_generate(text, font))
	cr:translate(-text_x, -text_y)

	return true
end

local battery_fill_generate = function (width, height, percent)
	-- Sanity check on the percentage
	local percent = percent
	if percent > 1 then percent = 1 end
	if percent < 0 then percent = 0 end

	local surface = cairo.ImageSurface(cairo.Format.A8, width, height)
	local cr = cairo.Context(surface)
	cr:new_path()
	cr:rectangle(0, 0, round(width * percent), height)
	cr:close_path()
	return cr:copy_path()
end

local properties = {
	"battery", "adapter", "width", "height", "peg_top",
	"peg_height", "peg_width", "stroke_width",
	"font", "critical_level",
	"normal_color", "charging_color", "critical_color"
}

function assault.draw (assault, wibox, cr, width, height)
	local center_x = (width / 2.0) - ((data[assault].width + (data[assault].stroke_width * 2)) / 2.0)
	local center_y = (height / 2.0) - ((data[assault].height + (data[assault].stroke_width * 2)) / 2.0)
	cr:translate(center_x, center_y)
	cr:append_path(battery_border_generate({
		width = data[assault].width,
		height = data[assault].height,
		stroke_width = data[assault].stroke_width,
		peg_top = data[assault].peg_top,
		peg_height = data[assault].peg_height,
		peg_width = data[assault].peg_width
	}))

	cr.fill_rule = "EVEN_ODD"
	local percent = acpi_battery_percent(data[assault].battery)

	local draw_color = color(data[assault].normal_color)
	if acpi_battery_is_present(data[assault].battery) then
		if acpi_battery_is_charging(data[assault].battery) then
			draw_color = color(data[assault].charging_color)
		elseif percent <= data[assault].critical_level then
			draw_color = color(data[assault].critical_color)
		end
	end

	-- Draw fill
	cr:translate(data[assault].stroke_width, data[assault].stroke_width)
	cr:append_path(battery_fill_generate(data[assault].width, data[assault].height, percent))

	if acpi_is_on_ac_power(data[assault].adapter) then
		local bolt_x = (data[assault].width  / 2.0) - (data[assault].bolt_width  / 2.0)
		local bolt_y = (data[assault].height / 2.0) - (data[assault].bolt_height / 2.0)
		cr:translate( bolt_x,  bolt_y)
		cr:append_path(battery_bolt_generate(data[assault].bolt_width, data[assault].bolt_height))
		cr:translate(-bolt_x, -bolt_y)
	elseif acpi_battery_is_present(data[assault].battery) then
		local percentstr = string.format('%d%%', round(percent * 100))
		battery_text_draw(cr, data[assault], percentstr)
	end
	cr:set_source(draw_color)
	cr:fill()
end

-- Build properties function
for _, prop in ipairs(properties) do
	if not assault["set_" .. prop] then
		assault["set_" .. prop] = function(widget, value)
			data[widget][prop] = value
			widget:emit_signal("widget::updated")
			return widget
		end
	end
end

--- Create an assault widget
function assault.new (args)
	local args = args or {}
	local battery = args.battery or 'BAT0'
	local adapter = args.adapter or 'AC'
	local stroke_width = args.stroke_width or 2
	local width = args.width or 36
	local height = args.height or 15
	local bolt_width = args.bolt_width or 19
	local bolt_height = args.bolt_height or 11
	local peg_height = args.peg_height or (height / 3)
	local peg_width = args.peg_width or 2
	local peg_top = args.peg_top or (((height + (stroke_width * 2)) / 2.0) - (peg_height / 2.0))
	local font = args.font or beautiful.font
	local critical_level = args.critical_level or 0.10
	local normal_color = args.normal_color or beautiful.fg_normal
	local critical_color = args.critical_color or "#ff0000"
	local charging_color = args.charging_color or "#00ff00"

	args.type = "imagebox"

	local widget = base.make_widget()

	data[widget] = {
		battery = battery,
		adapter = adapter,
		width = width,
		height = height,
		bolt_width = bolt_width,
		bolt_height = bolt_height,
		stroke_width = stroke_width,
		peg_top = peg_top,
		peg_height = peg_height,
		peg_width = peg_width,
		font = font,
		critical_level = critical_level,
		normal_color = normal_color,
		critical_color = critical_color,
		charging_color = charging_color
	}

	-- Set methods
	for _, prop in ipairs(properties) do
		widget["set_" .. prop] = assault["set_" .. prop]
	end

	widget.draw = assault.draw
	widget.fit = assault.fit

	return widget
end

function assault.mt:__call(...)
	return assault.new(...)
end

return setmetatable(assault, assault.mt)
