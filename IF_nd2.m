function IF_nd2(currFile, rawdir_movie, datadirIF)

%% Resolve the well column and row from the nd2 filename
[experimentpath,fn] = fileparts(currFile);

%Find a capital letter, followed by two digits
startIdx = regexp(fn,'[A-Z][0-9][0-9]');

%Convert the first letter into a number
wellRow = int8(fn(startIdx)) - 64; %'A' = 65

%Convert the next two digits into the column number
wellCol = str2double(fn(startIdx+1:startIdx+2));

%% basic parameters
nucr=12; %10X: 12, 20X: 24
debrisarea=400;
boulderarea=60000; %MCF-10A: H2B:20 NLS:10 %10X 60000, 20X: 3000
blobthreshold=-0.03; 
se = strel('disk',nucr*4);
ringcalc=1; %set to zero if ring is unneeded
timetotal=tic;

currFiles = dir([rawdir_movie,'*nd2']); 
filenames = {currFiles.name};
find_match = regexp(filenames,fn(1:7),'match');
find_match = ~cellfun('isempty',find_match);
file_match = find(find_match>0,1);

if ~isempty(file_match)
    bfReademovie = BioformatsImage([rawdir_movie,currFiles(file_match).name]);  
end  

bfReaderJian = BioformatsImage(currFile);

%% load CMOS and bias images
% load('\\biot07.colorado.edu\spencerlab\group\Rotons\Claire\scripts\Nikon1_DAPI.mat');
% biasall = bias;
% load('\\biot07.colorado.edu\spencerlab\group\Rotons\Claire\scripts\Nikon1_FITC.mat');
% biasall(:,:,2) = bias;
% load('\\biot07.colorado.edu\spencerlab\group\Rotons\Claire\scripts\Nikon1_mCherry.mat');
% biasall(:,:,3) = bias;
% load('\\biot07.colorado.edu\spencerlab\group\Rotons\Claire\scripts\Nikon1_Cy5.mat');
% biasall(:,:,4) = bias;
% load('\\biot07.colorado.edu\spencerlab\mimi7127\Analysis\20180116_pAKT\Cy5.mat');
% biasall(:,:,3) = bias;
%cmos = single(imread('\\biot07.colorado.edu\spencerlab\group\Rotons\Claire\scripts\cmosNikon.tif'));

for xyLoc = 1:9
    %% load timelapse data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    shot = [num2str(wellRow),'_',num2str(wellCol),'_',num2str(xyLoc)];
    
    %% load raw images
    raw_movie = double(bfReademovie.getXYplane(1,xyLoc,bfReademovie.sizeT));

    raw_IF = double(bfReaderJian.getXYplane(1,xyLoc,1));
    channel_num_IF = bfReaderJian.sizeC;
    if channel_num_IF>1
        raw_IF(:,:,channel_num_IF)=NaN;
        for i = 2:channel_num_IF
            raw_IF(:,:,i) = double(bfReaderJian.getXYplane(i,xyLoc,1));
        end
    end




%%% segment nuclei %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    segmethod='single';
    switch segmethod
        case 'log'
            nuc_mask=blobdetector_4(log(raw_IF(:,:,1)),nucr,blobthreshold,debrisarea);
            nuc_mask_prev=blobdetector_4(log(raw_movie),nucr,blobthreshold,debrisarea);
        case 'single'
            blurradius=3;
            nuc_mask=threshmask(raw_IF(:,:,1),blurradius);
            nuc_mask=markershed(nuc_mask,round(nucr*2/3));
            
        case 'double'
            blurradius=3;
            nuc_mask=threshmask(raw_IF(:,:,1),blurradius);
            nuc_mask=markershed(nuc_mask,round(nucr*2/3));
            nuc_mask=secondthresh(raw_IF(:,:,1),blurradius,nuc_mask,boulderarea*2);
    end
    
    nuc_mask=bwareaopen(nuc_mask,debrisarea);
    %%% Deflection-Bridging %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    nuc_mask=segmentdeflections_bwboundaries(nuc_mask,nucr,debrisarea);
    nuc_mask=excludelargeandwarped_3(nuc_mask,boulderarea,0.95);
    
    %% calculate background: local %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    real_IF = raw_IF;
    for i = [1 2 3]
        corrected = (raw_IF(:,:,i));%-cmos)./biasall(:,:,i);
        blur1 = imfilter(corrected,fspecial('disk',3),'symmetric');
      
        real = imtophat(blur1,se); % 
        real(real<1) = 1;
        real_IF(:,:,i)= real;
    end
    %% extract features %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    nuc_label=bwlabel(nuc_mask);
%     imwrite(uint16(real_IF(:,:,1)),'raw.tif');
%     imwrite(uint16(nuc_mask),'test.tif');
    nuc_info=struct2cell(regionprops(nuc_mask,real_IF(:,:,1),'Area','Centroid','MeanIntensity')');
    nuc_area=squeeze(cell2mat(nuc_info(1,1,:)));
    nuc_center=squeeze(cell2mat(nuc_info(2,1,:)))';   
 
    %% matching %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    numcells=numel(nuc_area);
    nuc_info=regionprops(nuc_label,'PixelIdxList');

    real1 = real_IF(:,:,1);
    real2 = real_IF(:,:,2);
    real3 = real_IF(:,:,3);
    real4 = real_IF(:,:,4);
 
    cells       = struct([]);
    ring_label=getcytoring_3(nuc_label,4,real2);
    ring_info=regionprops(ring_label,'PixelIdxList');
    
    for cc=1:numcells
        cells(cc).xy_coordinates    = nuc_center(cc,:);
        cells(cc).nuc_area          = nuc_area(cc);
        cells(cc).dapi              = sum(real1(nuc_info(cc).PixelIdxList));
        cells(cc).dapi_nuc_median    = median(real1(nuc_info(cc).PixelIdxList));
        cells(cc).dapi_ring_median   = median(real1(ring_info(cc).PixelIdxList));
        cells(cc).dapi_nuc_mean      = mean(real1(nuc_info(cc).PixelIdxList));
        
        cells(cc).fitc_nuc_median    = median(real2(nuc_info(cc).PixelIdxList));
        cells(cc).fitc_ring_median   = median(real2(ring_info(cc).PixelIdxList));
        cells(cc).fitc_nuc_mean      = mean(real2(nuc_info(cc).PixelIdxList));
        
        cells(cc).cy3_nuc_median    = median(real3(nuc_info(cc).PixelIdxList));
        cells(cc).cy3_ring_median   = median(real3(ring_info(cc).PixelIdxList));
        cells(cc).cy3_nuc_mean      = mean(real3(nuc_info(cc).PixelIdxList));
        
        cells(cc).cy5_nuc_median    = median(real3(nuc_info(cc).PixelIdxList));
        cells(cc).cy5_ring_median   = median(real3(ring_info(cc).PixelIdxList));
        cells(cc).cy5_nuc_mean      = mean(real3(nuc_info(cc).PixelIdxList));
    end
    
    % %% store data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if ~isempty(nuc_area)
        save([datadirIF,num2str(wellRow), '_', num2str(wellCol), '_', num2str(xyLoc),'_IF.mat'],'cells');

    end
end
toc(timetotal);
%{
%%%%%%%% DEBUGGING %%%%%%%%%%%%%%%%%%%%%%%%%
%%% view images %%%%%%%%%%%%%%%%%%%%%%%%%%%%
extractmask=bwmorph(nuc_mask,'remove');
tempframe=zeros(height,width,3);
tempframe(:,:,1)=imadjust(mat2gray(raw1));
tempframe(:,:,2)=extractmask;
tempframe(:,:,3)=marker_mask;
figure,imshow(tempframe);

%%% overlay nuclear images %%%%%%%%%%%%%%%%%
[rawprevcrop,raw1crop]=cropboth(rawprev,raw1,reljitx,reljity);
tempframe=imadjust(mat2gray(rawprevcrop));
tempframe(:,:,2)=imadjust(mat2gray(raw1crop));
tempframe(:,:,3)=0;
figure,imshow(tempframe)

%%% see distribution of nuclear areas %%%%%%
nuc_info=struct2cell(regionprops(nuc_mask,'Area')');
nuc_area=squeeze(cell2mat(nuc_info(1,1,:)));
hist(nuc_area,100);

%%% remove masking of large objects %%%%%%%%
anti_mask=bwareaopen(nuc_mask,debrisarea);
temp_mask=nuc_mask-anti_mask;
extractmask=bwmorph(temp_mask,'remove');

%%% see only large objects %%%%%%%%%%%%%%%%%
anti_mask=bwareaopen(nuc_mask,1000);
extractmask=bwmorph(anti_mask,'remove');
%}