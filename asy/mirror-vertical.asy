settings.tex="lualatex";
settings.outformat="pdf";

texpreamble("\input{shortcut.sty}");

unitsize(2mm);

import geometry;
import "optik/optik.asy" as optik;

vector normalDir = (-1, 0);
point mCenter = (0, 0);
point source = (-10, 8);
real reflectedRayLength = 14;

PlanaMirror m = PlanaMirror(normalDir, mCenter);
point imagePoint = m.imagePoint(source);
m.setupMirrorSize(10, 12, 8, 0.5mm)
 .drawMirror(withNormal=false)
;

real[] incidents = {0, -5, -8};

for(real i : incidents) {
    NormalLine nl = m.calculateNormal(i);
    m.drawIncidentRay(source, nl, 0)
     .drawNormal(nl, 12)
     .drawReflectedRay(source, nl, 1, reflectedRayLength)
     .drawImageSegment(nl, imagePoint)
    ;
}

m.labelMirror(Label("\tLabel{Sp}", align=SE), "");
dot(source);
label("$\pLabel{P}$",  source, N);
label("$\pLabel{P'}$", imagePoint, N);
label("$\pLabel{A}$", source -- imagePoint, NW);
