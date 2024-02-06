function  [cameraParamMatlab,intrinsicsOpenCV] = cameraParameters_Cubesat(cameraParameters)
% This function uses the provided camera properties to generate the camera parameters in MATLAB and OpenCV format
 
intrinsicsOpenCV = cameraParameters.cameraMatrix;
distortionCoeff = cameraParameters.distCoeffs;
imageSize = [cameraParameters.Nu cameraParameters.Nv];
cameraParamMatlab = cameraIntrinsicsFromOpenCV (intrinsicsOpenCV,distortionCoeff,imageSize);