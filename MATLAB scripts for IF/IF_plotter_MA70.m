load('Y:\IXMicroImages-goodNames\Mansi\MA70-20160912-wtvsp21null-contactI_1884\analyzedData\2_7_data.mat')
cy5_1=avgnuccy5_allwells;
% fitc1=avgnucfitc_allwells;
dapi1=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA70-20160912-wtvsp21null-contactI_1884\analyzedData\1_12_data.mat')
cy5_2=avgnuccy5_allwells;
% fitc2=avgnucfitc_allwells;
dapi2=intintdapi_allwells;

figure (102)
 histogram((log10(cy5_1)),  100, 'Facecolor', 'k');
xlim([2.8 4.8])
% ylim([0 100])
hold on;
histogram((log10(cy5_2)), 100,  'Facecolor', 'r');
xlim([2.8 4.8])
% ylim([0 100])

figure (103)
subplot(2, 1, 1)
histogram((log10(cy5_1)),  100, 'Facecolor', 'k');
xlim([2.7 4.8])
% ylim([0 100])
subplot (2, 1, 2)
histogram((log10(cy5_2)), 100,  'Facecolor', 'r');
xlim([2.7 4.8])
% ylim([0 100])