clear all;
image1 = imread("mono_figury.bmp");
imshow(image1);

size_image = size(image1);
S=zeros(size_image);

for w=1:size_image(1)
   S(w,1)=image1(w,1);
   S(w,size_image(2))=image1(w,size_image(2));
end   
for h=1:size_image(2)
   S(1,h)=image1(1,h);
   S(size_image(1),h)=image1(size_image(1),h);
end  
se = ones(3,3);
image_temp=S;
image_temp1=S;
while(1)
    image_temp1=image_temp;
    image_temp=imdilate(image_temp,se);
    
    if(sum(bitxor(image_temp,image_temp1),'all')==0)
        break;
    end    
end
figure();
imshow(image_temp);