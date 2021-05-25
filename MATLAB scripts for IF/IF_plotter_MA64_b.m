clear all; close all;

% load('f20160309-20pctO2-day0-p21pRb_1432\analyzedData_10Xpuncta\1_7_data.mat')
load('Y:\IXMicroImages-goodNames\Mansi\MA64-20160621-p21IF-16sites_1715\analyzedData\1_10_data.mat')
avgnuccy5_allwells1=avgnuccy5_allwells;
intintdapi_allwells1=intintdapi_allwells;


load('Y:\IXMicroImages-goodNames\Mansi\MA64-20160621-p21IF-16sites_1715\analyzedData\2_10_data.mat')
avgnuccy5_allwells2=avgnuccy5_allwells;
intintdapi_allwells2=intintdapi_allwells;
% % 
load('Y:\IXMicroImages-goodNames\Mansi\MA64-20160621-p21IF-16sites_1715\analyzedData\3_10_data.mat')
avgnuccy5_allwells3=avgnuccy5_allwells;
intintdapi_allwells3=intintdapi_allwells;
% % 
load('Y:\IXMicroImages-goodNames\Mansi\MA64-20160621-p21IF-16sites_1715\analyzedData\4_10_data.mat')
avgnuccy5_allwells4=avgnuccy5_allwells;
intintdapi_allwells4=intintdapi_allwells;

avgnuccy5_allwells_APH=[avgnuccy5_allwells1 avgnuccy5_allwells2 avgnuccy5_allwells3 avgnuccy5_allwells4];
intintdapi_allwells_APH=[intintdapi_allwells1 intintdapi_allwells2 intintdapi_allwells3 intintdapi_allwells4];

load('Y:\IXMicroImages-goodNames\Mansi\MA64-20160621-p21IF-16sites_1715\analyzedData\2_12_data.mat')
avgnuccy5_allwells5=avgnuccy5_allwells;
intintdapi_allwells5=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA64-20160621-p21IF-16sites_1715\analyzedData\3_12_data.mat')
avgnuccy5_allwells6=avgnuccy5_allwells;
intintdapi_allwells6=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA64-20160621-p21IF-16sites_1715\analyzedData\4_12_data.mat')
avgnuccy5_allwells7=avgnuccy5_allwells;
intintdapi_allwells7=intintdapi_allwells;
 
load('Y:\IXMicroImages-goodNames\Mansi\MA64-20160621-p21IF-16sites_1715\analyzedData\5_12_data.mat')
avgnuccy5_allwells8=avgnuccy5_allwells;
intintdapi_allwells8=intintdapi_allwells;

avgnuccy5_allwells_FGM=[avgnuccy5_allwells5 avgnuccy5_allwells6 avgnuccy5_allwells7 avgnuccy5_allwells8 ];
intintdapi_allwells_FGM=[intintdapi_allwells5 intintdapi_allwells6 intintdapi_allwells7 intintdapi_allwells8 ];

normalized_FGMcy5 = (avgnuccy5_allwells_FGM)./max(avgnuccy5_allwells_FGM);
normalized_APHcy5 = (avgnuccy5_allwells_APH)./max(avgnuccy5_allwells_APH);

figure(1)
subplot(2,1,1)
hist(intintdapi_allwells6, 1000)
xlim([0 7e6])
title('p21__FGM')

subplot(2,1,2)
hist(intintdapi_allwells1, 1000)
xlim([0 7e6])
title('p21__APH')

figure(100)
histogram((log10(avgnuccy5_allwells_FGM)),  'Facecolor', 'b');
hold on
histogram((log10(avgnuccy5_allwells_APH)),  'Facecolor', 'r');


figure(200)
histogram((log10(avgnuccy5_allwells_FGM)), 'Normalization', 'probability', 'Facecolor', 'b');
hold on
histogram((log10(avgnuccy5_allwells_APH)), 'Normalization', 'probability', 'Facecolor', 'r');


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

% 
% figure (300)
% % subplot(2,1,1)
% dscatter(intintdapi_allwells7', log10(avgnuccy5_allwells7)')
% axis([1e5 7e6 2.8 4.8])
% title('Control')
% xlabel('DNA content')
% ylabel('p21')
% 
% figure (301)
% dscatter(intintdapi_allwells2', log10(avgnuccy5_allwells2)')
% axis([1e5 7e6 2.8 4.8])
% title('APH')
% xlabel('DNA content')
% ylabel('p21')


figure(400)
% subplot(2,1,1)
hist(log10(avgnuccy5_allwells_FGM),100)
xlabel('p21 intensity(log)')
xlim([2.8 4.8])

figure(401)
% subplot(2,1,2)
hist(log10(avgnuccy5_allwells_APH),100)
xlabel('p21 intensity(log)')
xlim([2.8 4.8])



