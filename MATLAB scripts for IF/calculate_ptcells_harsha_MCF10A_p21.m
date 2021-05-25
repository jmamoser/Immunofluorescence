clear all; close all;

load('Y:\IXMicroImages-goodNames\Mansi\MA48-MCF10A IF after ATMi ATRi\MA48-20151027-MCF10A-IF-10x-ATM-ATRi_687\analyzedData_10Xpuncta\1_1_data.mat')
avgnuccy3_allwells1=avgnuccy3_allwells;
avgnuccy5_allwells1=avgnuccy5_allwells;
avgnucfitc_allwells1=avgnucfitc_allwells;
AvgPunctaIntensity_allwells1=AvgPunctaIntensity_allwells;
% centroid_allwells1=centroid_allwells;
intintdapi_allwells1=intintdapi_allwells;
puncta_allwells1=puncta_allwells;
sitelist_allwells1=sitelist_allwells;
SumPunctaArea_allwells1=SumPunctaArea_allwells;
SumPunctaMetric_allwells1=SumPunctaMetric_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA48-MCF10A IF after ATMi ATRi\MA48-20151027-MCF10A-IF-10x-ATM-ATRi_687\analyzedData_10Xpuncta\2_1_data.mat')
avgnuccy3_allwells2=avgnuccy3_allwells;
avgnuccy5_allwells2=avgnuccy5_allwells;
avgnucfitc_allwells2=avgnucfitc_allwells;
AvgPunctaIntensity_allwells2=AvgPunctaIntensity_allwells;
% centroid_allwells2=centroid_allwells;
intintdapi_allwells2=intintdapi_allwells;
puncta_allwells2=puncta_allwells;
sitelist_allwells2=sitelist_allwells;
SumPunctaArea_allwells2=SumPunctaArea_allwells;
SumPunctaMetric_allwells2=SumPunctaMetric_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA48-MCF10A IF after ATMi ATRi\MA48-20151027-MCF10A-IF-10x-ATM-ATRi_687\analyzedData_10Xpuncta\3_1_data.mat')
avgnuccy3_allwells3=avgnuccy3_allwells;
avgnuccy5_allwells3=avgnuccy5_allwells;
avgnucfitc_allwells3=avgnucfitc_allwells;
AvgPunctaIntensity_allwells3=AvgPunctaIntensity_allwells;
% centroid_allwells2=centroid_allwells;
intintdapi_allwells3=intintdapi_allwells;
puncta_allwells3=puncta_allwells;
sitelist_allwells3=sitelist_allwells;
SumPunctaArea_allwells3=SumPunctaArea_allwells;
SumPunctaMetric_allwells3=SumPunctaMetric_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA48-MCF10A IF after ATMi ATRi\MA48-20151027-MCF10A-IF-10x-ATM-ATRi_687\analyzedData_10Xpuncta\4_1_data.mat')
avgnuccy3_allwells4=avgnuccy3_allwells;
avgnuccy5_allwells4=avgnuccy5_allwells;
avgnucfitc_allwells4=avgnucfitc_allwells;
AvgPunctaIntensity_allwells4=AvgPunctaIntensity_allwells;
% centroid_allwells2=centroid_allwells;
intintdapi_allwells4=intintdapi_allwells;
puncta_allwells4=puncta_allwells;
sitelist_allwells4=sitelist_allwells;
SumPunctaArea_allwells4=SumPunctaArea_allwells;
SumPunctaMetric_allwells4=SumPunctaMetric_allwells;

%combine data from all wells
avgnuccy3_allwells=[avgnuccy3_allwells1 avgnuccy3_allwells2 avgnuccy3_allwells3 avgnuccy3_allwells4];
avgnuccy5_allwells=[avgnuccy5_allwells1 avgnuccy5_allwells2 avgnuccy5_allwells3 avgnuccy5_allwells4];
avgnucfitc_allwells=[avgnucfitc_allwells1 avgnucfitc_allwells2 avgnucfitc_allwells3 avgnucfitc_allwells4];
AvgPunctaIntensity_allwells=[AvgPunctaIntensity_allwells1 AvgPunctaIntensity_allwells2 AvgPunctaIntensity_allwells3 AvgPunctaIntensity_allwells4];
% centroid_allwells=[centroid_allwells1 centroid_allwells2];
intintdapi_allwells=[intintdapi_allwells1 intintdapi_allwells2 intintdapi_allwells3 intintdapi_allwells4];
puncta_allwells=[puncta_allwells1 puncta_allwells2 puncta_allwells3 puncta_allwells4];
sitelist_allwells=[sitelist_allwells1 sitelist_allwells2 sitelist_allwells3 sitelist_allwells4 ];
SumPunctaArea_allwells=[SumPunctaArea_allwells1 SumPunctaArea_allwells2 SumPunctaArea_allwells3 SumPunctaArea_allwells4];
SumPunctaMetric_allwells=[SumPunctaMetric_allwells1 SumPunctaMetric_allwells2 SumPunctaMetric_allwells3 SumPunctaMetric_allwells4];

% avgnuccy3_allwells=[avgnuccy3_allwells1 ];
% avgnuccy5_allwells=[avgnuccy5_allwells1 ];
% avgnucfitc_allwells=[avgnucfitc_allwells1 ];
% AvgPunctaIntensity_allwells=[AvgPunctaIntensity_allwells1 ];
% % centroid_allwells=[centroid_allwells1 centroid_allwells2];
% intintdapi_allwells=[intintdapi_allwells1 ];
% puncta_allwells=[puncta_allwells1 ];
% sitelist_allwells=[sitelist_allwells1 ];
% SumPunctaArea_allwells=[SumPunctaArea_allwells1 ];
% SumPunctaMetric_allwells=[SumPunctaMetric_allwells1 ];

figure(1)
hist(intintdapi_allwells, 10000)
xlim([0 5e6])

dapiweirdI=[];
dapiweirdI=find(intintdapi_allwells < 1e5 | intintdapi_allwells > 2.5e6);  %indices for cells with too high or too low DNA content
for i=0:length(dapiweirdI)-1  
    indextoremove=dapiweirdI(end-i);  %go backwards so numbering doesn't get messed up
    avgnucfitc_allwells(indextoremove)=[];
    avgnuccy3_allwells(indextoremove)=[];
    avgnuccy5_allwells(indextoremove)=[];  
    intintdapi_allwells(indextoremove)=[];
    
    AvgPunctaIntensity_allwells(indextoremove)=[];
    SumPunctaArea_allwells(indextoremove)=[];
    SumPunctaMetric_allwells(indextoremove)=[];
    puncta_allwells(indextoremove)=[];
    
%     centroid_allwells(indextoremove,:)=[];
    sitelist_allwells(indextoremove)=[];
end

for j=1:length(puncta_allwells)
    numpunctapercell(j)=length(puncta_allwells(j).puncta);
end

figure(2)
hist(intintdapi_allwells, 100)

figure(3)
hist(log10(avgnuccy3_allwells),100)

%find indices for G0/G1 cells or for S phase cells
G0G1cellsI=find(log10(avgnuccy5_allwells) <2.6 & intintdapi_allwells <1.2e6);
ScellsI=find(log10(avgnuccy5_allwells) > 2.7);
G2McellsI=find(log10(avgnuccy5_allwells) <2.6 & intintdapi_allwells >1.3e6);


%%%%%%%%%%%%for puncta
allcellswith0puncta=find(numpunctapercell==0);
% puncta1I=find(numpunctapercell==1);
% puncta2ormoreI=find(numpunctapercell>=2);
allcellswith1ormorepuncta=find(numpunctapercell>=1);


%%%%% Module 1
% First classify the cells as high or low p21 and then find the percentage
% of cells in each are with & without puncta


%find % of ALL cells with 0 puncta
numpuncta_G0G1cells=numpunctapercell(G0G1cellsI);   %store the numpuncta of justthe isolated G0/G1 cells
G0G1cellswith0puncta=find(numpuncta_G0G1cells==0); %find % of G0g1 cells with 0 puncta
G0G1cellswith0puncta_cellid = G0G1cellsI(G0G1cellswith0puncta);
G0G1cellswith1ormorepuncta=find(numpuncta_G0G1cells>=1); %find % of G0G1 cells with 1 or more puncta
G0G1cellswith1ormorepuncta_cellid = G0G1cellsI(G0G1cellswith1ormorepuncta);
%Finding thr cy3 value of G0G1cells

cy3_G0G1cells=(avgnuccy3_allwells(G0G1cellsI));
%cy3_G0G1cells(2,:)= G0G1cellsI;

cellswithlowp21inG0G1_val=find(log10(cy3_G0G1cells)<2.9); %G0G1 cells that have low p21 
cellswithlowp21inG0G1_cellid = G0G1cellsI(cellswithlowp21inG0G1_val);%cellids of cells with lowp21 & in G0G1

cellswithhighp21inG0G1_val=find(log10(cy3_G0G1cells)>=2.9); %G0G1 cells that have low p21 
cellswithhighp21inG0G1_cellid = G0G1cellsI(cellswithhighp21inG0G1_val);%cellids of cells with highp21 & in G0G1

% Finding the cells with & eithout puncta in both low & high p21 regions
lowp21cellsinG0G1thatalsohavepuncta=find(numpunctapercell(cellswithlowp21inG0G1_cellid)>=1); %G0G1 cells that have LOW p21 AND also have puncta
lowp21cellsinG0G1with0puncta=find(numpunctapercell(cellswithlowp21inG0G1_cellid)==0); %G0G1 cells that have LOW p21 but do not have puncta
highp21cellsinG0G1thatalsohavepuncta=find(numpunctapercell(cellswithhighp21inG0G1_cellid)>=1); %G0G1 cells that have HIGH p21 AND also have puncta
highp21cellsinG0G1with0puncta=find(numpunctapercell(cellswithhighp21inG0G1_cellid)==0); %G0G1 cells that have HIGH p21 but do not have puncta


%Finding percentages
% pctofallcellswith0puncta=length(allcellswith0puncta)/length(numpunctapercell)
% pctofallcellswith1ormorepuncta=length(allcellswith1ormorepuncta)/length(numpunctapercell)

% pct_low_p21_in_G0G1 = length(cellswithlowp21inG0G1_val)/length(G0G1cellsI)
pct_high_p21_in_G0G1 = length(cellswithhighp21inG0G1_val)/length(G0G1cellsI)

% pct_low_p21_in_G0G1_without_puncta = length(lowp21cellsinG0G1with0puncta)/length(cellswithlowp21inG0G1_val)
pct_low_p21_in_G0G1_with_puncta = length(lowp21cellsinG0G1thatalsohavepuncta)/length(cellswithlowp21inG0G1_val)


% pct_high_p21_in_G0G1_without_puncta = length(highp21cellsinG0G1with0puncta)/length(cellswithhighp21inG0G1_val)
pct_high_p21_in_G0G1_with_puncta = length(highp21cellsinG0G1thatalsohavepuncta)/length(cellswithhighp21inG0G1_val)


%%%%% Module 2
%% First find the cells with & without puncta and then try to classify them as high or low p21

% % G0G1 cells with & without puncta 
% 
% G0G1cellswith0puncta=find(numpuncta_G0G1cells==0); %find % of G0g1 cells with 0 puncta
% G0G1cellswith1ormorepuncta=find(numpuncta_G0G1cells>=1); %find % of G0G1 cells with 1 or more puncta
% cy3_G0G1cells=(avgnuccy3_allwells(G0G1cellsI));

cy3_G0G1cells_without_puncta = avgnuccy3_allwells(G0G1cellswith0puncta_cellid);
cy3_G0G1cells_with_puncta = avgnuccy3_allwells(G0G1cellswith1ormorepuncta_cellid);

%pRb
%num_cells_without_puncta_lowpRbinG0G1=length(find(log10(cy3_G0G1cells_without_puncta)<3.9));
% num_cells_with_puncta_lowpRbinG0G1=length(find(log10(cy3_G0G1cells_with_puncta)<3.9));  

% pct_without_puncta_G0G1_low_pRb =  num_cells_without_puncta_lowpRbinG0G1/length(G0G1cellswith0puncta_cellid)
% pct_with_puncta_G0G1_low_pRb =  num_cells_with_puncta_lowpRbinG0G1/length(G0G1cellswith1ormorepuncta_cellid)

%p21
num_cells_without_puncta_highp21inG0G1=length(find(log10(cy3_G0G1cells_without_puncta)>=2.9));
num_cells_with_puncta_highp21inG0G1=length(find(log10(cy3_G0G1cells_with_puncta)>=2.9));  

pct_without_puncta_G0G1_high_p21 =  num_cells_without_puncta_highp21inG0G1/length(G0G1cellswith0puncta_cellid)
pct_with_puncta_G0G1_high_p21 =  num_cells_with_puncta_highp21inG0G1/length(G0G1cellswith1ormorepuncta_cellid)

