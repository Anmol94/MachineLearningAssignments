s=double(imread('cameraman.tif'));
g=imhist(s);
[m,n]=size(s);

g=reshape(s,1,m*n);
gauss=fitgmdist(double(g'),2);
mu=gauss.mu;
sigma=gauss.Sigma;
im1=zeros([m,n]);


for i=1:m
    for j=1:n
        Y1 = (1/(sigma(:,:,1)*(2*pi)^(1/2)))*exp((-1*((s(i,j)-mu(1))^2)/(2*(sigma(:,:,1)^2))));
         Y2 = (1/(sigma(:,:,2)*(2*pi)^(1/2)))*exp((-1*((s(i,j)-mu(2))^2)/(2*(sigma(:,:,2)^2))));
           if Y1<Y2
               im1(i,j)=255;
           else im1(i,j)=0;
           end
    end
end

imshow(uint8(im1))