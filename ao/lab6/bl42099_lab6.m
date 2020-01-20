clear all;
image = imread("przyklad.bmp");


%%Binaryzacja bedzie na zaliczeniu%%
img_cvt = cv.cvtColor(image, 'RGB2XYZ');
Y = img_cvt(:, :, 2); %wybór palety jasnoœci

I = rgb2gray(image);

image_noisI = imnoise(I, 'salt & pepper'); %zaszumienie obrazka
image_noisY = imnoise(Y, 'salt & pepper'); %zaszumienie obrazka

image_gaussI = imnoise(I,'gaussian');
image_gaussY = imnoise(Y,'gaussian');



imwrite(I,'image_grayI.jpg');
imwrite(Y,'image_grayY.jpg');

imwrite(image_noisI,'image_noisI.jpg');
imwrite(image_noisY,'image_noisY.jpg');

imwrite(image_gaussI,'image_gaussI.jpg');
imwrite(image_gaussY,'image_gaussY.jpg');


a(1)=ssim(image_noisY,Y);
a(2)=ssim_index(image_gaussY,Y);
a(3)=ssim_index( imread("image_noisY.jpg"),Y);
a(4)=ssim_index( imread("image_gaussY.jpg"),Y);
a(5)=ssim_index( imread("image_grayY.jpg"),Y);

b(1)=ssim_index(image_noisI,I);
b(2)=ssim_index(image_gaussI,I);
b(3)=ssim_index(imread("image_noisI.jpg"),I);
b(4)=ssim_index(imread("image_gaussI.jpg"),I);
b(5)=ssim_index(imread("image_grayI.jpg"),I);

imshow(Y);
figure;
imshow(I);
