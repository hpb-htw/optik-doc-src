settings.tex="lualatex";
settings.outformat="pdf";

texpreamble("\input{shortcut.tex}");

unitsize(1mm);

import geometry;
import "optik/optik.asy" as optik;


vector normalDir = (0, 1);
point entry = (0, 0);
point source = (-20, 30);
real incidentPosition = 0;

PlanaMirror m = PlanaMirror(normalDir, entry);
m.setupMirrorSize(25)
 .drawMirror()
 .drawIncidentRay(source, incidentPosition, 0.25)
 .drawReflectedRay(source, incidentPosition, arrowPosition=0.90, rayLength=30)
 .labelMirror(surfaceL="\tLabel{Grenzfläche}", normalL="\tLabel{Einfallslot}")
 .labelRays(source, "$\alpha$", reflected="$\alpha'$")
;

