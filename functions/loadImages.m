function imagesPath = loadImages(imagesFolder)

folderStruct = dir(imagesFolder);

folderStruct(1:2) = [];

sortedFilesNames = natsortfiles({folderStruct.name});


for i = 1:numel(sortedFilesNames)
    imagesPath{i} = fullfile(imagesFolder,sortedFilesNames{i});
end
