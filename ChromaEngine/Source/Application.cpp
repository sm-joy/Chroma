#include "Application.hpp"
#include <iostream>


namespace Chroma
{
	Application::Application()
	{

	}
	Application::~Application()
	{

	}
	void Application::Run()
	{
		std::cout << "Hello world";
		while (true);
	}
}