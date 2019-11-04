clear all;
close all;
 
img = imread('mono_figury.bmp');
 
without_object_at_edges = clear_edges(img);
imshow(without_object_at_edges);
figure;
 
filled = bitxor(img, clear_edges(~img));

index_label=bwlabel(clear_edges(img));

% obrazek=uint8((index_label/8)*256);
B=(index_label==2);
pole=sum(B,'all');
X = size(img);
pole_m=0;
r = randi(numel(index_label),[1,uint32(numel(index_label)*0.1)]);
for n=r
    pole_m = pole_m + index_label(n);
end    
    
imshow(B);



 
 
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