function  nuc_xy_pos = punctainfo_new(nuc_xy_pos, puncta_img, puncta_sizethreshold, punctasize_lowerlimit, strelradius, getdapimaskradius)  

%this function figures out which cell the puncta belongs to and returns a
%structure of structures with the puncta info
%FITC Processing
%imshow(puncta_img, [])

[~,numbered_puncta] = punctadetect_new(puncta_img,strelradius, getdapimaskradius);
puncta_xy_pos = regionprops(numbered_puncta, 'PixelIdxList', 'Centroid','Area','MajorAxisLength'); % Get position and pixel list of puncta

% add the puncta field to the structure
nuc_xy_pos(end).puncta = [];
puncta_xy_pos(end).Avg_Intensity = [];
puncta_xy_pos(end).Puncta_Metric = [];

%Puncta Average Intensity
for ii = 1:length(puncta_xy_pos)
    avgint = mean(puncta_img(puncta_xy_pos(ii).PixelIdxList));
    p = avgint * puncta_xy_pos(ii).Area;
    puncta_xy_pos(ii).Avg_Intensity = avgint;
    puncta_xy_pos(ii).Puncta_Metric = p;    
end

%Find which puncta belongs to which nuclei.
%
% this was done incorrectly by appending dist = [dist,...], when the
% conditional skipped values, and empyt value was not preserved in dist. So
% the dereference with the minimum distance incorrectly assigned the value.
for ii = 1:max(max(numbered_puncta))
    dist = NaN(length(nuc_xy_pos),1);
    for jj = 1:length(nuc_xy_pos)
        if (puncta_xy_pos(ii).Area > punctasize_lowerlimit) && (puncta_xy_pos(ii).Area < puncta_sizethreshold * nuc_xy_pos(jj).Area)
            dist(jj) = norm(puncta_xy_pos(ii).Centroid - nuc_xy_pos(jj).Centroid);
        end            
    end 
    
    if ~isempty(dist)
        [~,nuc_postn] = min(dist);
        nuc_xy_pos(nuc_postn).puncta =  [nuc_xy_pos(nuc_postn).puncta , puncta_xy_pos(ii)]; 
    end    
end      

%now get the overall metrics for each cell by summing or averaging over all puncta in each cell
for ii = 1:length(nuc_xy_pos)
    areasum      = 0;
    intensitysum = 0;
    metricsum    = 0;
    if ~isempty(nuc_xy_pos(ii).puncta)
        for jj = 1:length(nuc_xy_pos(ii).puncta)
            areasum      = areasum + nuc_xy_pos(ii).puncta(jj).Area;
            intensitysum = intensitysum + nuc_xy_pos(ii).puncta(jj).Avg_Intensity;
            metricsum    = metricsum + nuc_xy_pos(ii).puncta(jj).Puncta_Metric;
        end
        nuc_xy_pos(ii).Sum_Puncta_Area      = areasum;
        nuc_xy_pos(ii).Avg_Puncta_Intensity = intensitysum/length(nuc_xy_pos(ii).puncta);
        nuc_xy_pos(ii).Sum_Puncta_Metric    = metricsum;        
    end
end
