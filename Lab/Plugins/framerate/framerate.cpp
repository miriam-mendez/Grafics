#include "framerate.h"
#include "glwidget.h"

void Framerate::onPluginLoad()
{
	frame = 0;
}

void Framerate::postFrame()
{

	    if (time.elapsed() < 1) {
	        ++frame;
	    }
	    else {
	        cout << frame << endl;
	        frame = 0;
	        time.start();
	     }
	   }


