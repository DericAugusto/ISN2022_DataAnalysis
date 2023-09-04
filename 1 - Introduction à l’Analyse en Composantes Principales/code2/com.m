function u = com(t)
u = [];
while length(u) < length(t)
    for i=1:5+rand*5
      u = [ u ; rand*10*ones(fix(rand*50),1)];
    end
end
u = u(:);
u = u(1:length(t));
end