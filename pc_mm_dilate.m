function data_dilated = pc_mm_dilate(data,SE)

% Estimate average distance between points
[~,dists] = knnsearch(data,data,'k',5);
d_d = mean(dists(:,2:end),'All');

% Prepare variables
Mdl = KDTreeSearcher(data(:,1:3)); % KDTree structure
data_n_dil = cell(1);
d_t = d_d/1.5; % point-to-point distance threshold

% Scroll points
for i = 1 : length(data) 
    % Calculate translation distance
    t = data(i,1:3) - SE(1,:);
    % Apply translation
    SE_to_data = [SE(2:end,1)+t(1) SE(2:end,2)+t(2) SE(2:end,3)+t(3)];   
    % Filter SE repeated points from the input point cloud
    [~,dists_SE_data] = knnsearch(Mdl,SE_to_data,'k',1);
    data_n_dil{i,1} = SE_to_data(dists_SE_data > d_t,:);
end

% Transformation cell to matrix
data_n_dil = cell2mat(data_n_dil);

% Filter new SE repeated points (optimization)
pc_n_dil = pcdownsample(pointCloud(data_n_dil),'gridAverage',d_t);
data_dilated = [data(:,1:3);pc_n_dil.Location];

end