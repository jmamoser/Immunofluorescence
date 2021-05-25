clear all; close all;

load('Y:\IXMicroImages-goodNames\Mansi\MA48-20151027-MCF10A-IF-10x-ATM-ATRi_687\analyzedData_10Xpuncta\1_2_data.mat')
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

load('Y:\IXMicroImages-goodNames\Mansi\MA48-20151027-MCF10A-IF-10x-ATM-ATRi_687\analyzedData_10Xpuncta\2_2_data.mat')
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

load('Y:\IXMicroImages-goodNames\Mansi\MA48-20151027-MCF10A-IF-10x-ATM-ATRi_687\analyzedData_10Xpuncta\3_2_data.mat')
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

load('Y:\IXMicroImages-goodNames\Mansi\MA48-20151027-MCF10A-IF-10x-ATM-ATRi_687\analyzedData_10Xpuncta\4_2_data.mat')
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

dapiweirdI=[];
dapiweirdI=find(intintdapi_allwells < 5e5 | intintdapi_allwells > 4e6);  %indices for cells with too high or too low DNA content
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

figure(1)
subplot(1,3,1)
dscatter(intintdapi_allwells', log10(avgnuccy3_allwells)')
axis([5e4 3e6 2.2 4])
title('all cells')
xlabel('DNA content')
ylabel('phosphoRb 807/811')

subplot(1,3,2)
dscatter(intintdapi_allwells', log10(avgnuccy5_allwells)')
axis([5e4 3e6 2 4])
title('all cells')
xlabel('DNA content')
ylabel('EdU')

subplot(1,3,3)
dscatter(log10(avgnuccy3_allwells)', log10(avgnuccy5_allwells)')
axis([2.2 4 2 4])
title('all cells')
xlabel('phosphoRb 807/811')
ylabel('EdU')

% figure(1)
% subplot(1,3,1)
% dscatter(intintdapi_allwells', log10(avgnucfitc_allwells)')
% axis([1e5 6e6 3.4 4])
% title('all cells')
% xlabel('DNA content')
% ylabel('Alexa488-p21')
% 
% subplot(1,3,2)
% dscatter(intintdapi_allwells', log10(avgnuccy5_allwells)')
% axis([1e5 6e6 2.8 4])
% title('all cells')
% xlabel('DNA content')
% ylabel('pRb-807/811')
% 
% subplot(1,3,3)
% dscatter(log10(avgnucfitc_allwells)', log10(avgnuccy5_allwells)')
% axis([3.4 4 2.6 4])
% title('all cells')
% xlabel('Alexa488-p21')
% ylabel('pRb-807/811')


% figure(1)
% hist(intintdapi_allwells, 10000)
% xlim([0 5e6])
% 
% dapiweirdI=[];
% dapiweirdI=find(intintdapi_allwells < 1e5 | intintdapi_allwells > 4e6);  %indices for cells with too high or too low DNA content
% for i=0:length(dapiweirdI)-1  
%     indextoremove=dapiweirdI(end-i);  %go backwards so numbering doesn't get messed up
%     avgnucfitc_allwells(indextoremove)=[];
%     avgnuccy3_allwells(indextoremove)=[];
%     avgnuccy5_allwells(indextoremove)=[];  
%     intintdapi_allwells(indextoremove)=[];
%     
%     AvgPunctaIntensity_allwells(indextoremove)=[];
%     SumPunctaArea_allwells(indextoremove)=[];
%     SumPunctaMetric_allwells(indextoremove)=[];
%     puncta_allwells(indextoremove)=[];
%     
% %     centroid_allwells(indextoremove,:)=[];
%     sitelist_allwells(indextoremove)=[];
% end
% 
% for j=1:length(puncta_allwells)
%     numpunctapercell(j)=length(puncta_allwells(j).puncta);
% end
% 
% figure(2)
% hist(intintdapi_allwells, 100)
% 
% 
% %find indices for G0/G1 cells or for S phase cells
% G0G1cellsI=find(log10(avgnuccy5_allwells) <2.6 & intintdapi_allwells <1.2e6);
% ScellsI=find(log10(avgnuccy5_allwells) > 2.7);
% G2McellsI=find(log10(avgnuccy5_allwells) <2.6 & intintdapi_allwells >1.3e6);
% 
% 
% figure(3)  
% subplot(1,4,1)
% dscatter(intintdapi_allwells', log10(avgnuccy5_allwells)')
% axis([1e5 3e6 2 4])
% title('all cells')
% xlabel('DNA content')
% ylabel('EdU')
% 
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
% 
% 
% 
% 
% 
% %%%%%%%%%%sanity check: %test whether p21 distribution makes sense for G0/G1 vs S vs G2/M phase cells
% figure(4)  
% subplot(4,1,1)
% hist(log10(avgnuccy3_allwells),100)
% xlabel('pRb in all cells')
% xlim([2.4 4])
% 
% subplot(4,1,2)
% hist(log10(avgnuccy3_allwells(G0G1cellsI)),100)
% xlabel('pRb in G0/G1 cells')
% xlim([2.4 4])
% 
% subplot(4,1,3)
% hist(log10(avgnuccy3_allwells(ScellsI)),100)
% xlabel('pRb in S phase cells')
% xlim([2.4 4])
% 
% subplot(4,1,4)
% hist(log10(avgnuccy3_allwells(G2McellsI)),100)
% xlabel('pRb in G2/M phase cells')
% xlim([2.4 4])
% 
% 
% %%%%%%%%%%%%for puncta
% puncta0I=find(numpunctapercell==0);
% puncta1I=find(numpunctapercell==1);
% puncta2ormoreI=find(numpunctapercell>=2);
% puncta1ormoreI=find(numpunctapercell>=1);
% 
% %find % of ALL cells with 0 puncta
% pctcells_0puncta=length(puncta0I)/length(numpunctapercell)
% %find % of G0g1 cells with 0 puncta
% numpuncta_G0G1cells=numpunctapercell(G0G1cellsI);   %store the numpuncta of justthe isolated G0/G1 cells
% puncta0_G0G1cellsI=find(numpuncta_G0G1cells==0);
% puncta1_G0G1cellsI=find(numpuncta_G0G1cells>=1);
% puncta2ormore_G0G1cellsI=find(numpuncta_G0G1cells>=2);
% puncta1ormore_G0G1cellsI=find(numpuncta_G0G1cells>=1);
% pctG0G1cells_0puncta=length(puncta0_G0G1cellsI)/length(G0G1cellsI)
% pctG0G1cells_1ormorepuncta=length(puncta1_G0G1cellsI)/length(G0G1cellsI)
% 
% cy3_G0G1cells=avgnuccy3_allwells(G0G1cellsI);  %store the cy3 levels of justthe isolate G0/G1 cells
% 
% % find % of S cells with 0 puncta
% numpuncta_Scells=numpunctapercell(ScellsI);   %store the numpuncta of justthe isolated S cells
% puncta0_ScellsI=find(numpuncta_Scells==0);
% pctScells_0puncta=length(puncta0_ScellsI)/length(ScellsI)
% %find % of G2M cells with 0 puncta
% numpuncta_G2Mcells=numpunctapercell(G2McellsI);   %store the numpuncta of justthe isolated G2M cells
% puncta0_G2McellsI=find(numpuncta_G2Mcells==0);
% pctG2Mcells_0puncta=length(puncta0_G2McellsI)/length(G2McellsI)
% 
% 
% figure(5)  %plot # puncta for G0/G1 vs S vs G2/M phase cells
% subplot(4,1,1)
% hist(numpunctapercell,1000)
% xlabel('# puncta in all cells')
% title(pctcells_0puncta)  %print % of all cells w 0 puncta
% xlim([0 8])
% 
% subplot(4,1,2)
% hist(numpunctapercell(G0G1cellsI),100)
% xlabel('# puncta in G0/G1 cells')
% title(pctG0G1cells_0puncta) %print % of G0G1 cells with 0 puncta
% xlim([0 8])
% % ylim([0 1100])
% 
% subplot(4,1,3)
% hist(numpunctapercell(ScellsI),100)
% xlabel('# puncta in S phase cells')
% title(pctScells_0puncta)  %print % of S phase cells with 0 puncta
% xlim([0 8])
% % ylim([0 1100])
% 
% subplot(4,1,4)
% hist(numpunctapercell(G2McellsI),1000)
% xlabel('# puncta in G2/M phase cells')
% title(pctG2Mcells_0puncta)  %print % of G2M cells with 0 puncta
% xlim([0 8])
% % ylim([0 1100])
% 
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
% 
% %%%%%%%%%%%%for G0/G1 cells selected on EdU and DNA content
% 
% figure(7)
% subplot(4,1,1)
% hist(log10(avgnuccy3_allwells(G0G1cellsI)),100)
% xlabel('pRb in G0/G1 cells')
% xlim([2.4 4])
% subplot(4,1,2)
% hist(log10(cy3_G0G1cells(puncta0_G0G1cellsI)), 50)
% xlabel('pRb in G0/G1 cells with 0 puncta')
% xlim([2.4 4])
% subplot(4,1,3)
% hist(log10(cy3_G0G1cells(puncta1_G0G1cellsI)),50)
% xlabel('pRb in G0/G1 cells with 1 puncta')
% xlim([2.4 4])
% subplot(4,1,4)
% hist(log10(cy3_G0G1cells(puncta2ormore_G0G1cellsI)),50)
% xlabel('pRb in G0/G1 cells with 2 or more puncta')
% xlim([2.4 4])
% 
% % logbins=logspace(3.4, 4.8);
% 
% figure(8)
% subplot(4,1,1)
% hist(log10(avgnuccy3_allwells), 100)
% xlabel('pRb in all cells')
% xlim([2.4 4])
% 
% subplot(4,1,2)
% hist(log10(avgnuccy3_allwells(G0G1cellsI)),115)
% xlabel('pRb in G0/G1 cells')
% xlim([2.4 4])
% 
% subplot(4,1,3)
% hist(log10(cy3_G0G1cells(puncta0_G0G1cellsI)), 115)
% xlabel('pRb in G0/G1 cells with 0 puncta')
% xlim([2.4 4])
% 
% subplot(4,1,4)
% hist(log10(cy3_G0G1cells(puncta1ormore_G0G1cellsI)), 115)
% xlabel('pRb in G0/G1 cells with 1 or more puncta')
% xlim([2.4 4])

%pRb
% cellswithlowpRb=find(log10(avgnuccy3_allwells)<4.06);
% cellswithlowpRb_G0G1=find(log10(avgnuccy3_allwells(G0G1cellsI))<4.06); %this is 'x'
% cellswithhighpRb_G0G1=find(log10(avgnuccy3_allwells(G0G1cellsI))>=4.06);
% cellswithlowpRb_G0G1_puncta=find(log10(cy3_G0G1cells(puncta1ormore_G0G1cellsI))<4.06);
% cellswithlowpRb_G0G1_0puncta=find(log10(cy3_G0G1cells(puncta0_G0G1cellsI))<4.06);
% 
% 
% y=find(numpunctapercell(cellswithlowpRb_G0G1)>=1);
% z=find(numpunctapercell(cellswithlowpRb_G0G1)==0);
% cellswithhighpRbG0G1_puncta=find(numpunctapercell(cellswithhighpRb_G0G1)>=1);
% cellswithhighpRbG0G1_0puncta=find(numpunctapercell(cellswithhighpRb_G0G1)==0);
% 
% pct_cellswithlowpRb=length(cellswithlowpRb)/length(avgnuccy3_allwells) % pct cells with high pRb in total population
% pct_cellswithlowpRb_G0G1=length(cellswithlowpRb_G0G1)/length(G0G1cellsI) % pct cells with high pRb in G0G1 cells
% pct_cellswithlowpRb_G0G1_withpuncta=length(cellswithlowpRb_G0G1_puncta)/length(puncta1ormore_G0G1cellsI) %pct cells with high pRb in cells with one or more puncta
% pct_cellswithlowpRb_G0G1_0puncta=length(cellswithlowpRb_G0G1_0puncta)/length(puncta0_G0G1cellsI) %pct cells with high pRb in cells with zero puncta
% pctcellswithlowpRbandpuncta=length(y)/length(cellswithlowpRb_G0G1) % pct of high pRb cells in G0G1 that have >=1 puncta.
% pctcellswithlowpRbwithnopuncta=length(z)/length(cellswithlowpRb_G0G1) %pct of G0G1 cells with high pRb cells that have no puncta.
% pctcellswithhighpRbandpuncta=length(cellswithhighpRbG0G1_puncta)/length(cellswithhighpRb_G0G1) % pct g0g1 cells with low pRb  
% pctcellswithhighpRband0puncta=length(cellswithhighpRbG0G1_0puncta)/length(cellswithhighpRb_G0G1)

%p21 

% cellswithhighpRb=find(log10(avgnuccy3_allwells)>3.9); %cells with high pRb in the total population
% 
% cellswithhighpRb_G0G1=find(log10(avgnuccy3_allwells(G0G1cellsI))>3.9); %cells with high pRb in the G0G1 population
% cellswithlowpRb_G0G1=find(log10(avgnuccy3_allwells(G0G1cellsI))<3.9);
% 
% cellswithhighpRb_G0G1_withpuncta=find(log10(cy3_G0G1cells(puncta1ormore_G0G1cellsI))>3.9);
% cellswithhighpRb_G0G1_0puncta=find(log10(cy3_G0G1cells(puncta0_G0G1cellsI))>3.9);



% y=find(numpunctapercell(cellswithhighpRb_G0G1)>=1);
% z=find(numpunctapercell(cellswithhighpRb_G0G1)==0);
% cellswithlowpRbG0G1_puncta=find(numpunctapercell(cellswithlowpRb_G0G1)>=1);
% cellswithlowpRbG0G1_0puncta=find(numpunctapercell(cellswithlowpRb_G0G1)==0);

% pct_cellswithhighpRb=length(cellswithhighpRb)/length(avgnuccy3_allwells) % pct cells with high pRb in total population
% pct_cellswithhighpRb_G0G1=length(cellswithhighpRb_G0G1)/length(G0G1cellsI) % pct cells with high pRb in G0G1 cells
% pct_cellswithhighpRb_G0G1_withpuncta=length(cellswithhighpRb_G0G1_withpuncta)/length(puncta1ormore_G0G1cellsI) %pct cells with high pRb in cells with one or more puncta
% pct_cellswithhighpRb_G0G1_0puncta=length(cellswithhighpRb_G0G1_0puncta)/length(puncta0_G0G1cellsI) %pct cells with high pRb in cells with zero puncta
% pctcellswithhighpRbandpuncta=length(y)/length(cellswithhighpRb_G0G1) % pct of high pRb cells in G0G1 that have >=1 puncta.
% pctcellswithhighpRbwithnopuncta=length(z)/length(cellswithhighpRb_G0G1) %pct of G0G1 cells with high pRb cells that have no puncta.
% pctcellswithlowpRbandpuncta=length(cellswithlowpRbG0G1_puncta)/length(cellswithlowpRb_G0G1) % pct g0g1 cells with low pRb  
% pctcellswithlowpRband0puncta=length(cellswithlowpRbG0G1_0puncta)/length(cellswithlowpRb_G0G1)


% saveas(figure(3),[dir, '20151219_1_2_4_EduscatterG1SG2M.fig'])
% saveas(figure(4),[dir, '20150212_' num2str(row) '_' num2str(col) '_p21inG0G1SG2M.fig'])
% saveas(figure(5),[dir, '20141204_' num2str(row) '_' num2str(col) '_pctcellswith0puncta.fig'])
% saveas(figure(6),[dir, '20150212_' num2str(row) '_' num2str(col) '_p21vspuncta_allcells.fig'])
% saveas(figure(7),[dir, '20150212_' num2str(row) '_' num2str(col) '_p21vspuncta_G0G1.fig'])
% saveas(figure(8),[dir, '20150212_' num2str(row) '_' num2str(col) '_p21vspuncta_G0G1_0or1puncta.fig'])
