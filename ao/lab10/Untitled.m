clear all;
close all;
clear vars;

% img1 = rgb2gray(imread('T01.bmp'));
img1 = imread('mono_figury.bmp');
SE = [1,1,1;1,1,1;1,1,1];


centra_obiektow = centroid(img1);

imshow(otwarcie(img1,SE));
figure;
imshow(zamkniecie(img1,SE));
figure;
imshow(automediana(img1,SE));
figure;
imshow(gradientmorfologiczny(img1,SE));
figure;
imshow(strefawplywow(img1));
function out = zamkniecie(img1,SE)
out=max(img1,imopen(imclose(imopen(img1,SE),SE),SE));
end

function out = otwarcie(img1,SE)
out=min(img1,imclose(imopen(imclose(img1,SE),SE),SE));
end

function out = automediana(img1,SE)
out=max(imopen(imclose(imopen(img1,SE),SE),SE),min(img1,imclose(imopen(imclose(img1,SE),SE),SE)));
end

function out = gradientmorfologiczny(img1,SE)
out=imdilate(img1,SE) - imerode(img1,SE);
end

function out = gradientmorfologicznywewnetrzny(img1,SE)
out=img1 - imerode(img1,SE);
end

function out = gradientmorfologicznyzewnetrzny(img1,SE)
out=imdilate(img1,SE) - img1;
end

function out = laplasjanmorfologiczny(img1,SE)
out= gradientmorfologicznyzewnetrzny(img1,SE) - gradientmorfologicznywewnetrzny(img1,SE);
end

function out = tophat(img1,SE)
out=img1 - min(img1,imclose(imopen(imclose(img1,SE),SE),SE));
end

function out = bootomhat(img1,SE)
out=max(img1,imopen(imclose(imopen(img1,SE),SE),SE)) - img1;
end

function out = szkielet(img1)
out=bwmorph(img1,'skel',Inf);
end

function out = centroid(img1)
out=regionprops(img1,'centroid');
end

function out = strefawplywow(img1)

out=watershed(img1);
end