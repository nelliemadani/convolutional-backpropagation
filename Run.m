% Convolution Backprojection (CBP)



% Set image size NN
N = 402;
NN = 2*N+1;

% Set filter length L
L = NN;

%coordinates
x = -N:N;
y = -N:N;


% Create orginal image (camera man)

z = imread("camerman.jpg");


figure(1);
image(z)
title('Orginal Image')
xlabel('x coordinate')
ylabel('y coordinate')


% Forward project image to form sinogram (pz)

theta=0:1:179;
numangles=numel(theta);

%line projections
pz = Project(rgb2gray(z),theta);


figure(2);
DisplayImg(pz,x,theta);
title('Sinogram or Projections of Phantom')
xlabel('Projection angle')
ylabel('Projection Displacement')


% Compute filter for CBP

[s,f1,f2,f3] = Filters(L);

filters=[f1 f2 f3]; % cosine, rect, hamming respectively

 %cosine
pz1=applyfilter(pz,f1,numangles);
%rect
pz2=applyfilter(pz,f2,numangles);
%hamming
pz3=applyfilter(pz,f3,numangles);

filtprojs=[pz1 pz2 pz3];

% Compute full reconstruction
for k=0:1:3

   if k==0
     zz = BackProj(pz,theta);
     figure(7);
     DisplayImg(zz,x,y)
     title('Completely Reconstructed without filtering');
     xlabel('x coordinate');
     ylabel('y coordinate');
   
   elseif k==1
     zz = BackProj(pz1,theta);
     figure(8);
     DisplayImg(zz,x,y)
     title('Completely Reconstructed using cosine window product with ramp');
     xlabel('x coordinate');
     ylabel('y coordinate');
   elseif k==2
     zz = BackProj(pz2,theta);
     figure(9);
     DisplayImg(zz,x,y)
     title('Completely Reconstructed using rect window product with ramp');
     xlabel('x coordinate');
     ylabel('y coordinate');
   else
     zz = BackProj(pz3,theta);
     figure(10);
     DisplayImg(zz,x,y)
     title('Completely Reconstructed using hamming window product with ramp');
     xlabel('x coordinate');
     ylabel('y coordinate');
   end
end


