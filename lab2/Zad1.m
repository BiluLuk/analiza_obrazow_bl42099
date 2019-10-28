clear all;
image1 = imread("H01.png");
%%wczytywanie obrazka "tif" 

[X, map] = imread('H01_GT.tif');
imshow(X,map);
%% Binaryzacja OTSU
%Metoda GREY

figure;
imshow(binOtsu(image1,'GREY'));




function out = binaryzacja(image,method,paleta)
if(method == "OTSU")
    if(paleta == "GREY")
        figure;
        imshow(binOtsu(cv.cvtColor(image1, 'RGB2GRAY')));
    end
end

end

function out = binOtsu(image,methoda)
img_cvt = cv.cvtColor(image, methoda);
img_cvt(:,:,2);
th = graythresh(img_cvt)*255;
img_bin = image > th;
out = img_bin;
end

