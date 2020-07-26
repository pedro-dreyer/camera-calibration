function marker = createMarker(markerType, unit, squareSize, boardSize)

marker.markerType = markerType;
marker.unit = unit;
marker.squareSize = squareSize;
marker.boardSize = boardSize;
marker.worldPoints = generateCheckerboardPoints(boardSize, squareSize);