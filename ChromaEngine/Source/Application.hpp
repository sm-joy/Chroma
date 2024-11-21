#pragma once

#include "Core.hpp"

namespace Chroma
{
	class CM_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	Application* CreateApplication();
}
