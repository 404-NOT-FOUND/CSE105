
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

end

