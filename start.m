clear;
clc;
BL = rgb2gray(imread('C:\Users\gyd\Desktop\ÎÄµµ\1.jpg'));
LA = rgb2gray(imread('C:\Users\gyd\Desktop\ÎÄµµ\2.jpg'));
BL = im2double(BL(1:1000,1:1000));
LA = im2double(LA(1:1000,1:1000));
psf = psf_retrieve(BL,LA,50,0.1);
