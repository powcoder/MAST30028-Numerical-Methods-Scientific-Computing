function test

for i = 1:100
    integral(@(x) x.^i./(x+2), 0, 1)*2 - 1/i
end