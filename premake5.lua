require("vendor/premake-clangd/clangd-support")

------------------------------------------------------------------------------
-- Utilities
------------------------------------------------------------------------------
local function GetIOResult(cmd)
	local handle = io.popen(cmd) -- Open a console and execute the command.
	local output = handle:read("*a") -- Read the output.
	handle:close() -- Close the handle.

	return output:match("^%s*(.-)%s*$") -- Trim any trailing whitespace (such as newlines)
end

function GetOS()
	local osName = os.getenv("OS")

	if osName == "Windows_NT" then
		return "windows"
	else
		local uname = io.popen("uname"):read("*l")
		if uname == "Linux" then
			return "linux"
		elseif uname == "Darwin" then
			return "macosx"
		end
	end

	return "unknown-os"
end
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Dependencies
------------------------------------------------------------------------------
MacOSVersion = "14.5"

Dependencies = {}
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Solution
------------------------------------------------------------------------------
outputdir = "%{cfg.buildcfg}-%{cfg.system}"

workspace("VkChess")
	architecture("x86_64")
	startproject("Game")

	configurations({
		"Debug",
		"Release",
	})

	flags({
		"MultiProcessorCompile",
	})

include("VkChess/Core")
include("VkChess/Graphics")
include("VkChess/Chess")
include("VkChess/Game")
------------------------------------------------------------------------------
