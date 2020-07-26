function [boardSize] = getBoardSize(calibrationFolder)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if strcmp(calibrationFolder,'default')
    boardSize = [9, 12];
elseif strcmp(calibrationFolder,'gopro')
    boardSize = [7, 10];
elseif strcmp(calibrationFolder,'mono')
    boardSize = [7, 10];
elseif strcmp(calibrationFolder,'slr')
    boardSize = [7, 10];
elseif strcmp(calibrationFolder,'streo/left')
    boardSize = [7, 8];
elseif strcmp(calibrationFolder,'streo/right')
    boardSize = [7, 8];
elseif strcmp(calibrationFolder,'webcam')
    boardSize = [7, 10];
elseif strcmp(calibrationFolder,'wideBaseline/left')
    boardSize = [7, 10];
elseif strcmp(calibrationFolder,'wideBaseline/right')
    boardSize = [7, 10];
else
    error('Calibration folder does not exist')
end

end

