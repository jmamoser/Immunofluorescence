function  nucxypos = punctainfo(nucxypos, puncta_img, puncta_sizethreshold, punctasize_lowerlimit, savingdir, row, col, site, strelradius, getdapimaskradius)  

%this function figures out which cell the puncta belongs to and returns a
%structure of structures with the puncta info
%FITC Processing
imshow(puncta_img, [])

[new,numbered_puncta] = punctadetect(puncta_img, savingdir, row, col, strelradius, getdapimaskradius);
puncta_xy_pos=regionprops(numbered_puncta, 'PixelIdxList', 'Centroid','Area','MajorAxisLength'); % Get position and pixel list of puncta

nucxypos(end + 1).puncta = 0;
nucxypos(end,:).puncta = [];

puncta_xy_pos(end + 1).Avg_Intensity = 0;
puncta_xy_pos(end,:).Avg_Intensity = [];
puncta_xy_pos(end + 1).Puncta_Metric = 0;
puncta_xy_pos(end,:).Puncta_Metric = [];




%Puncta Average Intensity
for i = 1:length(puncta_xy_pos)
    avgint = mean(puncta_img(puncta_xy_pos(i).PixelIdxList));
    p = avgint * puncta_xy_pos(i).Area;
    puncta_xy_pos(i).Avg_Intensity = avgint;
    puncta_xy_pos(i).Puncta_Metric = p;  
    
end




%Find which puncta belongs to which nuclei
for i = 1:max(max(numbered_puncta))
    a = puncta_xy_pos(i).Centroid;
    dist = [];
    %i
    for j = 1:length(nucxypos)
        %j
        if (puncta_xy_pos(i).Area > punctasize_lowerlimit) & (puncta_xy_pos(i).Area < puncta_sizethreshold * nucxypos(j).Area)
            b = nucxypos(j).Centroid;
            dist = [dist,norm(a - b)];
        end            
    end    
    if length(dist) ~= 0
        nuc_postn = find(dist == min(dist));
        nucxypos(nuc_postn).puncta =  [nucxypos(nuc_postn).puncta , puncta_xy_pos(i)]; 
    end    
end      




%now get the overall metrics for each cell by summing or averaging over all puncta in each cell
for i = 1:length(nucxypos)
    areasum = 0;
    intensitysum = 0;
    metricsum = 0;
    if length(nucxypos(i).puncta) ~= 0
        for j = 1:length(nucxypos(i).puncta)
            areasum = areasum + nucxypos(i).puncta(j).Area;
            intensitysum = intensitysum + nucxypos(i).puncta(j).Avg_Intensity;
            metricsum = metricsum + nucxypos(i).puncta(j).Puncta_Metric;
        end
        nucxypos(i).Sum_Puncta_Area = areasum;
        nucxypos(i).Avg_Puncta_Intensity = intensitysum/length(nucxypos(i).puncta);
        nucxypos(i).Sum_Puncta_Metric = metricsum;        
    end
end




figure(1)
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
viscircles(centers,radii,'EdgeColor','g', 'linewidth', 1.5)

%saveas(figure(1),[savingdir, num2str(row) '_' num2str(col) '_circledpuncta.fig'])
saveas(figure(1),[savingdir, num2str(row) '_' num2str(col) '_' num2str(site) '_circledpuncta.fig'])






