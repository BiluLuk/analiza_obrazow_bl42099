clear all;

image1 = imread('Koala.jpg');
image2 = rgb2gray(image1);

cv_image = cv.cvtColor(image1,'RGB2XYZ');%zmianan palety barw na ciexyz, imshow nie wyswietli tego bo nie jest rgb
luminancja=cv_image(:,:,2);%wyci�gamy luminancje
th_cv=graythresh(luminancja)*255;%matoda otsu

th=116;%pr�g binaryzacji 
% th=graythresh(image2)*255;%matoda otsu

image3 = image2 > th; %binaryzacja przez skalar
image_cv = image2 > th_cv; %binaryzacja przez skalar
histogram=imhist(image2);%histogram

image_xor=bitxor(image3,image_cv);

suma=sum(image_xor,'all');

% bar(histogram);szukamy siod�a, pr�g binaryzacji, dolina miedzy maksimami
% figure();
adaptacyjnaMean = cv.adaptiveThreshold(luminancja,'BlockSize',13);
adaptacyjnaGaussian = cv.adaptiveThreshold(luminancja,'Method','Gaussian','BlockSize',11);

img_noise=imnoise(image2,'salt & pepper');
binaryzacja_zaszumionego= cv.adaptiveThreshold(img_noise,'BlockSize',11);

image_xor_cv=bitxor(binaryzacja_zaszumionego,image2);

suma_roznic_cv=sum(image_xor_cv,'all');
imshow(binaryzacja_zaszumionego);
% imshow(adaptacyjnaMean);
% figure();
% imshow(adaptacyjnaGaussian);
% imshow(image3);
% figure();
% imshow(image_xor);