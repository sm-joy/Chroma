#pragma once

#ifdef CM_PLATFORM_WINDOWS
	#ifdef CM_BUILD_DLL
		#define CM_API _declspec(dllexport)
	#else 
		#define CM_API _declspec(dllimport)
	#endif
#else
	#error Currently Supports Windows Only!
#endif