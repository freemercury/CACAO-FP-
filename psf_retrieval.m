 function psf = psf_retrieve(latent_img,blurred_img,n,alpha)
%n是设置的迭代次数
%alpha是设置的可调参量
psfsize = [64, 64];

psf = ones(size(latent_img));

latent_f =fft2(fftshift(latent_img));

blurred_f = fft2(fftshift(blurred_img));

while n > 0
   
    otf = psf2otf(psf,size(latent_img));
   
    temp = latent_f'*(blurred_f-latent_f*otf)./(det(latent_f)^2+alpha); 
    
    otf_new =otf + (latent_f./max(latent_f))*temp;
    
    psf = real(otf2psf(otf_new,psfsize));
    
    psf(psf<0) = 0;
   
    psf = psf./sum(sum(psf));%归一化
   
    n = n-1;
end
end

