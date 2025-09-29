settings.tex="lualatex";
settings.outformat="pdf";

texpreamble("\input{shortcut.sty}");

unitsize(1mm);

import geometry;
import "optik/optik.asy" as optik;

// <pygmentize>
vector normalDir = (0, 1);
point mirrorC = (0, 0);
point source = (-20, 30);

PlanaMirror m = PlanaMirror(normalDir, mirrorC);
m.setupMirrorSize(leftWidth=25, rightWidth=20,
                  normalLength=18.5, thickness=1)
 .drawMirror()
 .drawIncidentRay(source, arrowPosition=0.25)
 .drawReflectedRay(source, arrowPosition=0.90, rayLength=30)
 .labelMirror(surfaceL="\tLabel{Grenzfläche}", normalL="\tLabel{Einfallslot}")
 .labelRays(source, incident="$\alpha$", reflected="$\alpha'$")
;
Label einfallstrahl = Label("\tLabel{Einfallsstrahl}",
                            align=SW, position=Relative(0.4));
label(einfallstrahl, source -- mirrorC);

point reflected = m.reflectedPoint(source);
Label reflektierterStrahl = Label(minipage("\tLabel{reflektierter Strahl}", width=80),
                                  align=SE, position=Relative(0.65));
label(reflektierterStrahl, mirrorC -- reflected);
// </pygmentize>
