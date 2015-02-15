
input simple_automata;
u := 40pt;

TEXPRE("%&latex" & char(10) & "\documentclass{article}\begin{document}" & char(10) &
        "\def\twolines#1#2{\makebox[0pt][l]{#1}\raisebox{10pt}{#2}}"
);

% --------------------------------------------------

beginfig(0);

with spacing((62,29)) matrix.a(1,3);

node.a[0][0]( TEX("A") );
node.a[0][1]( TEX("B") );
node_double.a[0][2]( TEX("C") );

incoming(0, "") (a[0][0]) 120;

simple_connect( a0 0, a0 1, -50, "push(\$)" );
simple_loop( a0 1, "up", "0, push(0); 1, pop(0)");
simple_connect( a0 1, a0 2, -50, "pop(\$)" );

endfig;
% --------------------------------------------------

beginfig(1);

with spacing((62,29)) matrix.a(1,3);

node.a[0][0]( TEX("A") );
node.a[0][1]( TEX("B") );
node_double.a[0][2]( TEX("C") );

incoming(0, "") (a[0][0]) 120;

simple_connect( a0 0, a0 1, -50, "push(\$)" );
simple_loop( a0 1, "up", "\twolines{0: push(0), pop(1)}{1: push(1), pop(0)}");
simple_connect( a0 1, a0 2, -50, "pop(\$)" );

endfig;
% --------------------------------------------------

beginfig(2);

with spacing((82,51)) matrix.a(2,3);

node.a[1][0]( TEX("A") );
node.a[1][1]( TEX("B") );
node_double.a[1][2]( TEX("C") );
node.a[0][1]( TEX("D") );

incoming(0, "") (a[1][0]) 120;

simple_loop( a1 0, "left", "$\varepsilon, \varepsilon \to 1$" );
simple_connect( a1 0, a1 1, 0, "$a, 1 \to \varepsilon$" );
simple_connect( a1 0, a0 1, 0, "$b, 1 \to \varepsilon$" );

simple_loop( a1 1, "down", "" );
simple_connect( a1 1, a1 2, 0, "" );

simple_loop( a1 2, "right", "" );
simple_connect( a1 2, a0 1, 0, "" );

simple_connect( a0 1, a1 1, 0, "" );

endfig;
% --------------------------------------------------

end

