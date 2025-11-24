local wibox = require("wibox")
local gears = require("gears")

local cpu_icons_path = gears.filesystem.get_configuration_dir() .. "mr_incredible_cpu_widget/"

local cpu_icon = wibox.widget {
    widget = wibox.widget.imagebox,
    resize = true
}

gears.timer {
    timeout = 3,
    autostart = true,
    callback = function()
        local f = io.open("/proc/stat", "r")
        local line = f:read("*l")
        f:close()

        local user, nice, system, idle =
            line:match("cpu%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)")
        
        user = tonumber(user)
        nice = tonumber(nice)
        system = tonumber(system)
        idle = tonumber(idle)

        local total = user + nice + system + idle
        local busy = user + nice + system

        if not cpu_last_total then
            cpu_last_total = total
            cpu_last_busy = busy
            return
        end

        local diff_total = total - cpu_last_total
        local diff_busy = busy - cpu_last_busy

        cpu_last_total = total
        cpu_last_busy = busy

        local cpu_usage = (diff_busy / diff_total) * 100

        local icon = "1.jpg"
        if cpu_usage > 25 and cpu_usage <= 50 then
            icon = "2.jpg"
        elseif cpu_usage > 50 and cpu_usage <= 75 then
            icon = "3.jpg"
        elseif cpu_usage > 75 then
            icon = "4.jpg"
        end

        cpu_icon.image = cpu_icons_path .. icon
    end
}

return cpu_icon

