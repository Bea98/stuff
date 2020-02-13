% Progrmming assignment for AP3132-Advanced Digital Image Processing course
% Instructor: B. Rieger, F. Vos 
% Tutor: H. Heydarian
% Term: Q3-2020
%
% Assignment #1
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem #1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate a synthetic image of size size M1xN1 radial sinusoidal chirp with
% a spatial frequency that decreases from center to edge [1].
% [1] http://bigwww.epfl.ch/publications/thevenaz9901.pdf

M1 = 100;   % image height
N1 = 100;   % image width
km = pi;    % maximum frequency

% generate the image and plot
[x,y] = meshgrid(-100:100);
r = hypot(x,y);
rm = max(r(:));
theta = (200-r).^2; 
I1 = sin(km*theta/800);
I1 = (I1 + 1)/2;
figure;imshow(I1)
%%

% define scale factor
scale = 4;

% initial image dimensions
N1 = size(I1,1);
M1 = size(I1,2);

% new image dimensions
M2 = scale * size(I1,1);
N2 = scale * size(I1,2);

% initialize upsampled image with zero
I2 = zeros(M2, N2);

%%
% (a) nearest neighbour interpoaltion

for i=1:M2
    for j=1:N2
        
        % TODO1
        
    end
end

% plot interpolated image.
figure;imshow(I2)
%%
% (b) bilinear interpolation

for i = 1:M2
	for j = 1:N2
        
        % TODO2
		% compute the coordinates of each point in original image 
        
		% find the nearest integer coordinates
        
		% check for the boundaries. 
        % (y0,x0) should be larger than (0,0) and smaller than (N1,M1)
        
		% compute the weights (s, t) according to the lecture note
        
		% implement bilinear interpolation 
    
	end
end
figure;imshow(I2);

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem #2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% read the input image; try different MATLAB built-in images
I1 = double(imread('pout.tif'));
% I1 = double(imread('cameraman.tif'));


% apply histogram equalitzation
I2 = hist_eq(I1);

% plot the result and compare it with MATLAB built-in function
figure('units','normalized','outerposition',[0 0 1 1])

subplot(2,3,1);imshow(uint8(I1));title('Original image');
subplot(2,3,2);imshow(uint8(I2));title('Histogram equalized image');

% use MATLAB built-in function for comparison
I3 = histeq(uint8(I1));
subplot(2,3,3);imshow(I3);title('MATLAB histeq()');

% add image histograms
subplot(2,3,4); imhist(uint8(I1)) 
title('Original image histogram')
xlabel('intensity');ylabel('count')
subplot(2,3,5); imhist(uint8(I2))
title('Image histogram after equalization');
xlabel('intensity');ylabel('count')
subplot(2,3,6); imhist(uint8(I3))
title('Image histogram after equalization (MATLAB)')
xlabel('intensity');ylabel('count')