MacOSVersion = MacOSVersion or "14.5"

project("Game")
	kind("ConsoleApp")
	language("C++")
	cppdialect("C++23")
	staticruntime("On")

	warnings("Extra")

	architecture("x86_64")

	debugdir("%{wks.location}")

	targetdir("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	--------------------------------------
	-- Files & Options
	--------------------------------------
	files({
		"src/**.h",
		"src/**.hpp",
		"src/**.cpp",
	})

	includedirs({
		"src",
		"src/VkChess",

		"%{wks.location}/VkChess/Graphics/src",
		"%{wks.location}/VkChess/Chess/src",
	})

	defines({
		"_CRT_SECURE_NO_WARNINGS",
		"_SILENCE_ALL_MS_EXT_DEPRECATION_WARNINGS",
	})

	links({
		"Graphics",
		"Chess",
	})

	--------------------------------------
	-- Platforms
	--------------------------------------
	filter("system:windows")
		defines("VC_PLATFORM_WINDOWS")
		systemversion("latest")

	filter("system:linux")
		defines("VC_PLATFORM_LINUX")
		systemversion("latest")

	filter("system:macosx")
		defines("VC_PLATFORM_MACOS")
		systemversion(MacOSVersion)

	filter("action:xcode*")
		-- Note: If we don't add the header files to the externalincludedirs
		-- we can't use <angled> brackets to include files.
		externalincludedirs({
			"src",
			"src/VkChess",
		})

	--------------------------------------
	-- Configurations
	--------------------------------------
	filter("configurations:Debug")
		defines("VC_CONFIG_DEBUG")
		runtime("Debug")
		symbols("on")

	filter("configurations:Release")
		kind("WindowedApp")
		defines("VC_CONFIG_RELEASE")
		runtime("Release")
		optimize("on")