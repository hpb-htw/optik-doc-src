settings.tex="lualatex";
settings.outformat="pdf";

texpreamble("\input{shortcut.sty}");

unitsize(1mm);

import geometry;
import "optik/optik.asy" as optik;

// <pygmentize>
// set the default mirror thickness
mirrorThickness = 1;
// distance between two mirror
real h = 55;
// mirror size
real s = 10;

// upper mirror
vector uNormal = (-1,-1);
point uCenter = (0, h);
PlanaMirror uMirror = PlanaMirror(uNormal, uCenter);

// lower mirror
vector lNormal = -uNormal;
point lCenter = (0, 0);
PlanaMirror lMirror = PlanaMirror(lNormal, lCenter);

point source = (-30, h);

uMirror.setupMirrorSize(s)
 .drawMirror()
 .drawIncidentRay(source, arrowPosition=0.25, p=blue)
 .drawReflectedRay(source, arrowPosition=0, rayLength=h)
;

point reflected1 = uMirror.reflectedPoint(source);

lMirror.setupMirrorSize(s)
  .drawMirror()
  .drawReflectedRay(reflected1, arrowPosition=0.95, rayLength=30, p=red)
;
// </pygmentize>
