function [cameraParameters, estimationErrors, imagesUsedCalibration] = ...
    calculateCameraParametersPoints(markerParameters, calibrationParameters, imagePoints)

[cameraParameters, imagesUsedCalibration, estimationErrors] = estimateCameraParameters(...
    imagePoints,...
    markerParameters.worldPoints,...
    'ImageSize', calibrationParameters.imageSize,...
    'EstimateSkew', calibrationParameters.estimateSkew,...
    'EstimateTangentialDistortion', calibrationParameters.estimateTan, ...
    'NumRadialDistortionCoefficients', calibrationParameters.nRadial,...
    'WorldUnits', 'millimeters');

if cameraParameters.MeanReprojectionError > 1
    warning('the reprojection error is big. maybe try using other/more images. Other possibility is that something is broken. Ops...')
end