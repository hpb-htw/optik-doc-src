settings.tex="lualatex";
settings.outformat="pdf";

import geometry;
import "../optik.asy" as optik;

size(4cm, 0);

point entry = (0, 0);
vector direction = (1, 1);

line l = line(entry, entry+direction);

dot(entry);
dot(entry+direction);

draw(l, Arrow(position=0.5));
