project "zlib"
	kind "StaticLib"
	language "C"
	
	targetdir("%{wks.location}/Build/Binary/"..outputdir.."/%{prj.name}");
	objdir("%{wks.location}/Build/Intermediate/"..outputdir.."/%{prj.name}");

	files
	{
		"src/**.h",
		"src/**.c",
	}
	   
	filter "system:windows"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"_CRT_SECURE_NO_WARNINGS",
		}

		links
		{
		}

	filter "configurations:Debug"
		defines "ARCH_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "ARCH_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "ARCH_DIST"
		optimize "On"