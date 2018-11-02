clc;
clear;
close all;
load('matlab.mat');
file_name = '1540793504926375314';
left_img = imread(['/home/irap/Desktop/20181029/20181029_150838_calib_data2/image/stereo_left/' file_name '.png']);
right_img = imread(['/home/irap/Desktop/20181029/20181029_150838_calib_data2/image/stereo_right/' file_name '.png']);
left_RGB = demosaic(left_img,'rggb');
right_RGB = demosaic(right_img,'rggb');
[J1,J2] = rectifyStereoImages(left_RGB,right_RGB,stereoParams);
figure;

imshow([J1 J2]);
hold on;
for i = 0:30:size(J1,1) -2
    line([1, size(J1,2)+size(J2,2)],[1+i,1+i]);    
end
