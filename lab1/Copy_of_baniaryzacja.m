clear all;

image1 = imread('Koala.jpg');
image1=imnoise(image1,'salt & pepper');
image2 = rgb2gray(image1);

cv_image = cv.cvtColor(image1,'RGB2XYZ');%zmianan palety barw na ciexyz, imshow nie wyswietli tego bo nie jest rgb
luminancja=cv_image(:,:,2);%wyci¹gamy luminancje
th_cv=graythresh(luminancja)*255;%matoda otsu

th=116;%próg binaryzacji 
% th=graythresh(image2)*255;%matoda otsu

image3 = image2 > th; %binaryzacja przez skalar
image_cv = image2 > th_cv; %binaryzacja przez skalar
histogram=imhist(image2);%histogram

image_xor=bitxor(image3,image_cv);

suma=sum(image_xor,'all');

% bar(histogram);szukamy siod³a, próg binaryzacji, dolina miedzy maksimami
% figure();
adaptacyjnaMean = cv.adaptiveThreshold(luminancja,'BlockSize',13);
adaptacyjnaGaussian = cv.adaptiveThreshold(luminancja,'Method','Gaussian','BlockSize',11);
% imshow(adaptacyjnaMean);
% figure();
% imshow(adaptacyjnaGaussian);
% imshow(image3);
% figure();
% imshow(image_xor);