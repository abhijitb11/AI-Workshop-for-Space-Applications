function [bbox] = generator_BBox_Image(imgSize,x,y)
% This function calculates the bounding box for the selected image by identifying the outer most points and using them to create the boxes.
% Criteria for bounding box:
%   Should be square
%   Should be within the boundaries of the images even if the spacecraft is partially outside the images
%   Should have a margin of 25 pixels between the outermost point and bounding box edge

boxMargins = 25;
x1 = max(min(x),1+boxMargins);
y1 = max(min(y),1+boxMargins);
w = max(x) - min(x);
h = max(y) - min(y);
bs = min(max(w,h),min(imgSize(1),imgSize(2))-2*boxMargins-2);
x1 = x1 + w/2 - bs/2;
y1 = y1 + h/2 - bs/2;

bbox = [floor(x1-boxMargins),floor(y1-boxMargins),ceil(bs+2*boxMargins),ceil(bs+2*boxMargins)];

bbox(bbox <= 0) = 1;
if bbox(1)+bbox(3) >= imgSize(2)
    bbox(1) = imgSize(2) - bbox(3) - 1;
end
if bbox(2)+bbox(4) >= imgSize(1)
    bbox(2) = imgSize(1) - bbox(4) - 1;
end