clear all;

image1 = imread('Koala.jpg');
image2 = rgb2gray(image1);

 imshow(sauvola(image2));