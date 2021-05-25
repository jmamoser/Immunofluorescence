clear all; close all;

% load('f20160309-20pctO2-day0-p21pRb_1432\analyzedData_10Xpuncta\1_7_data.mat')
load('Y:\IXMicroImages-goodNames\Mansi\MA69-singlesiteIF-nonimagedplate_1839\analyzedData\1_2_data.mat')
cy5_1=avgnuccy5_allwells;
% fitc1=avgnucfitc_allwells;
dapi1=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA69-singlesiteIF-nonimagedplate_1839\analyzedData\2_2_data.mat')
cy5_2=avgnuccy5_allwells;
% fitc2=avgnucfitc_allwells;
dapi2=intintdapi_allwells;
% % 
load('Y:\IXMicroImages-goodNames\Mansi\MA69-singlesiteIF-nonimagedplate_1839\analyzedData\3_2_data.mat')
cy5_3=avgnuccy5_allwells;
% fitc3=avgnucfitc_allwells;
dapi3=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA69-singlesiteIF-nonimagedplate_1839\analyzedData\4_2_data.mat')
cy5_4=avgnuccy5_allwells;
% fitc1=avgnucfitc_allwells;
dapi1=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA69-singlesiteIF-nonimagedplate_1839\analyzedData\1_11_data.mat')
cy5_5=avgnuccy5_allwells;
% fitc2=avgnucfitc_allwells;
dapi2=intintdapi_allwells;
% % 
load('Y:\IXMicroImages-goodNames\Mansi\MA69-singlesiteIF-nonimagedplate_1839\analyzedData\2_11_data.mat')
cy5_6=avgnuccy5_allwells;
% fitc3=avgnucfitc_allwells;
dapi3=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA69-singlesiteIF-nonimagedplate_1839\analyzedData\3_11_data.mat')
cy5_7=avgnuccy5_allwells;
% fitc2=avgnucfitc_allwells;
dapi2=intintdapi_allwells;
% % 
load('Y:\IXMicroImages-goodNames\Mansi\MA69-singlesiteIF-nonimagedplate_1839\analyzedData\4_11_data.mat')
cy5_8=avgnuccy5_allwells;
% fitc3=avgnucfitc_allwells;
dapi3=intintdapi_allwells;

% % 
% load('Y:\IXMicroImages-goodNames\Mansi\MA65-20160729-plainMCF10AIF-53BP1p21_1787\analyzedData_10Xpuncta\4_10_data.mat')
% avgnuccy5_allwells4=avgnuccy5_allwells;
% intintdapi_allwells4=intintdapi_allwells;

cy5_FGM=[  cy5_2  cy5_3 cy5_4];
% dapi_FGM=[dapi1 dapi2 dapi3  ];

cy5_drug=[ cy5_5  cy5_7 cy5_8  ];





figure (102)
 histogram((log10(cy5_FGM)),  100, 'Facecolor', 'k');
xlim([2.8 4.8])
ylim([0 200])
hold on;
histogram((log10(cy5_drug)), 100,  'Facecolor', 'r');
xlim([2.8 4.8])
ylim([0 200])











