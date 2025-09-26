settings.tex="lualatex";
settings.outformat="pdf";

texpreamble("\input{shortcut.sty}");

unitsize(1mm);

import geometry;
import "optik/optik.asy" as optik;

// <pygmentize>
vector normalDir = (0, 1);
point entry = (0, 0);

PlanaMirror m = PlanaMirror(normalDir, entry);
m.setupMirrorSize(25)
 .drawMirror();
// </pygmentize>
