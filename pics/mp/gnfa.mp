
input simple_automata;
u := 40pt;

% --------------------------------------------------

beginfig(0);

with spacing((62,29)) matrix.a(1,2);

node.a[0][0]( TEX("s") );
node_double.a[0][1]( TEX("f") );

incoming(0, "") (a[0][0]) 120;

simple_connect( a0 0, a0 1, 0, "regex" );

endfig;
% --------------------------------------------------

end

