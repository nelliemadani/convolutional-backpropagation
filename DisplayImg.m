function DisplayImg(z,x,y)


map = [0:255; 0:255; 0:255]'/255;
colormap(map)
z = 255*z/(max(max(z)));
image(x,y,z);
colorbar
axis('image')

