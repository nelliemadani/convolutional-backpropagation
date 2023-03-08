function z = rect(s,hw)

z=zeros(size(s));

for i=1:numel(s)

    if abs(s(i))<=hw
        z(i)=1;
    end
    
end





    





