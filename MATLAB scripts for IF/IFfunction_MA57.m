
%% this code segments  nuclei in Dapi

function[intintdapi_allwells, avgnucfitc_allwells, avgnuccy5_allwells, wellName]= IFfunction(row,col, dir)

row 
col

avgnuccy5_allwells=[];  %set each variable to zero for each time you look at a new col
% avgnuccy3_allwells=[];
avgnucfitc_allwells=[];
intintdapi_allwells=[];
    
    
        
for site=1:9  %number of sites
   site
    
    wellName=[num2str(row),'_', num2str(col)];
    
    %load images
    dapi=single(imread([dir, num2str(row), '_', num2str(col), '_', num2str(site), '_DAPI_1.tif']));  %the part in purple in quotes has to match file name
    fitc=single(imread([dir, num2str(row), '_', num2str(col), '_', num2str(site), '_FITC_1.tif']));
%     cy3=single(imread([dir, num2str(row), '_', num2str(col), '_', num2str(site), '_Cy3_1.tif']));
    cy5=single(imread([dir, num2str(row), '_', num2str(col), '_', num2str(site), '_Cy5_1.tif']));
    
    
    
    dapimask=getdapimask(dapi, 13);  %radius=26 is good for20x no bin 20150211MCF10A. 19 for Hs68. the number after the comma is the nuclear RADIUS (not diameter);whole numbers only
    %figure(100); imshowc(dapimask, dapi, 1)
   
    numberednuc=bwlabel(dapimask);  %give numbers to each nucleus    
    nucxypos=regionprops(numberednuc, 'PixelIdxList', 'Centroid');
    
    
    
    for i=1:length(nucxypos)  %for each cell in the image
        avgnucfitc(i)=mean(fitc(nucxypos(i).PixelIdxList));
%         avgnuccy3(i)=mean(cy3(nucxypos(i).PixelIdxList));
        avgnuccy5(i)=mean(cy5(nucxypos(i).PixelIdxList));
        
        sumnucdapi(i)=sum(dapi(nucxypos(i).PixelIdxList));  %get the integrated intensity of dapi stain toget DNA content, as opposed to the mean
        center(i,:)=nucxypos(i).Centroid;
    end
    
    
   avgnucfitc_allwells=[avgnucfitc_allwells, avgnucfitc];  %put all 9 wells together
%     avgnuccy3_allwells=[avgnuccy3_allwells, avgnuccy3];  %put all 9 wells together
    avgnuccy5_allwells=[avgnuccy5_allwells, avgnuccy5];  %put all 9 wells together
    intintdapi_allwells=[intintdapi_allwells, sumnucdapi]; %put all 9 wells together
    
    
    
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







