
input boxes;
input TEX;
TEXPRE("%&latex" & char(10) & "\documentclass{article}\begin{document}");
TEXPOST("\end{document}");

u = 50pt;

vardef drawArrowBetweenBoxes(suffix a,b) =
    drawarrow a.c -- b.c cutbefore bpath.a cutafter bpath.b;
enddef;

% --------------------------------------------------

beginfig(0);

boxit.regex(TEX("regex"));
boxit.nfa  (TEX("NFA"));
boxit.dfa  (TEX("DFA"));
boxit.gnfa (TEX("GNFA"));

nfa.c  - regex.c = (u,0);
dfa.c  - nfa.c   = (0, u);
gnfa.c - nfa.c   = (0,-u);

drawunboxed(regex,nfa,dfa,gnfa);

drawArrowBetweenBoxes(regex, nfa);

drawArrowBetweenBoxes(nfa, dfa);
drawArrowBetweenBoxes(dfa, nfa);
drawArrowBetweenBoxes(nfa, gnfa);

drawArrowBetweenBoxes(nfa, regex);
drawArrowBetweenBoxes(dfa, regex);
drawArrowBetweenBoxes(gnfa, regex);

endfig;
% --------------------------------------------------

           end
