#ifndef _SHOWDEGREE_H
#define _SHOWDEGREE_H

#include "plugin.h" 
#include<QPainter>

class ShowDegree: public QObject, public Plugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)

  public:
	 void onPluginLoad();
	 void onObjectAdd();
	 void onSceneClear();
	 void postFrame();

  private:
    double degree;
    void degreeInfo();
    QPainter painter;
	// add private methods and attributes here
};

#endif
