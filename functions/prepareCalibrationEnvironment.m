function [markerParameters, calibrationParameters, imagesPath] = prepareCalibrationEnvironment(calibrationFolder, squareSize, varargin)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

markerType = 'checkerboard';
unit = 'mm';
boardSize = getBoardSize(calibrationFolder);
if nargin == 1
    squareSize = 30;
end

markerParameters = createMarker(markerType, unit, squareSize, boardSize);

imagesPath = loadImages(['images/' calibrationFolder]);
imageSize = getImageSize(imread(imagesPath{1}));

calibrationParameters.imageSize = imageSize;
calibrationParameters.estimateSkew = true;
calibrationParameters.estimateTan = true;
calibrationParameters.nRadial = 3;

if ~isempty(varargin)
    for iVarargin=1:2:(length(varargin)-1)
        key = varargin{iVarargin};
        value = varargin{iVarargin+1};
        calibrationParameters.(key) = value;
    end
end

