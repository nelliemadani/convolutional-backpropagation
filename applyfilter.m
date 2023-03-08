function pz=applyfilter(pz,filter,numangles)

% Apply filter to each projection angle

for j=1:numangles
    pz(j,:) = conv(pz(j,:),filter,'same');
    
    %padding
    %pz(j,:) = tmp(1,1:NN);
end
  
%{
if strcmp('cosine',name)==1
    figure(7);
elseif strcmp('rect',name)==1
    figure(8);
else
    figure(9);
end
DisplayImg(pz,x,theta)
title('Filtered Sinogram for '+ string(name))
%}
