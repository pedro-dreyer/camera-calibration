function [calibrationParameters, markerParameters, cameraParams] = calculateCalibrationTestResults(saveFile)

imagesFolder = 'media/calibrationImages';
imagesPath = loadImages(imagesFolder);
imageSize = getImageSize(imread(imagesPath{1}));

markerType = 'checkerboard';
unit = 'mm';
squareSize = 30;
boardSize = [9, 12];
markerParameters = createMarker(markerType, unit, squareSize, boardSize);

calibrationParameters.imageSize = imageSize;
calibrationParameters.estimateSkew = true;
calibrationParameters.estimateTan = true;
calibrationParameters.nRadial = 3;


cameraParams = calculateCameraParametersImages(markerParameters, calibrationParameters, imagesPath);

if saveFile
    save('expected/testCameraParameters.mat', 'cameraParams')
end