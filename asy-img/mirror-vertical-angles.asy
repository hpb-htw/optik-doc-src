settings.tex="lualatex";
settings.outformat="pdf";

texpreamble("\input{shortcut.sty}");

import geometry;
import "optik/optik.asy" as optik;
unitsize(2mm);
// <pygmentize>
vector normalDir = (-1, 0);
point mCenter = (0, 0);
point source = (-10, 8);
real reflectedRayLength = 14;

PlanaMirror m = PlanaMirror(normalDir, mCenter);
point imagePoint = m.imagePoint(source);
m.setupMirrorSize(10, 12, 8, 0.125mm)
 .drawMirror(withNormal=false) // we don't want to show the default normal line
;
real angleStep = 12.5;
int steps = 3;
for(int i = 0; i < steps; ++i) { // rays from three angles: 0, 15 and 30 downward
    real incidentAngle = -i*angleStep;
    vector iDirection = dir(incidentAngle);
    NormalLine nl = m.calculateNormal(source, iDirection);
    m.drawIncidentRay(source, nl, arrowPosition=0)
     .drawNormal(nl, length=12)
     .drawReflectedRay(source, nl, arrowPosition=1, reflectedRayLength)
     .drawImageSegment(nl, imagePoint)
    ;
}

m.labelMirror(Label("\tLabel{Sp}", align=SE), "");
dot(source);
label("$\pLabel{P}$",  source, N);
label("$\pLabel{P'}$", imagePoint, N);
label("$\pLabel{A}$", source -- imagePoint, NW);
// </pygmentize>
