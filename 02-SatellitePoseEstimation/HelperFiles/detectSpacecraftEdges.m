function [bbox,imgMaskEdge] = detectSpacecraftEdges(img)
% This function calculates the bounding box for the spacecraft using an edge detection approach.
% This approach ONLY WORKS ON NO EARTH IN BACKGROUND IMAGES OF THE DATASET.
% This approach first applies a median filter and then adjusting the contrast of the image to remove background noise.
% It then uses a Canny edge detection algorithm with adaptive threshold to identify the edges of the spacecraft.
% It then uses the provided bounding box function to create a bounding box around the spacecraft.

imgTemp = img;
imgTemp = medfilt2(imgTemp);
imgTemp = imadjust(imgTemp,[0.09 0.4],[]);
% imgTemp = imsharpen(imgTemp); % Not needed for crop
% imgTemp = imgaussfilt(imgTemp); % Not needed for crop

cannyValue = 0.00;
cannyThreshold = size(imgTemp,1)*size(imgTemp,2);
while(cannyThreshold >= 30000)
    cannyValue = cannyValue + 0.05;
    imgMaskEdge = edge(imgTemp,"Canny",cannyValue,0.1);
    cannyThreshold = sum(imgMaskEdge,"all");
    if cannyValue > 0.95
        break;
    end
end

% Create bounding box
[y,x] = find(imgMaskEdge > 0);
imgSize = size(img);
bbox = generator_BBox_Image(imgSize, x,y);