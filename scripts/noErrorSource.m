%Script to see if we are able to get the same camera parameters from a
%ideal camera reprojecting its points 

calibrationFolder = 'mono';

[markerParameters, calibrationParameters, imagesPath] = prepareCalibrationEnvironment(calibrationFolder);

[imagePoints, boardSize, imagesUsedDetection] = detectCheckerboardPoints(imagesPath);

cameraParams = calculateCameraParametersPoints(markerParameters, calibrationParameters, imagePoints);

%%

auxiliarCameraParameters = createCameraParameter(markerParameters, calibrationParameters, cameraParams);

recalculatedCameraParameters = calculateCameraParametersPoints(...
    markerParameters,... 
    calibrationParameters, ...
    auxiliarCameraParameters.ReprojectedPoints);

[~, maxError] = differenceBetweenCameraParams(recalculatedCameraParameters,cameraParams);

maxError