close all;
clear all;
 
img = imread('mono_figury.bmp');

index_label=bwlabel(clear_edges(img));

B=(index_label==7);
imshow(B);
[row, col] = find(B);
Lv=max(row)-min(row);
Lh=max(col)-min(col);
% wspolczynnik fereta
Rf=Lh/Lv;

%pole figury
S=sum(B,'all');
L=regionprops(B,'Perimeter');

%wsp�czynnik cyrkularnosci
Rc1=2*sqrt(S/pi);
Rc2=L.Perimeter/pi;
%wspolczynnik Malinowskiej
W=L.Perimeter/(2*sqrt(pi*S))-1;

%srodek ciezkosci
ri=mean([col row]);


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