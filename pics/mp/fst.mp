
input simple_automata;
u := 40pt;

% --------------------------------------------------

beginfig(0);

with spacing((62,29)) matrix.a(1,2);

node.a[0][0]( TEX("A") );
node.a[0][1]( TEX("B") );

incoming(0, "") (a[0][0]) 120;

simple_loop( a0 0, "left", "$0/0$" );
simple_loop( a0 1, "right", "$1/0, 0/1$");
simple_connect( a0 0, a0 1, -50, "$1/10$" );

endfig;
% --------------------------------------------------

beginfig(1);

with spacing((62,29)) matrix.a(1,1);

node.a[0][0]( TEX("A") );

incoming(0, "") (a[0][0]) 180;

simple_loop( a0 0, "up", "$1/\varepsilon, 0/\varepsilon$");

endfig;
% --------------------------------------------------
%
end

