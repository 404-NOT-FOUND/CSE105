
input simple_automata;
u := 40pt;

% --------------------------------------------------

beginfig(0);

with spacing((62,62)) matrix.a(3,3);

node.a[0][1]( TEX("A") );

node_double.a[1][0]( TEX("B") );
node.a[1][2]( TEX("C") );

node.a[2][0]( TEX("D") );
node.a[2][2]( TEX("E") );

incoming(0, "") (a[1][0]) 120;

simple_loop( a1 0, "left", "$0$" );
simple_connect( a1 0, a0 1, 0, "$1$" );

simple_connect( a0 1, a1 2, 0, "$0$" );
simple_connect( a0 1, a2 2, -40, "$1$" );

simple_connect( a1 2, a1 0, 80, "$0$" );
simple_connect( a1 2, a2 0, -80, "$1$" );

simple_connect( a2 2, a0 1, 130, "$0$" );
simple_connect( a2 2, a1 2, 0, "$1$" );

simple_connect( a2 0, a2 2, 0, "$0$" );
simple_loop( a2 0, "left", "$1$" );

endfig;
% --------------------------------------------------

end

