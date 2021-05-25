%% this code segments  nuclei in Dapi


%function[intintdapi_allwells,avgnucfitc_allwells,  avgnuccy3_allwells, avgnuccy5_allwells, wellName] = IFfunction_puncta(row,col, dir)
function[intintdapi_allwells, avgnuccy5_allwells, centroid_allwells, sitelist_allwells, wellName, puncta_allwells, SumPunctaArea_allwells, AvgPunctaIntensity_allwells, SumPunctaMetric_allwells] = IFfunction_puncta(row,col, dir, savingdir)

% puncta_sizethreshold=0.2;  %any "puncta" greater than 20% of the nuclear area will be rejected as a puncta
puncta_sizethreshold=0.3;
punctasize_lowerlimit=4;  %punctasize_lowerlimit is the minimum number of pixels that a puncta can be;  3 is good for 20X and no binning
nuclearradius=12;
strelradius=10;       %this is the number of pixels around the puncta to take as background, which will get subtracted
getdapimaskradius=5;  %this is a guess at the radius of a typical puncta
%we could add another parameter to throw out punctathat are very dim relative to the nuclear background

%for small puncta, try:
% 1. A strel radius of 1 and getdpimask radius 2
% 2. A strel radius of 2 and getdpimask radius 1
%for big puncta, try:
% 1. A strel radius of 10 and getdpimask radius 5


row %To traverse through the images
col

avgnuccy5_allwells=[];  %set each variable to zero for each time you look at a new col
% avgnuccy3_allwells=[];
% avgnucfitc_allwells=[];
intintdapi_allwells=[];
centroid_allwells=[];
sitelist_allwells=[];
puncta_allwells=[];
SumPunctaArea_allwells=[];
AvgPunctaIntensity_allwells=[];
SumPunctaMetric_allwells=[];

    
    
        
for site=1:9  %for each of my 9 images
    site
      
    wellName=[num2str(row),'_', num2str(col)];
    
    %load images
    dapi=single(imread([dir, num2str(row), '_', num2str(col), '_', num2str(site), '_DAPI_1.tif']));  %the part in purple in quotes has to match file name
%     fitc=single(imread([dir, num2str(row), '_', num2str(col), '_', num2str(site), '_FITC_1.tif']));
%     cy3=single(imread([dir, num2str(row), '_', num2str(col), '_', num2str(site), '_Cy3_1.tif']));
    cy5=single(imread([dir, num2str(row), '_', num2str(col), '_', num2str(site), '_Cy5_1.tif']));
    
    punctaimage=cy5;  %in this case, 53BP1 puncta are in the cy3 channel
        
    
    dapimask=getdapimask(dapi, nuclearradius);  % the number after the comma is the nuclear RADIUS (not diameter);whole numbers only
    figure(999); imshowc(dapimask, dapi, 1)
   
    numberednuc=bwlabel(dapimask);  %give numbers to each nucleus    
    nucxypos=regionprops(numberednuc, 'PixelIdxList', 'Centroid', 'Area');
       
          
    x = punctainfo(nucxypos,uint16(punctaimage), puncta_sizethreshold, punctasize_lowerlimit, savingdir, row, col, site, strelradius, getdapimaskradius); %x is a struct that is the updated nucxypos with puncta info
    
    puncta(length(nucxypos),1)= struct;
        
    for i=1:length(nucxypos)
        puncta(i).puncta = 0;
    end

    
    for i=1:length(nucxypos)  %for each cell in the image
%         avgnucfitc(i)=mean(fitc(nucxypos(i).PixelIdxList));
%         avgnuccy3(i)=mean(cy3(nucxypos(i).PixelIdxList));
        avgnuccy5(i)=mean(cy5(nucxypos(i).PixelIdxList));
        sumnucdapi(i)=sum(dapi(nucxypos(i).PixelIdxList));  %get the integrated intensity of dapi stain toget DNA content, as opposed to the mean
        center(i,:)=nucxypos(i).Centroid;
        
        
        %%call puncta code   
        
        if length(x(i).Sum_Puncta_Area) ~= 0
        SumPunctaArea(i) = x(i).Sum_Puncta_Area;
        AvgPunctaIntensity(i) = x(i).Avg_Puncta_Intensity;
        SumPunctaMetric(i) = x(i).Sum_Puncta_Metric;
        else
        SumPunctaArea(i) = 0;
        AvgPunctaIntensity(i) = 0;
        SumPunctaMetric(i) = 0;
        end
        
        puncta(i,1).puncta = x(i).puncta;   
 
    end
    
    presentsite=site*ones(1, length(nucxypos));  %create a vector tracking which sites (image) each cell comes from so you can find any cell in the image at a later time
    
%     avgnucfitc_allwells=[avgnucfitc_allwells, avgnucfitc];  %put all 9 wells together
%     avgnuccy3_allwells=[avgnuccy3_allwells, avgnuccy3];  %put all 9 wells together
    avgnuccy5_allwells=[avgnuccy5_allwells, avgnuccy5];  %put all 9 wells together
    intintdapi_allwells=[intintdapi_allwells, sumnucdapi]; %put all 9 wells together
    centroid_allwells=[centroid_allwells; ceil(center)];
    sitelist_allwells=[sitelist_allwells, presentsite];

    SumPunctaArea_allwells = [SumPunctaArea_allwells,SumPunctaArea];
    AvgPunctaIntensity_allwells=[AvgPunctaIntensity_allwells, AvgPunctaIntensity];
    SumPunctaMetric_allwells=[SumPunctaMetric_allwells, SumPunctaMetric];
    puncta_allwells = [puncta_allwells,puncta'];
    
    
     clear avgnuccy5; clear sumnucdapi;  clear puncta; clear SumPunctaArea; clear AvgPunctaIntensity; clear SumPunctaMetric; clear center; clear presentsite; 
    
    
end