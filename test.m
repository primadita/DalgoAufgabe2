clear;
clc;
IMAGE_SZ = 128;

[ ids1, ids2 ] = ndgrid( 1:IMAGE_SZ, 1:IMAGE_SZ );
       
k = [ 1; 1 ]; wu = 1; t = 1; g = 0.01;
       
image1(:,:) = exp(i .* k(1) .* ids1 - wu .* t) .* exp(- g .* k(1)./sqrt(k(1).^2 + k(2).^2) .* ids1);
image2(:,:) = exp(i .* k(2) .* ids2 - wu .* t) .* exp(- g .* k(2)./sqrt(k(1).^2 + k(2).^2) .* ids2);
       
imageges = image1 + image2;
imagesc(log(abs(imageges)))
figure
surf(abs(imageges)) 