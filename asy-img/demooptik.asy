settings.tex="lualatex";
settings.outformat="pdf";

texpreamble("\input{shortcut.sty}");

unitsize(1mm);

import geometry;
import "optik/optik.asy" as optik;


vector normalDir = (0, 1);
point mirrorC = (0, 0);
point source = (-20, 30);

PlanaMirror m = PlanaMirror(normalDir, mirrorC);
m.setupMirrorSize(25)
 .drawMirror()
 .drawIncidentRay(source, arrowPosition=0.25)
 .drawReflectedRay(source, arrowPosition=0.90, rayLength=30)
 .labelMirror(surfaceL="\tLabel{Grenzfläche}", normalL="\tLabel{Einfallslot}")
 .labelRays(source, "$\alpha$", reflected="$\alpha'$")
;

