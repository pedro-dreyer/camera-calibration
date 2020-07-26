%Script to see what are the errors when the squares constituting the
%checkerboard is of a different size than expected

calibrationFolder = 'slr';
squareSize = 29;

[markerParameters, calibrationParameters, imagesPath] = prepareCalibrationEnvironment(calibrationFolder, squareSize);

[imagePoints, boardSize, imagesUsedDetection] = detectCheckerboardPoints(imagesPath);

cameraParams = calculateCameraParametersPoints(markerParameters, calibrationParameters, imagePoints);

%%

squareError = -0.2:0.1:0.2;

for iTest=1:length(squareError)

    [newMarkerParameters, ~, ~] = prepareCalibrationEnvironment(calibrationFolder, squareSize+squareError(iTest));

    auxiliarCameraParameters = createCameraParameter(newMarkerParameters, calibrationParameters, cameraParams);

    recalculatedCameraParameters = calculateCameraParametersPoints(...
        markerParameters,... 
        calibrationParameters, ...
        auxiliarCameraParameters.ReprojectedPoints);

   differenceStruct = differenceBetweenCameraParams(recalculatedCameraParameters,cameraParams);
   
   results{iTest} = differenceStruct;
end
%%
errorMatrix = [];
for iTest=1:length(squareError)
    errorMatrix = [mean(results{iTest}.TranslationVectors); errorMatrix];
end

squareErrorGraph(squareError, errorMatrix);