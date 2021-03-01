%% Load data
data = load("cubo3d.txt");

%% Example for a vertical (Z-oriented) opeining

% SE definition (first point is the Reference point)
SE = [0 0 0; 0 0 -0.1; 0 0 0.1];
SE = SE * 5;

% Erosion
data_eroded = pc_mm_erode(data,SE);

% Export to HDD
dlmwrite("cubo3d_eroded.txt",data_eroded,'delimiter',' ','precision',10);

% Dilation
data_dilated = pc_mm_dilate(data_eroded,SE);

% Export to HDD
dlmwrite("cubo3d_dialted_opened.txt",data_dilated,'delimiter',' ','precision',10);


%% Example for a horizontal (X-oriented) closing

% SE definition (first point is the Reference point)
SE = [0 0 0; -0.5 0 0; 0.5 0 0];

% Dilation
data_dilated = pc_mm_dilate(data,SE);

% Export to HDD
dlmwrite("cubo3d_dilated.txt",data_dilated,'delimiter',' ','precision',10);

% Erosion
data_eroded = pc_mm_erode(data_dilated,SE);

% Export to HDD
dlmwrite("cubo3d_eroded_closed.txt",data_eroded,'delimiter',' ','precision',10);