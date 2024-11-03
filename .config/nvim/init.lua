-- Add ~/.config/nvim/config to the Lua package path
local home_dir = os.getenv("HOME")
local config_dir = home_dir .. "/.config/nvim/config/?.lua"
local init_dir = home_dir .. "/.config/nvim/config/?/init.lua"

-- Append the config directory paths to package.path
package.path = package.path .. ";" .. config_dir .. ";" .. init_dir

require("lua.remap")
require("lua.custom")
require("lua.lazy")
require("lua.theme")
print("λ")
--print("hack the planet")

