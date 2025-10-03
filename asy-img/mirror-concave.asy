settings.tex="lualatex";
settings.outformat="pdf";

texpreamble("\input{shortcut.sty}");

unitsize(1mm);

import geometry;
import "optik/optik.asy" as optik;

// center of curvature
// <pygmentize>
point mVertex = (0, 0);
vector oAxis = (-1, 0);
real focus = 12;


ConcaveMirror m = ConcaveMirror(mVertex, oAxis, focus);
m.setupMirrorSize(upAngle=15, downAngle=15, thickness=1)
 .drawMirror()
;
// </pygmentize>
