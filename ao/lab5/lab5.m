clear all;
close all;
clear vars;

img1 = rgb2gray(imread('T01.bmp'));
img2 = rgb2gray(imread('T02.bmp'));
img3 = rgb2gray(imread('T04.bmp'));
img4 = rgb2gray(imread('T05.bmp'));
img5 = rgb2gray(imread('T06.bmp'));
img6 = rgb2gray(imread('T07.bmp'));
img7 = rgb2gray(imread('T08.bmp'));
img8 = rgb2gray(imread('T10.bmp'));
img9 = rgb2gray(imread('T15.bmp'));
img10 = rgb2gray(imread('T20.bmp'));


test_matrix = [3,2,3,0 ; 2,0,1,2 ; 1,0,1,3];
test_matrix = uint8(test_matrix);

my_glcm_matrix = GLCMMatrix(test_matrix, [0 1], 0, 1);

asm = ASM(my_glcm_matrix);
contrast_glcm  = contrast(my_glcm_matrix);
jednorodnosc = homogenity(my_glcm_matrix);
futetes =  GLCM_Features1(my_glcm_matrix,0)

function out = homogenity(C)
suma=0;
    for(a=1:size(C,1))
        for(b= 1:size(C,2))
            suma = suma + (C(a,b) /(1+((a-b)^2)));
        end
    end
    out = suma;
end


function out = contrast(C)
suma=0;
    for(a=1:size(C,1))
        for(b= 1:size(C,2))
            suma = suma + C(a,b) * (a-b)^2;
        end
    end
    out = suma;
end

function out = ASM(C)
suma=0;
    for(a=1:size(C,1))
        for(b= 1:size(C,2))
            suma = suma + C(a,b)^2;
        end
    end
    out = suma;
end




function out = GLCMMatrix(img_gray, vector, symetric, norm)
    s = size(img_gray) - vector;

    glcm = zeros(256);

    for i = 1:s(1)
        for j = 1:s(2)
            coor_1 = img_gray(i, j) + 1;
            coor_2 = img_gray(i + vector(1), j + vector(2)) + 1;
            
            
            glcm(coor_1, coor_2) = glcm(coor_1, coor_2) + 1;
        end
    end
    
    if (1 == symetric)
        glcm = glcm + glcm';
    end   
    
    if (1 == norm)
        glcm = glcm / sum(glcm, 'all');
    end
    
    if (1 == norm && 1 == symetric)
        glcm = glcm + glcm';
        glcm = glcm / sum(glcm, 'all');
    end
    
    out = glcm;
end





