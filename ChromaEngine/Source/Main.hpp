#pragma once


#ifdef CM_PLATFORM_WINDOWS

extern Chroma::Application* Chroma::CreateApplication();


int main(int argc, char** argv)
{
	Chroma::Application* app = Chroma::CreateApplication();
	app->Run();
	delete app;
}


#endif	

