workspace "Chroma"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Distribution"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"


project "SandBox"
	location "SandBox"
	kind "ConsoleApp"
	language "C++"
	targetdir ("Binaries/" .. outputdir .. "/%{prj.name}")
	objdir ("Intermediate/" .. outputdir .. "/%{prj.name}")

	files 
	{
		"%{prj.name}/Source/**.hpp",
		"%{prj.name}/Source/**.cpp"
	}

	includedirs
	{
		"ChromaEngine/Include"
	}

	links
	{
		"ChromaEngine"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"CM_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "CM_DeEBUG"
		symbols "On"
	
	filter "configurations:Release"
		defines "CM_RELEASE"
		optimize "On"
	
	filter "configurations:Distribution"
		defines "CM_DISTRIBUTION"
		optimize "On"




project "ChromaEngine"
	location "ChromaEngine"
	kind "SharedLib"
	language "C++"
	targetdir ("Binaries/" .. outputdir .. "/%{prj.name}")
	objdir    ("Intermediate/" .. outputdir .. "/%{prj.name}")

	-- pchheader "Pch.hpp"
	-- pchsource "ChromaEngine/Include/Pch.cpp"

	files 
	{
		"%{prj.name}/Source/**.hpp",
		"%{prj.name}/Source/**.cpp",
		"%{prj.name}/Include/**.hpp"
	}

	includedirs
	{
		"ChromaEngine/Include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"CM_PLATFORM_WINDOWS",
			"CM_BUILD_DLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../Binaries/" .. outputdir .. "/SandBox")
		}

	filter "configurations:Debug"
		defines "CM_DEBUG"
		symbols "On"
	
	filter "configurations:Release"
		defines "CM_RELEASE"
		optimize "On"
	
	filter "configurations:Distribution"
		defines "CM_DISTRIBUTION"
		optimize "On"
