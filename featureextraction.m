% Read the input image
originalImage = imread('Femur.jpg');

% Convert the image to grayscale if it's a color image
if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);
else
    grayImage = originalImage;
end

% Extract GLCM features
glcm = graycomatrix(grayImage, 'NumLevels', 256, 'Offset', [0 1; -1 1; -1 0; -1 -1], 'Symmetric', true);

% Calculate statistics from GLCM
stats = graycoprops(glcm, {'Contrast', 'Correlation', 'Energy', 'Homogeneity'});

% Extract intensity-based features
meanIntensity = mean(grayImage(:));
stdIntensity = std(double(grayImage(:)));

% Display extracted features
disp('GLCM Features:');
disp(stats);
disp('Intensity-based Features:');
disp(['Mean Intensity: ', num2str(meanIntensity)]);
disp(['Standard Deviation Intensity: ', num2str(stdIntensity)]);

% ... (continue with your existing code for processing and visualization)
