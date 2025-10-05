settings.tex="lualatex";
settings.outformat="pdf";

texpreamble("\input{shortcut.sty}");

unitsize(1mm);
//size(6cm);

import geometry;
import "optik/optik.asy" as optik;

// center of curvature
// <pygmentize>
point mVertex = (0, 0);
vector oAxis = (-1, 1);
real focus = 12.5;

//show(defaultcoordsys);
point s = (-20, 25);
//dot("S", s);


ConcaveMirror m = ConcaveMirror(mVertex, oAxis, focus);
m.setupMirrorSize(upAngle=15, downAngle=15, thickness=1)
 .drawMirror()
 .drawImage(source=s)
 .labelMirrorPoint(
    centerL=Label("$\pLabel{C}$", align=SW),
    focusL=Label("$\pLabel{F}$", align=SW),
    vertexL=shift(0,-3)*Label("$\pLabel{V}$", align=S)
  )
 .labelMirrorSize()
;
// </pygmentize>
