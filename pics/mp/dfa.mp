
verbatimtex
\documentclass{article}
\begin{document}
etex

input automata;
input boxes;
input TEX;
TEXPRE("%&latex" & char(10) & "\documentclass{article}\begin{document}");
TEXPOST("\end{document}");

% --------------------------------------------------

u := 40pt;
emph_pen := 6bp;
std_pen  := 0.3*emph_pen;

vardef texPnt(expr p) =
"$(" & decimal(xpart.p/u) & "," & decimal(ypart.p/u) & ")$"
enddef;

vardef drawPnt(expr p) =
    draw p withpen pencircle scaled emph_pen;
enddef;

string label_size;
label_size := " \small ";

vardef simple_loop(suffix p)(expr d, s) = 
    if d = "left":
        loop.bot( .65, TEX(label_size & s) )( p ) -165;
    elseif d = "right":
        loop.top( .65, TEX(label_size & s) )( p ) -15;
    fi;
enddef;

vardef simple_connect(suffix p, q)(expr d, s) = 
    if (d = 0) or (d = 180) or (d = -180) or (d = 360) or (d = -360):
        arrow.top( .5, TEX(label_size & s) )( p, q ) p.c -- q.c;
    elseif (d < 0) and (d > -180) or (d > 0) and (d >  180):
        arrow.bot( .5, TEX(label_size & s) )( p, q ) p.c{dir d} .. q.c;
    elseif (d > 0) and (d <  180) or (d < 0) and (d < -180):
        arrow.top( .5, TEX(label_size & s) )( p, q ) p.c{dir d} .. q.c;
    fi;
enddef;

% --------------------------------------------------
beginfig(0); % using package automata.mp

size := 20;
incominglength := 25;
loopsize := 22;

with spacing((82,29)) matrix.a(1,3);

node.a[0][0]( TEX("A") );
node_double.a[0][1]( TEX("B") );
node_double.a[0][2]( TEX("C") );

incoming(0, "") (a[0][0]) 120;

% loop.bot( .65, TEX("\small 0") )( a[0][0] ) -165;
% arrow.bot( .5, TEX("\small 1") )( a[0][0], a[0][1] ) a[0][0].c .. a[0][1].c;
% 
% arrow.bot( .5, TEX("\small 0") )( a[0][1], a[0][2] ) a[0][1].c .. a[0][2].c;
% arrow.bot( .5, TEX("\small 1") )( a[0][1], a[0][0] ) a[0][1].c{dir -135} .. a[0][0].c;
% 
% arrow.bot( .5, TEX("\small 0") )( a[0][2], a[0][1] ) a[0][2].c{dir -135} .. a[0][1].c;
% loop.top( .65, TEX("\small 1") )( a[0][2] ) -15;

simple_loop( a0 0, "left", "0" );
simple_connect( a0 0, a0 1, 0, "1" );

simple_connect( a0 1, a0 2, 0, "0" );
simple_connect( a0 1, a0 0, -135, "1" );

simple_connect( a0 2, a0 1, -135, "0" );
simple_loop( a0 2, "right", "1" );

endfig;
% --------------------------------------------------
beginfig(1); 

with spacing((82,29)) matrix.a(1,5);

node.a[0][0]( TEX("A") );
node.a[0][1]( TEX("B") );
node.a[0][2]( TEX("C") );
node.a[0][3]( TEX("D") );
node_double.a[0][4]( TEX("E") );

incoming.top(0, "start") (a[0][0]) 120;

simple_connect( a0 0, a0 1,   0, "1" );
simple_connect( a0 1, a0 2,  45, "7" );
simple_connect( a0 2, a0 3, -45, "2" );
simple_connect( a0 3, a0 4, 225, "1" );

endfig;
% --------------------------------------------------

end

