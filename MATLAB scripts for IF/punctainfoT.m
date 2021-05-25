function  nuc_xy_pos = punctainfoT(nuc_xy_pos, puncta_img, puncta_sizethreshold, punctasize_lowerlimit,savingdir, row, col, site, strelradius, getdapimaskradius)  

%this function figures out which cell the puncta belongs to and returns a
%structure of structures with the puncta info
%FITC Processing
%imshow(puncta_img, [])

[~,numbered_puncta] = punctadetect(puncta_img,savingdir, row, col,strelradius, getdapimaskradius);
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
% see if a puncta is inside a nuclei, if so check thresholds and add, mark
% as assigned (just in case).
assigned = false(size(puncta_xy_pos));
for ii = 1:length(puncta_xy_pos)
    for jj = 1:length(nuc_xy_pos)
        if ~isempty(intersect(puncta_xy_pos(ii).PixelIdxList,nuc_xy_pos(jj).PixelIdxList))
            if (puncta_xy_pos(ii).Area > punctasize_lowerlimit) && (puncta_xy_pos(ii).Area < puncta_sizethreshold * nuc_xy_pos(jj).Area)
                if ~assigned(ii)
                    nuc_xy_pos(jj).puncta =  [nuc_xy_pos(jj).puncta , puncta_xy_pos(ii)];
                    assigned(ii) = true; %insure a puncta is only assigned once (this may be unneeded)
                end
            end
        end           
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

figure(10)
adj_img=imadjust(puncta_img); %%%MAaddition20170310
imshow(adj_img, [])  
% imshow(puncta_img, [])
%Draw circles 
centers = [];
radii = [];
for i = 1:length(puncta_xy_pos)
    centers = [centers;puncta_xy_pos(i).Centroid];
    radii = [radii,0.8 * puncta_xy_pos(i).MajorAxisLength];
end
viscircles(centers,radii,'EdgeColor','r', 'linewidth', 3)