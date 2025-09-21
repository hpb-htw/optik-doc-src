settings.tex="lualatex";
settings.outformat="pdf";

unitsize(2mm);

import geometry;
import "../optik.asy" as optik;


vector normalDir = (0, 1);
point entry = (0, 0);
point source = (0, 30);

PlanaMirror m = PlanaMirror(normalDir, entry);
m.drawMirror(25)
 .drawEntryRay(source, 0.25)
 .drawReflectedRay(source=source, arrowPosition=0.90, rayLength=30);

