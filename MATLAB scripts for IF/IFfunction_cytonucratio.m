
%% this code segments  nuclei in Dapi

function[intintdapi_allwells, avgcytocy5_allwells, ratio_allwells, wellName]= IFfunction_cytonucratio(row,col, dir)

row 
col

avgcytocy5_allwells=[];  %set each variable to zero for each time you look at a new col
%avgnuccy3_allwells=[];
% avgnucfitc_allwells=[];
intintdapi_allwells=[];
ratio_allwells=[]; 
    
    
        
for site=[1:9]  %1:9  %for each of my 9 images
    
    
    wellName=[num2str(row),'_', num2str(col)];
    
    %load images
    dapi=single(imread([dir, num2str(row), '_', num2str(col), '_', num2str(site), '_Dapi_1.tif']));  %the part in purple in quotes has to match file name
%     fitc=single(imread([dir, num2str(row), '_', num2str(col), '_', num2str(site), '_FITC_1.tif']));
    %cy3=single(imread([dir, num2str(row), '_', num2str(col), '_', num2str(site), '_Cy3_1.tif']));
    cy5=single(imread([dir, num2str(row), '_', num2str(col), '_', num2str(site), '_Cy5_1.tif']));
    
    
    
   dapimask=getdapimask(dapi, 12);  % the number after the comma is the nuclear RADIUS (not diameter);whole numbers only
   figure(1); imshowc(dapimask, dapi, 1)
   
   numberednuc=bwlabel(dapimask);  %give numbers to each nucleus    
   dapimaskdilated=imdilate(numberednuc, strel('disk', 1, 8));  %dilate dapimask by 2 pixels; 8 means octagon
   ring=imdilate(dapimaskdilated, strel('disk', 2, 8))   - dapimaskdilated;  %dilate, and subtract to make a ring
   
   figure (2); imshowc(ring, dapi, 1)
   figure (3); imshowc(ring, cy5, 1)
   
   

    nucxypos=regionprops(numberednuc, 'PixelIdxList', 'Centroid', 'Area');
    ringxypos=regionprops(ring, 'pixelidxlist');
    
    
    
    for i=1:length(nucxypos)  %for each cell in the image
%         avgnucfitc(i)=mean(fitc(nucxypos(i).PixelIdxList));
        %avgnuccy3(i)=mean(cy3(nucxypos(i).PixelIdxList));
        avgnuccy5(i)=mean(cy5(nucxypos(i).PixelIdxList));
        
%         topringcy5=prctile(cy5(ringxypos(i).PixelIdxList), 50);
%         avgringcy5(i)=mean(topringcy5);
        
        avgringcy5(i)=mean(cy5(ringxypos(i).PixelIdxList));
        
        sumnucdapi(i)=sum(dapi(nucxypos(i).PixelIdxList));  %get the integrated intensity of dapi stain toget DNA content, as opposed to the mean
        center(i,:)=nucxypos(i).Centroid;
    end
    
    ratio=avgringcy5./avgnuccy5;
    
  
    
    
    
    ratio_allwells=[ratio_allwells, ratio];
%     avgnucfitc_allwells=[avgnucfitc_allwells, avgnucfitc];  %put all 9 wells together
    %avgnuccy3_allwells=[avgnuccy3_allwells, avgnuccy3];  %put all 9 wells together
    avgcytocy5_allwells=[avgcytocy5_allwells, avgringcy5];  %put all 9 wells together
    intintdapi_allwells=[intintdapi_allwells, sumnucdapi]; %put all 9 wells together
    
    
 
    clear sumnucdapi;  clear avgnuccy5; clear avgringcy5;
    
end



    
%remove cells with avg dapi intensity that is too high or too low, if you want
%      figure(100);
%      hist(intintdapi_allwells,100); 
%      xlabel('DNA content'); title(wellName)

% dapiweirdI=[];
% dapiweirdI=find(intintdapi_allwells < 1.8e5 | intintdapi_allwells > 7e5);  %indices for cells with too high or too low DNA content
% for i=0:length(dapiweirdI)-1  
%     indextoremove=dapiweirdI(end-i);  %go backwards so numbering doesn't get messed up
%     avgnucfitc_allwells(indextoremove)=[];
%     avgnuccy3_allwells(indextoremove)=[];
%     avgnuccy5_allwells(indextoremove)=[];  
%     intintdapi_allwells(indextoremove)=[];
% end
    
    




%the saving of the processed data now happens in the looper
 saveas(figure(1),[dir, '/analyzedData/', num2str(row) '_' num2str(col) '_dapimask.fig'])







