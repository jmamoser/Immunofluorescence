clear all; close all;

load('f20160309-20pctO2-day0-p21pRb_1432\analyzedData_10Xpuncta\1_7_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57 IF for hypoxia\MA57-20160309-20pctO2day10-p21prb_1420\analyzedData_10Xpuncta\1_2_data.mat')
avgnuccy5_allwells1=avgnuccy5_allwells;
avgnucfitc_allwells1=avgnucfitc_allwells;
AvgPunctaIntensity_allwells1=AvgPunctaIntensity_allwells;
% centroid_allwells1=centroid_allwells;
intintdapi_allwells1=intintdapi_allwells;
puncta_allwells1=puncta_allwells;
sitelist_allwells1=sitelist_allwells;
SumPunctaArea_allwells1=SumPunctaArea_allwells;
SumPunctaMetric_allwells1=SumPunctaMetric_allwells;

% load('Y:\IXMicroImages-goodNames\Mansi\MA57 IF for hypoxia\MA57-20160309-20pctO2-day0-p21pRb_1432\analyzedData_10Xpuncta\1_5_data.mat')
% % load('Y:\IXMicroImages-goodNames\Mansi\MA57 IF for hypoxia\MA57-20160309-20pctO2day10-p21prb_1420\analyzedData_10Xpuncta\1_3_data.mat')
% avgnuccy5_allwells2=avgnuccy5_allwells;
% avgnucfitc_allwells2=avgnucfitc_allwells;
% AvgPunctaIntensity_allwells2=AvgPunctaIntensity_allwells;
% % centroid_allwells2=centroid_allwells;
% intintdapi_allwells2=intintdapi_allwells;
% puncta_allwells2=puncta_allwells;
% sitelist_allwells2=sitelist_allwells;
% SumPunctaArea_allwells2=SumPunctaArea_allwells;
% SumPunctaMetric_allwells2=SumPunctaMetric_allwells;
% % 
% load('Y:\IXMicroImages-goodNames\Mansi\MA57 IF for hypoxia\MA57-20160309-20pctO2-day0-p21pRb_1432\analyzedData_10Xpuncta\1_2_data.mat')
% % load('Y:\IXMicroImages-goodNames\Mansi\MA57 IF for hypoxia\MA57-20160309-20pctO2day10-p21prb_1420\analyzedData_10Xpuncta\1_3_data.mat')
% avgnuccy5_allwells3=avgnuccy5_allwells;
% avgnucfitc_allwells3=avgnucfitc_allwells;
% AvgPunctaIntensity_allwells3=AvgPunctaIntensity_allwells;
% % centroid_allwells2=centroid_allwells;
% intintdapi_allwells3=intintdapi_allwells;
% puncta_allwells3=puncta_allwells;
% sitelist_allwells3=sitelist_allwells;
% SumPunctaArea_allwells3=SumPunctaArea_allwells;
% SumPunctaMetric_allwells3=SumPunctaMetric_allwells;
% % 
% load('Y:\IXMicroImages-goodNames\Mansi\MA57 IF for hypoxia\MA57-20160309-20pctO2-day0-p21pRb_1432\analyzedData_10Xpuncta\1_3_data.mat')
% % load('Y:\IXMicroImages-goodNames\Mansi\MA57 IF for hypoxia\MA57-20160309-20pctO2day10-p21prb_1420\analyzedData_10Xpuncta\1_4_data.mat')
% avgnuccy5_allwells4=avgnuccy5_allwells;
% avgnucfitc_allwells4=avgnucfitc_allwells;
% AvgPunctaIntensity_allwells4=AvgPunctaIntensity_allwells;
% % centroid_allwells2=centroid_allwells;
% intintdapi_allwells4=intintdapi_allwells;
% puncta_allwells4=puncta_allwells;
% sitelist_allwells4=sitelist_allwells;
% SumPunctaArea_allwells4=SumPunctaArea_allwells;
% SumPunctaMetric_allwells4=SumPunctaMetric_allwells;
% 
% %combine data from all wells
% % avgnuccy3_allwells=[avgnuccy3_allwells1 avgnuccy3_allwells2 avgnuccy3_allwells3 avgnuccy3_allwells4];
% avgnuccy5_allwells=[avgnuccy5_allwells1 avgnuccy5_allwells2 avgnuccy5_allwells3 avgnuccy5_allwells4];
% avgnucfitc_allwells=[avgnucfitc_allwells1 avgnucfitc_allwells2 avgnucfitc_allwells3 avgnucfitc_allwells4];
% AvgPunctaIntensity_allwells=[AvgPunctaIntensity_allwells1 AvgPunctaIntensity_allwells2 AvgPunctaIntensity_allwells3 AvgPunctaIntensity_allwells4];
% % centroid_allwells=[centroid_allwells1 centroid_allwells2];
% intintdapi_allwells=[intintdapi_allwells1 intintdapi_allwells2 intintdapi_allwells3 intintdapi_allwells4];
% puncta_allwells=[puncta_allwells1 puncta_allwells2 puncta_allwells3 puncta_allwells4];
% sitelist_allwells=[sitelist_allwells1 sitelist_allwells2 sitelist_allwells3 sitelist_allwells4 ];
% SumPunctaArea_allwells=[SumPunctaArea_allwells1 SumPunctaArea_allwells2 SumPunctaArea_allwells3 SumPunctaArea_allwells4];
% SumPunctaMetric_allwells=[SumPunctaMetric_allwells1 SumPunctaMetric_allwells2 SumPunctaMetric_allwells3 SumPunctaMetric_allwells4];

% % avgnuccy3_allwells=[avgnuccy3_allwells1 ];
% avgnuccy5_allwells=[avgnuccy5_allwells1 avgnuccy5_allwells2 ];
% avgnucfitc_allwells=[avgnucfitc_allwells1 avgnucfitc_allwells2  ];
% AvgPunctaIntensity_allwells=[AvgPunctaIntensity_allwells1 AvgPunctaIntensity_allwells2 ];
% % centroid_allwells=[centroid_allwells1 centroid_allwells2];
% intintdapi_allwells=[intintdapi_allwells1 intintdapi_allwells2];
% puncta_allwells=[puncta_allwells1 puncta_allwells2];
% sitelist_allwells=[sitelist_allwells1 sitelist_allwells2 ];
% SumPunctaArea_allwells=[SumPunctaArea_allwells1 SumPunctaArea_allwells2 ];
% SumPunctaMetric_allwells=[SumPunctaMetric_allwells1 SumPunctaMetric_allwells2];

figure(1)
hist(intintdapi_allwells, 10000)
 xlim([0 1.0e7])

dapiweirdI=[];
dapiweirdI=find(intintdapi_allwells < 5.6e5 | intintdapi_allwells > 1.2e7);  %indices for cells with too high or too low DNA content
for i=0:length(dapiweirdI)-1  
    indextoremove=dapiweirdI(end-i);  %go backwards so numbering doesn't get messed up
    avgnucfitc_allwells(indextoremove)=[];
%     avgnuccy3_allwells(indextoremove)=[];
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


%find indices for G0/G1 cells or for S phase cells
G0G1cellsI=find(intintdapi_allwells <4.6e6);
ScellsI=find(intintdapi_allwells >4.6e6 & intintdapi_allwells <6.75e6);
G2McellsI=find(intintdapi_allwells >=6.75e6);


% figure(3)  
% subplot(1,4,1)
% dscatter(intintdapi_allwells', log10(avgnuccy5_allwells)')
% axis([1e5 3e6 2 4])
% title('all cells')
% xlabel('DNA content')
% ylabel('EdU')

% subplot(1,4,2)
% dscatter(intintdapi_allwells(G0G1cellsI)', log10(avgnuccy5_allwells(G0G1cellsI))')
% axis([1e5 3e6 2 4])
% title('selected G0/G1 cells')
% 
% subplot(1,4,3)
% dscatter(intintdapi_allwells(ScellsI)', log10(avgnuccy5_allwells(ScellsI))')
% axis([1e5 3e6 2 4])
% title('selected S phase cells')
% 
% subplot(1,4,4)
% dscatter(intintdapi_allwells(G2McellsI)', log10(avgnuccy5_allwells(G2McellsI))')
% axis([1e5 3e6 2 4])
% title('selected G2/M phase cells')


% figure (300)
% dscatter(intintdapi_allwells', log10(avgnuccy5_allwells)')
% axis([1e5 2.5e6 2 4])
% title('all cells')
% xlabel('DNA content')
% ylabel('EdU')

%%%%%%%%%%sanity check: %test whether p21 distribution makes sense for G0/G1 vs S vs G2/M phase cells
figure(400)  
hist(log10(avgnuccy5_allwells),100)
xlabel('p21 in all cells')
% xlim([2.4 4])



figure(4)  
subplot(4,1,1)
hist(log10(avgnuccy5_allwells),100)
xlabel('pRb in all cells')
xlim([2.4 5])

subplot(4,1,2)
hist(log10(avgnuccy5_allwells(G0G1cellsI)),100)
xlabel('pRb in G0/G1 cells')
xlim([2.4 5])

subplot(4,1,3)
hist(log10(avgnuccy5_allwells(ScellsI)),100)
xlabel('pRb in S phase cells')
xlim([2.4 5])

subplot(4,1,4)
hist(log10(avgnuccy5_allwells(G2McellsI)),100)
xlabel('pRb in G2/M phase cells')
xlim([2.4 5])


%%%%%%%%%%%%for puncta
puncta0I=find(numpunctapercell==0);
puncta1I=find(numpunctapercell==1);
puncta2ormoreI=find(numpunctapercell>=2);
puncta1ormoreI=find(numpunctapercell>=1);

%find % of ALL cells with 0 puncta
pctcells_0puncta=length(puncta0I)/length(numpunctapercell)
%find % of G0g1 cells with 0 puncta
numpuncta_G0G1cells=numpunctapercell(G0G1cellsI);   %store the numpuncta of justthe isolated G0/G1 cells
puncta0_G0G1cellsI=find(numpuncta_G0G1cells==0);
puncta1_G0G1cellsI=find(numpuncta_G0G1cells>=1);
puncta2ormore_G0G1cellsI=find(numpuncta_G0G1cells>=2);
puncta1ormore_G0G1cellsI=find(numpuncta_G0G1cells>=1);
pctG0G1cells_0puncta=length(puncta0_G0G1cellsI)/length(G0G1cellsI)
pctG0G1cells_1ormorepuncta=length(puncta1_G0G1cellsI)/length(G0G1cellsI)

% cy3_G0G1cells=avgnuccy3_allwells(G0G1cellsI);  %store the cy3 levels of justthe isolate G0/G1 cells

% find % of S cells with 0 puncta
numpuncta_Scells=numpunctapercell(ScellsI);   %store the numpuncta of justthe isolated S cells
puncta0_ScellsI=find(numpuncta_Scells==0);
pctScells_0puncta=length(puncta0_ScellsI)/length(ScellsI)
%find % of G2M cells with 0 puncta
numpuncta_G2Mcells=numpunctapercell(G2McellsI);   %store the numpuncta of justthe isolated G2M cells
puncta0_G2McellsI=find(numpuncta_G2Mcells==0);
pctG2Mcells_0puncta=length(puncta0_G2McellsI)/length(G2McellsI)


figure(5)  %plot # puncta for G0/G1 vs S vs G2/M phase cells
subplot(4,1,1)
hist(numpunctapercell,1000)
xlabel('# puncta in all cells')
title(pctcells_0puncta)  %print % of all cells w 0 puncta
xlim([0 8])

subplot(4,1,2)
hist(numpunctapercell(G0G1cellsI),100)
xlabel('# puncta in G0/G1 cells')
title(pctG0G1cells_0puncta) %print % of G0G1 cells with 0 puncta
xlim([0 8])
% ylim([0 1100])

subplot(4,1,3)
hist(numpunctapercell(ScellsI),100)
xlabel('# puncta in S phase cells')
title(pctScells_0puncta)  %print % of S phase cells with 0 puncta
xlim([0 8])
% ylim([0 1100])

subplot(4,1,4)
hist(numpunctapercell(G2McellsI),1000)
xlabel('# puncta in G2/M phase cells')
title(pctG2Mcells_0puncta)  %print % of G2M cells with 0 puncta
xlim([0 8])
% ylim([0 1100])

% figure(6)
% subplot(4,1,1)
% hist(log10(avgnuccy3_allwells),100)
% xlabel('pRb in all cells')
% xlim([2.4 3.8])
% subplot(4,1,2)
% hist(log10(avgnuccy3_allwells(puncta0I)),100)
% xlabel('pRb in all cells with 0 puncta')
% xlim([2.4 3.8])
% subplot(4,1,3)
% hist(log10(avgnuccy3_allwells(puncta1I)),100)
% xlabel('pRb in all cells with 1 puncta')
% xlim([2.4 3.8])
% subplot(4,1,4)
% hist(log10(avgnuccy3_allwells(puncta2ormoreI)),100)
% xlabel('pRb in all cells with 2 or more puncta')
% xlim([2.4 3.8])
% 
% 
% 
% %%%%%%%%%%%%for G0/G1 cells selected on EdU and DNA content
% 
% figure(7)
% subplot(4,1,1)
% hist(log10(avgnuccy3_allwells(G0G1cellsI)),100)
% xlabel('pRb in G0/G1 cells')
% xlim([2.4 4])
% subplot(4,1,2)
% hist(log10(cy3_G0G1cells(puncta0_G0G1cellsI)), 100)
% xlabel('pRb in G0/G1 cells with 0 puncta')
% xlim([2.4 4])
% subplot(4,1,3)
% hist(log10(cy3_G0G1cells(puncta1_G0G1cellsI)),100)
% xlabel('pRb in G0/G1 cells with 1 puncta')
% xlim([2.4 4])
% subplot(4,1,4)
% hist(log10(cy3_G0G1cells(puncta2ormore_G0G1cellsI)),100)
% xlabel('pRb in G0/G1 cells with 2 or more puncta')
% xlim([2.4 4])
% 
% % logbins=logspace(3.4, 4.8);
% 
% figure(8)
% subplot(4,1,1)
% hist(log10(avgnuccy3_allwells), 100)
% xlabel('p21 in all cells')
% xlim([2.4 4])
% 
% subplot(4,1,2)
% hist(log10(avgnuccy3_allwells(G0G1cellsI)),100)
% xlabel('p21 in G0/G1 cells')
% xlim([2.4 4])
% 
% subplot(4,1,3)
% hist(log10(cy3_G0G1cells(puncta0_G0G1cellsI)), 100)
% xlabel('p21 in G0/G1 cells with 0 puncta')
% xlim([2.4 4])
% 
% subplot(4,1,4)
% hist(log10(cy3_G0G1cells(puncta1ormore_G0G1cellsI)), 100)
% xlabel('p21 in G0/G1 cells with 1 or more puncta')
% xlim([2.4 4])
% 
% 
% % saveas(figure(3),[dir, '20151219_1_2_4_EduscatterG1SG2M.fig'])
% % saveas(figure(4),[dir, '20150212_' num2str(row) '_' num2str(col) '_p21inG0G1SG2M.fig'])
% % saveas(figure(5),[dir, '20141204_' num2str(row) '_' num2str(col) '_pctcellswith0puncta.fig'])
% % saveas(figure(6),[dir, '20150212_' num2str(row) '_' num2str(col) '_p21vspuncta_allcells.fig'])
% % saveas(figure(7),[dir, '20150212_' num2str(row) '_' num2str(col) '_p21vspuncta_G0G1.fig'])
% % saveas(figure(8),[dir, '20150212_' num2str(row) '_' num2str(col) '_p21vspuncta_G0G1_0or1puncta.fig'])
