function [plotPoints] = plotSpacecraftKeypoints(img,points)
% This function plots the selected image and it's spacecraft's corresponding 11 keypoints and color codes the points as follows:
%   White - Bottom first point
%   Red - Other 3 bottom points
%   Green - Top 4 points
%   Yellow - 3 antenna tip points

x = points(1:11);
y = points(12:22);

imshow(img)
hold on
for i = 1:size(x,2)
    if i == 1
        plot(x(i),y(i),"xw","MarkerSize",6)
    elseif i <= 4
        plot(x(i),y(i),"xr","MarkerSize",6)
    elseif i <= 8
        plot(x(i),y(i),"xg","MarkerSize",6)
    else
        plot(x(i),y(i),"xy","MarkerSize",6)
    end
end
hold off

plotPointsTemp = getframe;
plotPoints = plotPointsTemp.cdata;