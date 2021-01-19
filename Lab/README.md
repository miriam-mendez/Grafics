# Grafics

Compilació: /assig/grau-g/viewer/GLarenaSL

Formula sinusoïdal = A * sin(2 * pi * freq * temps + desfas) 
pi = 3.141592

Rotació en l'eix en un punt P: (Ex: contortion)
  1) Centrar el objecte, mitjançant translate(-P)
  2) Rotar el objecte, segons l'eix
  3) Desplaçar el objecte en el punt P, translate(P)

Càlcul fent un módul, per obtenir la posició: (Ex: Gradient1)
  1) Calculem el interval = (MaxInterval-MinInterval)/elements
  2) Calculem la posició: (vertex.y - MinInterval)/interval

Exemple d'ús de array: gradient1

Reinvertir els valors: 2 * m - Max, on m = (Max + Min)/2

Funció de la esfera => R^2 = (x^2+y^2+z^2)
