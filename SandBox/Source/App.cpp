#include <Chroma.hpp>

class SandBox : public Chroma::Application
{
public:
	SandBox()
	{
	}
	~SandBox()
	{
	}
};

Chroma::Application* Chroma::CreateApplication()
{
	return new SandBox();
}