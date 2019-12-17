clear all;
close all;
%% Zadanie 1.1
% Wykorzystuj¹c œrodowisko MATLAB z bibliotek¹ OpenCV dokonaæ binaryzacji
% obrazu kolorowego po uprzedniej jego konwersji do skali szaroœci. W celu
% konwersji do skali szaroœci mo¿liwe jest wykorzystanie funkcji cv.cvtColor
% z parametrem RGB2GRAY. Binaryzacja metod¹ Otsu mo¿e byæ wykonana za
% pomoc¹ polecenia cv.threshold.

image = imread("koala.jpg");

% Dodanie szumu salt and pepper do obrazka. Nale¿y odkomentowaæ linijke ponizej dla zadania 4
% porównanie obrazu nastepuje w diffCount.
% image = imnoise(image, 'salt & pepper');
imshow(image);
figure

%to gray
img_gray = rgb2gray(image);
img_hist = imhist(img_gray);
bar(img_hist);
imshow(img_gray);
figure

%binarize
TW = 116; %próg binaryzacji
img_bin = img_gray > TW;
imshow(img_bin);
figure

%binarize otsu
th = graythresh(img_gray)*255;
%th
 
%% Zadanie 1.2
% Zbadaæ wp³yw sposobu konwersji obrazu kolorowego do skali szaroœci na wynik
% binaryzacji metod¹ Otsu wybieraj¹c odpowiedni¹ sk³adow¹ reprezentuj¹c¹ jasnoœæ
% z modelu CIE XYZ uzyskanych za pomoc¹ funkcji cv.cvtColor.

img_cvt = cv.cvtColor(image, 'RGB2XYZ'); %zmiana palety barw
Y = img_cvt(:, :, 2); %wybór palety jasnoœci
img_cvt_th = graythresh(Y) * 255; %otsu obrazu
img_cvt_bin = Y > img_cvt_th; %binaryzacja
 
img_xor = bitxor(img_cvt_bin, img_bin); %xor obrazu róŸnic
imshow(img_xor);
figure

diffCount = sum(img_xor, 'all'); %iloœæ elementów ró¿ni¹cych siê
%diffCount

%% Zadanie 1.3
% Powtórzyæ eksperymenty dla progowania adaptacyjnego z u¿yciem funkcji
% cv.adaptiveThreshold z paramaterami „Mean” oraz „Gaussian”
% okreœlaj¹cymi wybór metody progowania adaptacyjnego.

img_adapt_mean = cv.adaptiveThreshold(img_gray, 'BlockSize', 11);
imshow(img_adapt_mean);
figure
img_adapt_gauss = cv.adaptiveThreshold(img_gray, 'Method', 'Gaussian', 'BlockSize', 11);
imshow(img_adapt_gauss);
figure

%% Zadanie 1.5
% Wykorzystaæ dostêpne implementacje innych metod binaryzacji (Sauvola,
% Niblack, Kapur, Rosin, BHT) i porównaæ uzyskane wyniki z metod¹ Otsu.
%figure;

imshow(savoula(img_gray));
figure
imshow(niblack(img_gray));


