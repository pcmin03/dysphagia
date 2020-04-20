img = im2double( imread([ImageDir 'practice5.bmp']) ); 
[ny,nx,nc] = size(img); 
d = reshape( img, ny*nx, nc );  
k = 2; % number of clusters 
[l0 c] = kmeans( d, k ); 
l0 = reshape( l0, ny, nx ); 
