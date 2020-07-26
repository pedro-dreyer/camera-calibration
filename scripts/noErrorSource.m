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

maxErrorTable = table();
parametersToCheck = {'IntrinsicMatrix', 'TranslationVectors', 'RotationVectors'};
for iParameter=1:length(parametersToCheck)
    parameterToCheck = parametersToCheck{iParameter};
    absDifference = abs(recalculatedCameraParameters.(parameterToCheck) - cameraParams.(parameterToCheck));
    maxDifference = max(absDifference(:));
    maxErrorTable.(parameterToCheck) = maxDifference;
end
maxErrorTable