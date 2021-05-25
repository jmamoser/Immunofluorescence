% load('Y:\IXMicroImages-goodNames\Mansi\MA57 IF for hypoxia\MA57-20160309-20pctO2-day0-p21pRb_1432\analyzedData_10Xpuncta\2_4_data.mat')
% avgnuccy5_allwells1=avgnuccy5_allwells;
% intintdapi_allwells1=intintdapi_allwells;
% load('Y:\IXMicroImages-goodNames\Mansi\MA57 IF for hypoxia\MA57-20160309-20pctO2-day3-p21pRb_1433\analyzedData_10Xpuncta\2_4_data.mat')
% avgnuccy5_allwells2=avgnuccy5_allwells;
% intintdapi_allwells2=intintdapi_allwells;
% load('Y:\IXMicroImages-goodNames\Mansi\MA57 IF for hypoxia\MA57-20160309-20pctO2-day7-p21pRb_1424\analyzedData_10Xpuncta\2_4_data.mat')
% avgnuccy5_allwells3=avgnuccy5_allwells;
% intintdapi_allwells3=intintdapi_allwells;
% load('Y:\IXMicroImages-goodNames\Mansi\MA57 IF for hypoxia\MA57-20160309-20pctO2day10-p21prb_1420\analyzedData_10Xpuncta\2_3_data.mat')
% avgnuccy5_allwells4=avgnuccy5_allwells;
% intintdapi_allwells4=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA59-20160519-hypoxia20pct_1634\analyzedData_10Xpuncta\1_2_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57-20160405-Day0-Hs68-msp21rbpRb_1511\analyzedData\4_9_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day0-Hs68-mspRB-rbp21_1513\analyzedData\6_7_data.mat')
avgnuccy5_allwells1=avgnuccy5_allwells;
avgnuccy3_allwells1=avgnuccy3_allwells;
avgnucfitc_allwells1=avgnucfitc_allwells;
intintdapi_allwells1=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA59-20160519-hypoxia3pct_1635\analyzedData_10Xpuncta\3_2_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day3-Hs68-msp21-rbpRb_1516\analyzedData\4_9_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day3-Hs68-mspRB-rbp21_1514\analyzedData\6_9_data.mat')
avgnuccy5_allwells2=avgnuccy5_allwells;
avgnuccy3_allwells2=avgnuccy3_allwells;
avgnucfitc_allwells2=avgnucfitc_allwells;
intintdapi_allwells2=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA59-20160519-hypoxia3pct_1635\analyzedData_10Xpuncta\4_2_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day7-Hs68-msp21-rbpRb_1517\analyzedData\4_9_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day7-Hs68-mspRb-rbp21_1519\analyzedData\6_9_data.mat')
avgnuccy5_allwells3=avgnuccy5_allwells;
avgnuccy3_allwells3=avgnuccy3_allwells;
avgnucfitc_allwells3=avgnucfitc_allwells;
intintdapi_allwells3=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA59-20160519-hypoxia3pct_1635\analyzedData_10Xpuncta\5_2_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day10-Hs68-msp21-rb-pRB_1522\analyzedData\4_11_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day10-Hs68-mspRb-rbp21_1520\analyzedData\6_9_data.mat')
avgnuccy5_allwells4=avgnuccy5_allwells;
avgnuccy3_allwells4=avgnuccy3_allwells;
avgnucfitc_allwells4=avgnucfitc_allwells;
intintdapi_allwells4=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA59-20160519-hypoxia3pct_1635\analyzedData_10Xpuncta\6_2_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day10-Hs68-msp21-rb-pRB_1522\analyzedData\4_11_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day10-Hs68-mspRb-rbp21_1520\analyzedData\6_9_data.mat')
avgnuccy5_allwells5=avgnuccy5_allwells;
avgnuccy3_allwells5=avgnuccy3_allwells;
avgnucfitc_allwells5=avgnucfitc_allwells;
intintdapi_allwells5=intintdapi_allwells;

%plot all p21 together

% figure (1)
% suptitle 'p21'
% subplot (4, 1, 1)
% hist(log10(avgnucfitc_allwells1),100)
% xlabel('Day 0')
% xlim([3.6 4.8])
% 
% subplot (4, 1, 2)
% hist(log10(avgnucfitc_allwells2),100)
% xlabel('Day 3')
% xlim([3.6 4.8])
% 
% subplot (4, 1, 3)
% hist(log10(avgnucfitc_allwells3),100)
% xlabel('Day 7')
% xlim([3.6 4.8])
% 
% subplot (4, 1, 4)
% hist(log10(avgnucfitc_allwells4),100)
% xlabel('Day 10')
% xlim([3.6 4.8])
% 
figure (2)
suptitle 'p21'

subplot (5, 1, 1)
hist(log10(avgnuccy3_allwells1),100)
xlabel('20% O2')
xlim([2.8 4.8])

subplot (5, 1, 2)
hist(log10(avgnuccy3_allwells2),100)
xlabel('3% O2 - 4weeks')
xlim([2.8 4.8])

subplot (5, 1, 3)
hist(log10(avgnuccy3_allwells3),100)
xlabel('3% O2 - 3weeks')
xlim([2.8 4.8])

subplot (5, 1, 4)
hist(log10(avgnuccy3_allwells4),100)
xlabel('3% O2 - 2weeks')
xlim([2.8 4.8])

subplot (5, 1, 5)
hist(log10(avgnuccy3_allwells5),100)
xlabel('3% O2 - 1week')
xlim([2.8 4.8])


figure (3)
suptitle 'DNA content'
subplot (5, 1, 1)
hist(intintdapi_allwells1,500)
xlabel('20% O2')
xlim([0 1.2e7])

subplot (5, 1, 2)
hist(intintdapi_allwells2,500)
xlabel('3% O2 - 4weeks')
xlim([0 1.2e7])

subplot (5, 1, 3)
hist(intintdapi_allwells3,500)
xlabel('3% O2 - 3weeks')
xlim([0 1.2e7])

subplot (5, 1, 4)
hist(intintdapi_allwells4,5000)
xlabel('3% O2 - 2weeks')
xlim([0 1.2e7])
 
subplot (5, 1, 5)
hist(intintdapi_allwells5,500)
xlabel('3% O2 - 1week')
xlim([0 1.2e7])
 
%  figure (4)
%  dscatter(log10(avgnucfitc_allwells)', log10(avgnuccy5_allwells)')
% %  axis([4 4.8 4 4.8])
% title('p21 vs phospho-Rb')
% xlabel('p21')
% ylabel('phospho-Rb (807/811)')