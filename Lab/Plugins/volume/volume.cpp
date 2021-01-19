#include "volume.h"
#include "glwidget.h"

void Volume::onPluginLoad()
{
// recorre totes les cares del primer obj de l'escena i calcular el volum 

	const vector<Faces> faces = faces();
	for (int i = 0; i < faces.size(); ++i) {
	    int nv = faces[i].numVertices();
	    float C;
	    for (int j = 0; j < nv; ++j) C += faces[i].vertexIndex(j);
	    C = C/nv;
	    Vector N = faces[i].normal();
	    QVector3D vec = 
	    float A = legth(QVector3D::crossProduct(faces[i].
	    //C mitjana dels vertexs de la cara
	    // N normal de la cara
	    // A area de la caralength(cross(u,v))/2
	    volum += C.z*N.z*a
	
	}
	cout << volum << endl;
}
