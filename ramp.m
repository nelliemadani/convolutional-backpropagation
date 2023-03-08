function z = ramp(s,fc)

z=zeros(size(s));

for i=1:numel(s)

    if abs(s(i))<=fc
        z(i)=abs(s(i));
    end
    
end
