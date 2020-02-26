#ifndef _XELA_INIT_H
#define _XELA_INIT_H

//Engine
#include "XelaDefinitions.h"
//OpenGL
#include "GL/glew.h"
#include "GLFW/glfw3.h"
//C++
#ifdef XELA_DEBUG_INIT
	#include <iostream>
#endif

//Initializes the Xela Graphics library.
bool xelaInit();
//Initializes GLEW, which needs to be done seperately from XelaInit().
bool xelaInitGLEW();
//Unloads the Xela Graphics library.
bool xelaTerminate();

#endif