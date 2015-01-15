
input simple_automata;
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

% --------------------------------------------------
beginfig(0); % using package automata.mp

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

with spacing((62,29)) matrix.a(1,3);

node.a[0][0]( TEX("A") );
node_double.a[0][1]( TEX("B") );
node.a[0][2]( TEX("C") );

incoming(0, "") (a[0][0]) 120;

simple_loop( a0 0, "left", "$0$" );
simple_connect( a0 0, a0 1, 0, "$1$" );
simple_loop( a0 1, "up", "$0$" );
simple_connect( a0 1, a0 2, 0, "$1$" );
simple_loop( a0 2, "right", "$0,1$" );

endfig;
% --------------------------------------------------

end
