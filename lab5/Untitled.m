clear all;
clear vars;

img = [3,2,3,0;2,0,1,2;1,0,1,3]; 
glcm(img);
function out = glcm(img_in)
A = zeros(255);
    for y = 1:size(img_in)
        for x = 1:size(img_in,2)
            
            A(img_in(y), img_in(x)) = A(img_in(y), img_in(x)) + 1;
        
        end
    end
        
        
   
   out = A;
end