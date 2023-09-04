function u = com(t)
% The function allows the generation of a signal made of a 
% succession of slots with random amplitude and duration (amplitude in
% [0,10], and duration in [0,50]); The number of values gerarated is t.
    u = [];
     while length(u) < length(t)
        for i = 1:(5+rand*5)
            u = [ u ; rand*10*ones(fix(rand*50),1)];
        end
     end
     u = u(:);
     u = u(1:length(t));
end