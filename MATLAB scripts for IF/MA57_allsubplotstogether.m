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

load('Y:\IXMicroImages-goodNames\Mansi\MA57 IF for hypoxia\MA57-20160309-20pctO2-day0-Gata4_1429\analyzedData\3_2_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57-20160405-Day0-Hs68-msp21rbpRb_1511\analyzedData\4_9_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day0-Hs68-mspRB-rbp21_1513\analyzedData\6_7_data.mat')
avgnuccy5_allwells1=avgnuccy5_allwells;
avgnucfitc_allwells1=avgnucfitc_allwells;
intintdapi_allwells1=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day3-Hs68-msp21-pRPA32_1515\analyzedData\5_9_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day3-Hs68-msp21-rbpRb_1516\analyzedData\4_9_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day3-Hs68-mspRB-rbp21_1514\analyzedData\6_9_data.mat')
avgnuccy5_allwells2=avgnuccy5_allwells;
avgnucfitc_allwells2=avgnucfitc_allwells;
intintdapi_allwells2=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day7-Hs68-msp21-pRPA32_1518\analyzedData\5_9_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day7-Hs68-msp21-rbpRb_1517\analyzedData\4_9_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day7-Hs68-mspRb-rbp21_1519\analyzedData\6_9_data.mat')
avgnuccy5_allwells3=avgnuccy5_allwells;
avgnucfitc_allwells3=avgnucfitc_allwells;
intintdapi_allwells3=intintdapi_allwells;

load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day10-Hs68-msp21-pRPA32_1521\analyzedData\5_11_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day10-Hs68-msp21-rb-pRB_1522\analyzedData\4_11_data.mat')
% load('Y:\IXMicroImages-goodNames\Mansi\MA57restainHs68\MA57-20160405-Day10-Hs68-mspRb-rbp21_1520\analyzedData\6_9_data.mat')
avgnuccy5_allwells4=avgnuccy5_allwells;
avgnucfitc_allwells4=avgnucfitc_allwells;
intintdapi_allwells4=intintdapi_allwells;
%plot all p21 together

figure (1)
suptitle 'p21(ms) in MCF10A cells_ 3pct O2'
subplot (4, 1, 1)
hist(log10(avgnucfitc_allwells1),100)
xlabel('Day 0')
xlim([3.6 4.8])

subplot (4, 1, 2)
hist(log10(avgnucfitc_allwells2),100)
xlabel('Day 3')
xlim([3.6 4.8])

subplot (4, 1, 3)
hist(log10(avgnucfitc_allwells3),100)
xlabel('Day 7')
xlim([3.6 4.8])

subplot (4, 1, 4)
hist(log10(avgnucfitc_allwells4),100)
xlabel('Day 10')
xlim([3.6 4.8])

figure (2)
suptitle 'phospho-RPA32) in MCF10A cells_ 3pct O2'
subplot (4, 1, 1)
hist(log10(avgnuccy5_allwells1),100)
xlabel('Day 0')
xlim([3.0 5])

subplot (4, 1, 2)
hist(log10(avgnuccy5_allwells2),100)
xlabel('Day 3')
xlim([3.0 5])

subplot (4, 1, 3)
hist(log10(avgnuccy5_allwells3),100)
xlabel('Day 7')
xlim([3 5])

subplot (4, 1, 4)
hist(log10(avgnuccy5_allwells4),100)
xlabel('Day 10')
xlim([3 5])

figure (3)
suptitle 'DNA content in MCF10A cells_ 3pct O2'
subplot (4, 1, 1)
hist(intintdapi_allwells1,500)
xlabel('Day 0')
 xlim([0 1.2e7])

subplot (4, 1, 2)
hist(intintdapi_allwells2,10000)
xlabel('Day 3')
 xlim([0 1.2e7])

subplot (4, 1, 3)
hist(intintdapi_allwells3,5000)
xlabel('Day 7')
 xlim([0 1.2e7])

subplot (4, 1, 4)
hist(intintdapi_allwells4,5000)
xlabel('Day 10')
 xlim([0 1.2e7])
 
 figure (4)
 dscatter(log10(avgnucfitc_allwells)', log10(avgnuccy5_allwells)')
%  axis([4 4.8 4 4.8])
title('p21 vs phospho-Rb')
xlabel('p21')
ylabel('phospho-Rb (807/811)')