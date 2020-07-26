function [differenceStruct, maxErrorStruct] = differenceBetweenCameraParams(cameraParams1,cameraParams2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

parametersToCheck = {'IntrinsicMatrix', 'TranslationVectors', 'RotationVectors'};

for iParameter=1:length(parametersToCheck)
    parameterToCheck = parametersToCheck{iParameter};
    difference = cameraParams1.(parameterToCheck) - cameraParams2.(parameterToCheck);
    differenceStruct.(parameterToCheck) = difference;
    absDifference = abs(difference);
    maxDifference = max(absDifference(:));
    maxErrorStruct.(parameterToCheck) = maxDifference;
end

end

