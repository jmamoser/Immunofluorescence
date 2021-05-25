clear all; close all;

% load('f20160309-20pctO2-day0-p21pRb_1432\analyzedData_10Xpuncta\1_7_data.mat')
load('Y:\IXMicroImages-goodNames\Mansi\Microscopy data\Live-cell imaging\MA64-20160604-preimaging_1665\Raw\analyzedData\2_12_data.mat')
cy5_1=avgnuccy5_allwells;
% fitc1=avgnucfitc_allwells;
dapi1=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\Microscopy data\Live-cell imaging\MA64-20160604-preimaging_1665\Raw\analyzedData\3_12_data.mat')
cy5_2=avgnuccy5_allwells;
% fitc2=avgnucfitc_allwells;
dapi2=intintdapi_allwells;
% % 
load('Y:\IXMicroImages-goodNames\Mansi\Microscopy data\Live-cell imaging\MA64-20160604-preimaging_1665\Raw\analyzedData\4_12_data.mat')
cy5_3=avgnuccy5_allwells;
% fitc3=avgnucfitc_allwells;
dapi3=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\Microscopy data\Live-cell imaging\MA64-20160604-preimaging_1665\Raw\analyzedData\1_12_data.mat')
cy5_4=avgnuccy5_allwells;
% fitc1=avgnucfitc_allwells;
dapi1=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\Microscopy data\Live-cell imaging\MA64-20160604-preimaging_1665\Raw\analyzedData\5_12_data.mat')
cy5_5=avgnuccy5_allwells;
% fitc2=avgnucfitc_allwells;
dapi2=intintdapi_allwells;
% % 
load('Y:\IXMicroImages-goodNames\Mansi\Microscopy data\Live-cell imaging\MA64-20160604-preimaging_1665\Raw\analyzedData\6_12_data.mat')
cy5_6=avgnuccy5_allwells;
% fitc3=avgnucfitc_allwells;
dapi3=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\Microscopy data\Live-cell imaging\MA64-20160604-preimaging_1665\Raw\analyzedData\7_12_data.mat')
cy5_7=avgnuccy5_allwells;
% fitc2=avgnucfitc_allwells;
dapi2=intintdapi_allwells;
% % 
load('Y:\IXMicroImages-goodNames\Mansi\Microscopy data\Live-cell imaging\MA64-20160604-preimaging_1665\Raw\analyzedData\8_12_data.mat')
cy5_8=avgnuccy5_allwells;
% fitc3=avgnucfitc_allwells;
dapi3=intintdapi_allwells;

% % 
% load('Y:\IXMicroImages-goodNames\Mansi\MA65-20160729-plainMCF10AIF-53BP1p21_1787\analyzedData_10Xpuncta\4_10_data.mat')
% avgnuccy5_allwells4=avgnuccy5_allwells;
% intintdapi_allwells4=intintdapi_allwells;

cy5_FGM=[ cy5_1 cy5_2 cy5_3 cy5_4 cy5_5 cy5_6 cy5_7 cy5_8 ];
% fitc_FGM = [fitc1 fitc2 ];
dapi_FGM=[dapi1 dapi2 dapi3  ];

load('Y:\IXMicroImages-goodNames\Mansi\Microscopy data\Live-cell imaging\MA64-20160604-preimaging_1665\Raw\analyzedData\2_10_data.mat')
cy5_9=avgnuccy5_allwells;
% fitc_5=avgnucfitc_allwells;
dapi5=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\Microscopy data\Live-cell imaging\MA64-20160604-preimaging_1665\Raw\analyzedData\3_10_data.mat')
cy5_10=avgnuccy5_allwells;
% fitc_6=avgnucfitc_allwells;
dapi6=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\Microscopy data\Live-cell imaging\MA64-20160604-preimaging_1665\Raw\analyzedData\4_10_data.mat')
cy5_11=avgnuccy5_allwells;
% fitc_7=avgnucfitc_allwells;
dapi7=intintdapi_allwells;


load('Y:\IXMicroImages-goodNames\Mansi\Microscopy data\Live-cell imaging\MA64-20160604-preimaging_1665\Raw\analyzedData\1_10_data.mat')
cy5_12=avgnuccy5_allwells;
% fitc_5=avgnucfitc_allwells;
dapi5=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\Microscopy data\Live-cell imaging\MA64-20160604-preimaging_1665\Raw\analyzedData\5_10_data.mat')
cy5_13=avgnuccy5_allwells;
% fitc_6=avgnucfitc_allwells;
dapi6=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\Microscopy data\Live-cell imaging\MA64-20160604-preimaging_1665\Raw\analyzedData\6_10_data.mat')
cy5_14=avgnuccy5_allwells;
% fitc_7=avgnucfitc_allwells;
dapi7=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\Microscopy data\Live-cell imaging\MA64-20160604-preimaging_1665\Raw\analyzedData\7_10_data.mat')
cy5_15=avgnuccy5_allwells;
% fitc_5=avgnucfitc_allwells;
dapi5=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\Microscopy data\Live-cell imaging\MA64-20160604-preimaging_1665\Raw\analyzedData\8_10_data.mat')
cy5_16=avgnuccy5_allwells;
% fitc_6=avgnucfitc_allwells;
dapi6=intintdapi_allwells;


% load('Y:\IXMicroImages-goodNames\Mansi\MA65-20160729-plainMCF10AIF-53BP1p21_1787\analyzedData_10Xpuncta\5_12_data.mat')
% avgnuccy5_allwells8=avgnuccy5_allwells;
% intintdapi_allwells8=intintdapi_allwells;

cy5_drug=[cy5_9 cy5_10 cy5_11 cy5_12 cy5_13 cy5_14 cy5_15 cy5_16 ];
% fitc_drug = [fitc_5 fitc_6 fitc_7];
intintdapi_allwells_drug=[dapi5 dapi6 dapi7 ];




figure (102)
histogram((log10(cy5_FGM)),  100, 'Facecolor', 'b');
xlim([2.8 4.8])
ylim([0 500])
hold on;
histogram((log10(cy5_drug)), 100,  'Facecolor', 'r');
xlim([2.8 4.8])
ylim([0 500])

% figure(101)
% suptitle 'FITC'
% subplot (2,1,1)
% histogram((log10(fitc1)),  100, 'Facecolor', 'b');
% xlim([3.4 4.8])
% % ylim([0 1000])
% subplot(2,1,2)
% histogram((log10(fitc_5)), 100,  'Facecolor', 'r');
% xlim([3.4 4.8])
% % ylim([0 1000])

% figure(200)
% histogram((log10(avgnuccy5_allwells_FGM)), 'Normalization', 'probability', 'Facecolor', 'b');
% hold on
% histogram((log10(avgnuccy5_allwells_APH)), 'Normalization', 'probability', 'Facecolor', 'r');


%find indices for G0/G1 cells or for S phase cells
% G0G1cellsI=find(intintdapi_allwells <4.6e6);
% ScellsI=find(intintdapi_allwells >4.6e6 & intintdapi_allwells <6.75e6);
% G2McellsI=find(intintdapi_allwells >=6.75e6);


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

% load('Y:\IXMicroImages-goodNames\Mansi\MA65-20160729-plainMCF10AIF-53BP1p21_1787\analyzedData_10Xpuncta\1_11_data.mat')
% cy3_8=avgnuccy3_allwells;
% fitc_8=avgnucfitc_allwells;
% dapi_8=intintdapi_allwells;
% 
% 
% load('Y:\IXMicroImages-goodNames\Mansi\MA65-20160729-plainMCF10AIF-53BP1p21_1787\analyzedData_10Xpuncta\2_11_data.mat')
% cy3_9=avgnuccy3_allwells;
% fitc_9=avgnucfitc_allwells;
% dapi_9=intintdapi_allwells;
% % % 
% load('Y:\IXMicroImages-goodNames\Mansi\MA65-20160729-plainMCF10AIF-53BP1p21_1787\analyzedData_10Xpuncta\3_11_data.mat')
% cy3_10=avgnuccy3_allwells;
% fitc_10=avgnucfitc_allwells;
% dapi_10=intintdapi_allwells;
% 
% cy3=[cy3_8 cy3_9 cy3_10];
% fitc=[fitc_8 fitc_9 fitc_10];

figure (300)
% subplot(2,1,1)
dscatter(log10(fitc)', log10(cy3)')
% axis([1e5 7e6 2.8 4.8])
title('Control')
xlabel('fitc')
ylabel('cy3')

% 
% figure (301)
% dscatter(intintdapi_allwells2', log10(avgnuccy5_allwells2)')
% axis([1e5 7e6 2.8 4.8])
% title('APH')
% xlabel('DNA content')
% ylabel('p21')





