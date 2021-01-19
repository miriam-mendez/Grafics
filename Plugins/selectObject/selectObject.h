#ifndef _SELECTOBJECT_H
#define _SELECTOBJECT_H

#include "plugin.h" 
 	#include <QOpenGLShader>
	#include <QOpenGLShaderProgram>
	
class SelectObject: public QObject, public Plugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)

  public:
  
	 void onPluginLoad();
	 void postFrame();

  private:
    QOpenGLShaderProgram* program;
    QOpenGLShader* vs;
    QOpenGLShader* fs;
    bool created;
    GLuint cubeVAO;
	    GLuint verticesVBO;
	    GLuint colorVBO;
    
};

#endif
