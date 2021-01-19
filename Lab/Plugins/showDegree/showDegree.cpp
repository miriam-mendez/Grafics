#include "showDegree.h"
#include "glwidget.h"

void ShowDegree::degreeInfo() 
{
    const Object &obj =scene()->objects()[0];
    int nVertsFace = obj.faces().size()*3; //verts x face, face => 3 verts
    int nVerts = obj.vertices().size();
	degree = (double) nVertsFace/nVerts;
}

void ShowDegree::onPluginLoad()
{
    degreeInfo();
}

void ShowDegree::onObjectAdd()
{
    degreeInfo();
}

void ShowDegree::onSceneClear()
{
    degree = 0;
}

void ShowDegree::postFrame()
{
    QFont font;
    font.setPixelSize(32);
    painter.begin(glwidget());
    painter.setFont(font);
    int x = 10;
    int y = 40;
    painter.drawText(x, y, QString::number(degree));    
    painter.end();
}
