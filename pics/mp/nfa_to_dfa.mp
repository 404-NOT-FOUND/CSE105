
input simple_automata;
u := 40pt;

% --------------------------------------------------

beginfig(0); %% nfa

with spacing((55,62)) matrix.a(3,5);

% line 1
node.a[0][1]( TEX("5") );
node_double.a[0][2]( TEX("6") );

% line 2
node.a[1][0]( TEX("1") );
node.a[1][1]( TEX("2") );
node.a[1][2]( TEX("3") );
node.a[1][3]( TEX("8") );
node_double.a[1][4]( TEX("9") );

% line 3
node.a[2][1]( TEX("4") );
node_double.a[2][2]( TEX("7") );

incoming(0, "") (a[1][0]) 120;

simple_connect( a1 0, a1 1, 0, "$\varepsilon$" );
simple_connect( a1 1, a1 2, 0, "$b$" );
simple_connect( a1 2, a1 3, 0, "$\varepsilon$" );
simple_connect( a1 3, a1 4, 0, "$a$" );

simple_connect( a1 0, a0 1, 0, "$a$" );
simple_connect( a0 1, a0 2, 0, "$\varepsilon$" );
simple_connect( a0 2, a1 1, 0, "$\varepsilon$" );
simple_connect( a0 2, a1 4, 0, "$b$" );

simple_connect( a1 0, a2 1, 0, "$a$" );
simple_connect( a2 1, a2 2, 0, "$\varepsilon$" );
simple_connect( a2 2, a1 4, 0, "$b$" );

endfig;
% --------------------------------------------------

beginfig(1); %% dfa of fig 0;

with spacing((55,29)) matrix.a(3,3);

% line 1
node_double.a[0][1]( TEX("2") );
node_double.a[0][2]( TEX("4") );

% line 2
node.a[1][0]( TEX("1") );

% line 3
node.a[2][1]( TEX("3") );
node_double.a[2][2]( TEX("5") );

incoming(0, "") (a[1][0]) 120;

simple_connect( a1 0, a0 1, 80, "$a$" );
simple_connect( a0 1, a0 2, 0, "$b$" );

simple_connect( a1 0, a2 1, -80, "$b$" );
simple_connect( a2 1, a2 2, 0, "$a$" );

simple_connect( a0 2, a2 2, 0, "$a$" );

endfig;
% --------------------------------------------------

end

