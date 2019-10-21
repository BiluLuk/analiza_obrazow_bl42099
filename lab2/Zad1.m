clear all;
image1 = imread("H01.png");

[X, map] = imread('H01_GT.tif');
imshow(X,map);

figure;
imshow(binOtsu(image1));


function out = binOtsu(image)
img_cvt = cv.cvtColor(image, 'RGB2GRAY');
th = graythresh(img_cvt)*255;
img_bin = img_cvt > th;
out = img_bin;
end