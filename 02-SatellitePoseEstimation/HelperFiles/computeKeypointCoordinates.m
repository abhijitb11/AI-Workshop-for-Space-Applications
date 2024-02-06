function [keypoints] = computeKeypointCoordinates(camera,json,vertices)


q = json.q_vbs2tango_true;
t = json.r_Vo2To_vbs_true; % [m]

keypoints = projectPoints(vertices, q, t, camera); % [2 x 11]

% % This function projects the wireframe spacecraft 3D world points to the target image from Datastore data.
% 
% keypoints = zeros(size(json,1),2*size(pointsBodyRef,1));
% 
% for i = 1:size(json)
%     q = json(i).q_vbs2tango_true';
%     r = json(i).r_Vo2To_vbs_true;
%     dcm = quat2dcm(q);
% 
%     points_camera_plane = (worldToImage(cameraParamMatlab,dcm,r,pointsBodyRef))';
% 
%     x = points_camera_plane(1,:);
%     y = points_camera_plane(2,:);
% 
%     keypoints(i,:) = [x,y];
% end