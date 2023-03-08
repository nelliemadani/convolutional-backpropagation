

function [s,f1,f2,f3] = Filters(L)

%samples and cutt off frequency for the ramp
fc=0.5;
s=linspace(-1,1,L);

%ramp
r=ramp(s,fc);
figure(3);
plot(s,r)
title('ramp filter')

%window's iffts: 

f1=real(ifftshift(ifft(fftshift(r.*cos(s)))));
f2=real(ifftshift(ifft(fftshift(r.*rect(s,fc)))));
h=transpose(hamming(numel(s)));
f3=real(ifftshift(ifft(fftshift(r.*h))));

%cosine
figure(4);
subplot(1,3,1); plot(s,cos(s))
title('cosine window in freq domain')
subplot(1,3,2); plot(s,r.*cos(s)) 
title('cosine window product with ramp in freq domain')
subplot(1,3,3); plot(s,f1)
title('ifft')
xlabel('sample number')

%rect
figure(5);
subplot(1,3,1); plot(s,rect(s,fc))
title('rect window in freq domain')
subplot(1,3,2); plot(s,r.*rect(s,fc))
title('rect window product with ramp in freq domain')
subplot(1,3,3); plot(s,f2)
title('ifft')
xlabel('sample number')

%hamming
figure(6); 
subplot(1,3,1); plot(s,h)
title('hamming window in freq domain')
subplot(1,3,2); plot(s,r.*h)
title('hamming window product with ramp in freq domain')
subplot(1,3,3); plot(s,f3)
title('ifft')
xlabel('sample number')
