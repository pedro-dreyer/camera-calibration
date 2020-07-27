%Script to see what are the errors when the squares constituting the
%checkerboard is of a different size than expected

calibrationFolder = 'mono';
squareSize = 30;

[markerParameters, calibrationParameters, imagesPath] = prepareCalibrationEnvironment(calibrationFolder, squareSize);

[imagePoints, boardSize, imagesUsedDetection] = detectCheckerboardPoints(imagesPath);

cameraParams = calculateCameraParametersPoints(markerParameters, calibrationParameters, imagePoints);

%%
meanError = 0;
standardDeviation = 0:0.05:0.3;
finalResults=[];

for iRepetition=1:100

    for iTest=1:length(standardDeviation)

        pointError = standardDeviation(iTest)*randn(size(markerParameters.worldPoints)) + meanError;

        newMarkerParameters = markerParameters;

        newMarkerParameters.worldPoints = newMarkerParameters.worldPoints + pointError;

        auxiliarCameraParameters = createCameraParameter(newMarkerParameters, calibrationParameters, cameraParams);

        recalculatedCameraParameters = calculateCameraParametersPoints(...
            markerParameters,... 
            calibrationParameters, ...
            auxiliarCameraParameters.ReprojectedPoints);

       differenceStruct = differenceBetweenCameraParams(recalculatedCameraParameters,cameraParams);

       results{iTest} = differenceStruct;4
    end

    errorMatrix = [];
    for iTest=1:length(standardDeviation)
        errorMatrix = [errorMatrix; mean(results{iTest}.TranslationVectors)];
    end
    finalResults(:,:,iRepetition) = errorMatrix;
    iRepetition
end
%%
 
normalDistribrutionGraph(standardDeviation, mean(abs(finalResults),3));