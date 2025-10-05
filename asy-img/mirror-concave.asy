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
vector oAxis = (-1, 0);
real focus = 12.5;

//show("",defaultcoordsys, blue);

ConcaveMirror m = ConcaveMirror(mVertex, oAxis, focus);
//point s = point(m.internCs, (-1.1, 0.5));
point s = (-50, 10);
dot("s", s, N);

m.setupMirrorSize(upAngle=35, downAngle=35, thickness=1)
 .drawMirror()
 .setupRaysExtend(byParallel=1.3, byFocus=1.5, byCenter=2.5)
 .drawImage(source=s)
 .labelMirrorPoint(
    centerL=Label("$\pLabel{C}$", align=SW),
    focusL=Label("$\pLabel{F}$", align=N),
    vertexL=shift(5, 0)*Label("$\pLabel{V}$", align=S)
  )
 .labelMirrorSize()
;
write((pair)s);
// </pygmentize>
