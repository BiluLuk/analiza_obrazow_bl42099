clear all;
close all;
%% Zadanie 1.1
% Wykorzystuj�c �rodowisko MATLAB z bibliotek� OpenCV dokona� binaryzacji
% obrazu kolorowego po uprzedniej jego konwersji do skali szaro�ci. W celu
% konwersji do skali szaro�ci mo�liwe jest wykorzystanie funkcji cv.cvtColor
% z parametrem RGB2GRAY. Binaryzacja metod� Otsu mo�e by� wykonana za
% pomoc� polecenia cv.threshold.

image = imread("koala.jpg");

% Dodanie szumu salt and pepper do obrazka. Nale�y odkomentowa� linijke ponizej dla zadania 4
% por�wnanie obrazu nastepuje w diffCount.
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
TW = 116; %pr�g binaryzacji
img_bin = img_gray > TW;
imshow(img_bin);
figure

%binarize otsu
th = graythresh(img_gray)*255;
%th
 
%% Zadanie 1.2
% Zbada� wp�yw sposobu konwersji obrazu kolorowego do skali szaro�ci na wynik
% binaryzacji metod� Otsu wybieraj�c odpowiedni� sk�adow� reprezentuj�c� jasno��
% z modelu CIE XYZ uzyskanych za pomoc� funkcji cv.cvtColor.

img_cvt = cv.cvtColor(image, 'RGB2XYZ'); %zmiana palety barw
Y = img_cvt(:, :, 2); %wyb�r palety jasno�ci
img_cvt_th = graythresh(Y) * 255; %otsu obrazu
img_cvt_bin = Y > img_cvt_th; %binaryzacja
 
img_xor = bitxor(img_cvt_bin, img_bin); %xor obrazu r�nic
imshow(img_xor);
figure

diffCount = sum(img_xor, 'all'); %ilo�� element�w r�ni�cych si�
%diffCount

%% Zadanie 1.3
% Powt�rzy� eksperymenty dla progowania adaptacyjnego z u�yciem funkcji
% cv.adaptiveThreshold z paramaterami �Mean� oraz �Gaussian�
% okre�laj�cymi wyb�r metody progowania adaptacyjnego.

img_adapt_mean = cv.adaptiveThreshold(img_gray, 'BlockSize', 11);
imshow(img_adapt_mean);
figure
img_adapt_gauss = cv.adaptiveThreshold(img_gray, 'Method', 'Gaussian', 'BlockSize', 11);
imshow(img_adapt_gauss);
figure

%% Zadanie 1.5
% Wykorzysta� dost�pne implementacje innych metod binaryzacji (Sauvola,
% Niblack, Kapur, Rosin, BHT) i por�wna� uzyskane wyniki z metod� Otsu.
%figure;

imshow(savoula(img_gray));
figure
imshow(niblack(img_gray));


