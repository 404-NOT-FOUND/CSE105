
input automata;
input TEX;
TEXPRE("%&latex" & char(10) & "\documentclass{article}\begin{document}");
TEXPOST("\end{document}");

string label_size;
label_size := " \small ";

% --------------------------------------------------
% simplified automata commands
% --------------------------------------------------

% loop
vardef simple_loop(suffix p)(expr d, s) = 
    if d = "left":
        loop.bot( .65, TEX(label_size & s) )( p ) -165;
    elseif d = "right":
        loop.top( .70, TEX(label_size & s) )( p ) -15;
    elseif d = "up":
        loop.urt( .35, TEX(label_size & s) )( p ) 90;
    elseif d = "down":
        loop.lrt( .65, TEX(label_size & s) )( p ) -90;
    fi;
enddef;

% connect
vardef simple_connect(suffix p, q)(expr d, s) = 
    if xpart(p.c - q.c) <> 0:
        if (d = 0) or (d = 180) or (d = -180) or (d = 360) or (d = -360):
            arrow.top( .5, TEX(label_size & s) )( p, q ) p.c -- q.c;
        elseif (d < 0) and (d > -180) or (d > 0) and (d >  180):
            arrow.bot( .5, TEX(label_size & s) )( p, q ) p.c{dir d} .. q.c;
        elseif (d > 0) and (d <  180) or (d < 0) and (d < -180):
            arrow.top( .5, TEX(label_size & s) )( p, q ) p.c{dir d} .. q.c;
        fi;
    else:
        if (d = 0) or (d = 180) or (d = -180) or (d = 360) or (d = -360):
            arrow.rt( .5, TEX(label_size & s) )( p, q ) p.c -- q.c;
        elseif (d < 0) and (d > -180) or (d > 0) and (d >  180):
            arrow.rt( .5, TEX(label_size & s) )( p, q ) p.c{dir d} .. q.c;
        elseif (d > 0) and (d <  180) or (d < 0) and (d < -180):
            arrow.rt( .5, TEX(label_size & s) )( p, q ) p.c{dir d} .. q.c;
        fi;
    fi;
enddef;

% --------------------------------------------------
% init automata settings
% --------------------------------------------------

size := 20;
incominglength := 25;
loopsize := 22;

