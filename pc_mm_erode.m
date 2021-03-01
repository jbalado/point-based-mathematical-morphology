function data_er = pc_mm_erode(data,SE)

% Estimate average distance between points
[~,dists] = knnsearch(data,data,'k',5);
d_d = mean(dists(:,2:end),'All');

% Prepare variables
Mdl = KDTreeSearcher(data(:,1:3)); % KDTree structure
data_n_er = cell(1);
d_t = d_d/1.5; % point-to-point distance threshold

% Scroll points
for i = 1 : length(data)
    % Calculate translation distance
    t = data(i,1:3) - SE(1,:);
    % Apply translation
    SE_data = [SE(2:end,1)+t(1) SE(2:end,2)+t(2) SE(2:end,3)+t(3)]; 
    % Distance SE to input point cloud
    [~,dist] = knnsearch(Mdl,SE_data,'k',1);       
    % Check if matched and saved
    idx = dist > d_t; 
    if (sum(idx)) == 0
        data_n_er{i,1} = data(i,:);
    end    
end

% Transformation cell to matrix
data_er = cell2mat(data_n_er);

end