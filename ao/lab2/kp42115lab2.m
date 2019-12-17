clear all;
close all;

%% Zadanie 2.1
% Wykorzystujac srodowisko MATLAB z biblioteka OpenCV dokonaæ binaryzacji
% obrazów z udostepnionej bazy obrazów testowych DIBCO w uzyciem metody
% Otsu dla roznych metod konwersji obrazu kolorowego do skali szarosci.

% Wczytanie obrazow, na ktorych bedziemy pracowac i zmiana palety barw

img_H05 = imread('H05.png');
img_H10 = imread('H10.png');
img_H08 = imread('H08.png');

gray_H05 = rgb2gray(img_H05);
gray_H10 = rgb2gray(img_H10);
gray_H08 = rgb2gray(img_H08);

xyz_H05 = rgb2xyz(img_H05); xyz_H05 = xyz_H05(:, :, 2);
xyz_H10 = rgb2xyz(img_H10); xyz_H10 = xyz_H10(:, :, 2);
xyz_H08 = rgb2xyz(img_H08); xyz_H08 = xyz_H08(:, :, 2);

lab_H05 = rgb2lab(img_H05); lab_H05 = lab_H05(:, :, 1);
lab_H10 = rgb2lab(img_H10); lab_H10 = lab_H10(:, :, 1);
lab_H08 = rgb2lab(img_H08); lab_H08 = lab_H08(:, :, 1);

yuv_H05 = rgb2lab(img_H05); yuv_H05 = yuv_H05(:, :, 1);
yuv_H10 = rgb2lab(img_H10); yuv_H10 = yuv_H10(:, :, 1);
yuv_H08 = rgb2lab(img_H08); yuv_H08 = yuv_H08(:, :, 1);

hsv_H05 = rgb2lab(img_H05); hsv_H05 = hsv_H05(:, :, 3);
hsv_H10 = rgb2lab(img_H10); hsv_H10 = hsv_H10(:, :, 3);
hsv_H08 = rgb2lab(img_H08); hsv_H08 = hsv_H08(:, :, 3);

hls_H05 = rgb2lab(img_H05); hls_H05 = hls_H05(:, :, 2);
hls_H10 = rgb2lab(img_H10); hls_H10 = hls_H10(:, :, 2);
hls_H08 = rgb2lab(img_H08); hls_H08 = hls_H08(:, :, 2);

% Wczytanie obrazów referencyhnych

t = Tiff('H05.tif','r');
tif_H05 = read(t);
close(t);
t = Tiff('H10.tif','r');
tif_H10 = read(t);
close(t);
t = Tiff('H08.tif','r');
tif_H08 = read(t);
close(t);

% Binaryzacja metoda Otsu

gray_otsu_img_H05 = bin_otsu(gray_H05);
gray_otsu_img_H10 = bin_otsu(gray_H10);
gray_otsu_img_H08 = bin_otsu(gray_H08);

xyz_otsu_img_H05 = bin_otsu(xyz_H05);
xyz_otsu_img_H10 = bin_otsu(xyz_H10);
xyz_otsu_img_H08 = bin_otsu(xyz_H08);

hsv_otsu_img_H05 = bin_otsu(hsv_H05);
hsv_otsu_img_H10 = bin_otsu(hsv_H10);
hsv_otsu_img_H08 = bin_otsu(hsv_H08);

lab_otsu_img_H05 = bin_otsu(lab_H05);
lab_otsu_img_H10 = bin_otsu(lab_H10);
lab_otsu_img_H08 = bin_otsu(lab_H08);

hls_otsu_img_H05 = bin_otsu(hls_H05);
hls_otsu_img_H10 = bin_otsu(hls_H10);
hls_otsu_img_H08 = bin_otsu(hls_H08);

yuv_otsu_img_H05 = bin_otsu(yuv_H05);
yuv_otsu_img_H10 = bin_otsu(yuv_H10);
yuv_otsu_img_H08 = bin_otsu(yuv_H08);

% Binaryzacja metodami savuola i niblack dla ró¿nych palet barw

gray_savuola_H05 = sauvola(gray_H05, [21,21]);
gray_savuola_H10 = sauvola(gray_H10, [21,21]);
gray_savuola_H08 = sauvola(gray_H08, [21,21]);
gray_niblack_H05 = niblack(gray_H05, [65,65], -0.8);
gray_niblack_H10 = niblack(gray_H10, [65,65], -0.8);
gray_niblack_H08 = niblack(gray_H08, [65,65], -0.8);

xyz_savuola_H05 = sauvola(xyz_H05, [21,21]);
xyz_savuola_H10 = sauvola(xyz_H10, [21,21]);
xyz_savuola_H08 = sauvola(xyz_H08, [21,21]);
xyz_niblack_H05 = niblack(xyz_H05, [65,65], -0.8);
xyz_niblack_H10 = niblack(xyz_H10, [65,65], -0.8);
xyz_niblack_H08 = niblack(xyz_H08, [65,65], -0.8);

lab_savuola_H05 = sauvola(lab_H05, [21,21]);
lab_savuola_H10 = sauvola(lab_H10, [21,21]);
lab_savuola_H08 = sauvola(lab_H08, [21,21]);
lab_niblack_H05 = niblack(lab_H05, [65,65], -0.8);
lab_niblack_H10 = niblack(lab_H10, [65,65], -0.8);
lab_niblack_H08 = niblack(lab_H08, [65,65], -0.8);

yuv_savuola_H05 = sauvola(yuv_H05, [21,21]);
yuv_savuola_H10 = sauvola(yuv_H10, [21,21]);
yuv_savuola_H08 = sauvola(yuv_H08, [21,21]);
yuv_niblack_H05 = niblack(yuv_H05, [65,65], -0.8);
yuv_niblack_H10 = niblack(yuv_H10, [65,65], -0.8);
yuv_niblack_H08 = niblack(yuv_H08, [65,65], -0.8);

hsv_savuola_H05 = sauvola(hsv_H05, [21,21]);
hsv_savuola_H10 = sauvola(hsv_H10, [21,21]);
hsv_savuola_H08 = sauvola(hsv_H08, [21,21]);
hsv_niblack_H05 = niblack(hsv_H05, [65,65], -0.8);
hsv_niblack_H10 = niblack(hsv_H10, [65,65], -0.8);
hsv_niblack_H08 = niblack(hsv_H08, [65,65], -0.8);

hls_savuola_H05 = sauvola(hls_H05, [21,21]);
hls_savuola_H10 = sauvola(hls_H10, [21,21]);
hls_savuola_H08 = sauvola(hls_H08, [21,21]);
hls_niblack_H05 = niblack(hls_H05, [65,65], -0.8);
hls_niblack_H10 = niblack(hls_H10, [65,65], -0.8);
hls_niblack_H08 = niblack(hls_H08, [65,65], -0.8);

%% Zadanie 2.3
% W celu porównania wynikow wykorzystac dostepne implementacje wskaznikow:
% DRD, MPM, PSNR, Precision, Recall oraz F-Measure stosujac obrazy
% referencyjne dostepne w bazie DIBCO („ground-truth”). 

gray_otsu_H05 = objective_evaluation_core(, tif_H05);
xyz_otsu_H05 = objective_evaluation_core(, tif_H05);
lab_otsu_H05 = objective_evaluation_core(, tif_H05);
yuv_otsu_H05 = objective_evaluation_core(, tif_H05);
hsv_otsu_H05 = objective_evaluation_core(, tif_H05);
hls_otsu_H05 = objective_evaluation_core(, tif_H05);

gray_niblack_H05 = objective_evaluation_core(, tif_H05);
xyz_niblack_H05 = objective_evaluation_core(, tif_H05);
lab_niblack_H05 = objective_evaluation_core(, tif_H05);
yuv_niblack_H05 = objective_evaluation_core(, tif_H05);
hsv_niblack_H05 = objective_evaluation_core(, tif_H05);
hls_niblack_H05 = objective_evaluation_core(, tif_H05);

gray_savuola_H05 = objective_evaluation_core(, tif_H05);
xyz_savuola_H05 = objective_evaluation_core(, tif_H05);
lab_savuola_H05 = objective_evaluation_core(, tif_H05);
yuv_savuola_H05 = objective_evaluation_core(, tif_H05);
hsv_savuola_H05 = objective_evaluation_core(, tif_H05);
hls_savuola_H05 = objective_evaluation_core(, tif_H05);

gray_otsu_H08 = objective_evaluation_core(, tif_H08);
xyz_otsu_H08 = objective_evaluation_core(, tif_H08);
lab_otsu_H08 = objective_evaluation_core(, tif_H08);
yuv_otsu_H08 = objective_evaluation_core(, tif_H08);
hsv_otsu_H08 = objective_evaluation_core(, tif_H08);
hls_otsu_H08 = objective_evaluation_core(, tif_H08);

gray_niblack_H08 = objective_evaluation_core(, tif_H08);
xyz_niblack_H08 = objective_evaluation_core(, tif_H08);
lab_niblack_H08 = objective_evaluation_core(, tif_H08);
yuv_niblack_H08 = objective_evaluation_core(, tif_H08);
hsv_niblack_H08 = objective_evaluation_core(, tif_H08);
hls_niblack_H08 = objective_evaluation_core(, tif_H08);

gray_savuola_H08 = objective_evaluation_core(, tif_H08);
xyz_savuola_H08 = objective_evaluation_core(, tif_H08);
lab_savuola_H08 = objective_evaluation_core(, tif_H08);
yuv_savuola_H08 = objective_evaluation_core(, tif_H08);
hsv_savuola_H08 = objective_evaluation_core(, tif_H08);
hls_savuola_H08 = objective_evaluation_core(, tif_H08);

gray_otsu_H10 = objective_evaluation_core(, tif_H10);
xyz_otsu_H10 = objective_evaluation_core(, tif_H10);
lab_otsu_H10 = objective_evaluation_core(, tif_H10);
yuv_otsu_H10 = objective_evaluation_core(, tif_H10);
hsv_otsu_H10 = objective_evaluation_core(, tif_H10);
hls_otsu_H10 = objective_evaluation_core(, tif_H10);

gray_niblack_H10 = objective_evaluation_core(, tif_H10);
xyz_niblack_H10 = objective_evaluation_core(, tif_H10);
lab_niblack_H10 = objective_evaluation_core(, tif_H10);
yuv_niblack_H10 = objective_evaluation_core(, tif_H10);
hsv_niblack_H10 = objective_evaluation_core(, tif_H10);
hls_niblack_H10 = objective_evaluation_core(, tif_H10);

gray_savuola_H10 = objective_evaluation_core(, tif_H10);
xyz_savuola_H10 = objective_evaluation_core(, tif_H10);
lab_savuola_H10 = objective_evaluation_core(, tif_H10);
yuv_savuola_H10 = objective_evaluation_core(, tif_H10);
hsv_savuola_H10 = objective_evaluation_core(, tif_H10);
hls_savuola_H10 = objective_evaluation_core(, tif_H10);

%% Zadanie 2.4
% Wyniki zebrac w tabeli (macierzy) zapisanej w pliku *.mat. Okreslic, ktora z
% metod pozwala osiagnac najlepsze wyniki binaryzacji dla calej bazy w odniesieniu
% do obrazow referencyjnych.


%% Definicje funkcji wraz z implementacjami

function out = bin_otsu(image)
    img_gray = rgb2gray(image);
    TH = graythresh(img_gray)*255;
    out = img_gray > TH;
end

function out = readTiffImage(path_to_image)
    
end

function out = showImage(img_name, description)
    imshow(img_name);
    title(description);
end

function out = showParameters(object, object_name)
    fprintf(object_name);
    fprintf('\nPrecision = %9.5f\n', object.Precision);
    fprintf('DRD = %9.5f\n', object.DRD);
    fprintf('MPM = %9.5f\n', object.MPM);
    fprintf('Recall = %9.5f\n', object.Recall); 
    fprintf('Fmeasure = %9.5f\n', object.Fmeasure);  
    fprintf('PSNR = %9.5f\n', object.PSNR);
end

