clear all;
close all;

img = imread('img3.bmp');
% zadanie 1
without_object_at_edges = clear_edges(img);
imshow(without_object_at_edges);
figure;

% zadanie 2
filled = bitxor(img, clear_edges(~img));

imshow(filled);

% zadanie 5

labeled = bwlabel(without_object_at_edges);

figure_1 = labeled == 1;
imshow(figure_1);
pole_1 = sum(figure_1, 'all')

area_aproximated = monte_carlo(figure_1, 0.4, 10)

% liczenie obwodu 

circle = chain_method(figure_1);
circle

% FUNKCJE 

function out = clear_edges(img_in)
    
    res_img = img_in;
    res_img(2:end-1,2:end-1) = false;
    se = true(3);
    
    while (1)
       tmp_img = res_img;
       res_img = bitand(imdilate(res_img, se), img_in);
       
       if (sum(bitxor(tmp_img, res_img), 'all') == 0)
          break;
       end
    end
    
    out = bitxor(img_in, res_img);
end

function out = monte_carlo(obj, percent, sample)
    number_of_elem = numel(obj);
    
    result = 0;
    for n = 1:sample
        r = randi(number_of_elem, [1, uint32(number_of_elem * percent)]);
        s = sum(obj(r), 'all');
        result = result + s * (1/percent);
    end
    out = round(result / sample);
end

% Szukanie konturów w obrazie.
function out = chain_method(image)
    Code = [0 1; 1 1; 1 0; 1 -1; 0 -1; -1 -1; -1 0; -1 1]; % kierunki następnego kroku, ;y x;
    [y x] = find(image); % szukanie pikseli, które mają wartość 1 -- piksel początkowy wyznaczania konturu.
    Start = [y(1) x(1)]; 
    Point = Start; % Aktualny piksel
    code = 7; % Zaczynamy szukanie konturu od prawego górnego piksela
    wynik = []; % tablica kolejnych kroków po konturze
    
    while 1
       idx = Point + Code(code + 1, :); % zmiana kroku : sprawia, że biorę 2 elementy z elementu XD
       
       if image(idx(1), idx(2)) % jeżeli piksel jest 1 
          wynik = [wynik code]; % dodaj opis kroku do tablicy 
          Point = idx; % zmien bieżący piksel
          code = mod(code - 2, 8); % Ustelenie kolejnego kroku   
       else
           code = mod(code + 1, 8); % Ustelenie kolejnego kroku
       end
       
       % jeżeli dojdziemy do pukntu startowego to konczymy
       if Point(1) == Start(1) && Point(2) == Start(2) && code == 7
               break;
       end
    end
    
    % liczenie obwodu
    result1 = mod(wynik, 2); % ilosc krokow po przekątnej
    out = sum(result1,'all') * sqrt(2) + sum(~result1, 'all'); % Obw = Dlugosci po przekatnej + dlugosci proste
end
