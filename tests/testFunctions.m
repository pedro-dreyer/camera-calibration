function tests = testFunctions
tests = functiontests(localfunctions);
end

%% Checkerboard Creation

% the function to generates checkerboard accepts as first input the
%[height width] argument of the checkerboard this is equivalent as [y x]
% that is why the tests function bellow seems to be inverted

function testCheckerboardCreationLongX(testCase)
actual = generateCheckerboardPoints([3,4],10);

column1 = [0 0 10 10 20 20]';
column2 = [0 10 0 10 0 10]';
expected = [column1 column2];

verifyEqual(testCase,actual,expected)
end

function testCheckerboardCreationLongY(testCase)
actual = generateCheckerboardPoints([4,3],10);

column1 = [0, 0, 0, 10, 10, 10]';
column2 = [0, 10, 20, 0, 10, 20]';
expected = [column1 column2];

verifyEqual(testCase,actual,expected)
end
%% Calibration

% pointDetection is not goint to be tested since it is a MATLAB function

function testCameraParameters(testCase)

[calibrationParameters, markerParameters, ~] = calculateCalibrationTestResults(false);

% we only test the calibration by images since it will eventually call the
% calibration by points

folderPath = 'media/calibrationImages';
imagesPath = loadImages(folderPath);
actual = calculateCameraParametersImages(markerParameters, calibrationParameters, imagesPath);
expected = load('expected/testCameraParameters.mat');
expected = expected.cameraParams;

verifyEqual(testCase,actual,expected)

end
%% Misc

function testImageSize(testCase)
image = imread('media\test_image.jpg');
actual = getImageSize(image);

expected = [960 1280]; 

verifyEqual(testCase,actual,expected)
end
