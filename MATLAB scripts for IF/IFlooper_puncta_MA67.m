%  list all of your rows and columns and call the IF script
clear all; close all; clc;

imagedir='Y:\IXMicroImages-goodNames\Mansi\MA69-singlesiteIF-endofmovie_1836\';    %folder containing the images
mkdir([imagedir,'analyzedData_10Xpuncta'])
savingdir=[imagedir,'analyzedData_10Xpuncta\'];

for row=[1]
    for col=[1]
        %[intintdapi_allwells, avgnucfitc_allwells,  avgnuccy3_allwells, avgnuccy5_allwells, wellName]=IFfunction_puncta(row, col, dir);
%         [intintdapi_allwells,avgnucfitc_allwells,  avgnuccy3_allwells, avgnuccy5_allwells, centroid_allwells, sitelist_allwells, wellName, puncta_allwells, SumPunctaArea_allwells, AvgPunctaIntensity_allwells, SumPunctaMetric_allwells]=IFfunction_puncta(row, col, imagedir, savingdir);
        [intintdapi_allwells,  avgnuccy5_allwells, centroid_allwells, sitelist_allwells, wellName, puncta_allwells, SumPunctaArea_allwells, AvgPunctaIntensity_allwells, SumPunctaMetric_allwells]=IFfunction_puncta_MA62(row, col, imagedir, savingdir);
        %save([ dir, '/analyzedData_SLS/' wellName, '_data'],'intintdapi_allwells','avgnucfitc_allwells',  'avgnuccy3_allwells', 'avgnuccy5_allwells')
        %save([ dir, '/analyzedData_SLS/' wellName, '_data'],'intintdapi_allwells','avgnucfitc_allwells',  'avgnuccy3_allwells', 'avgnuccy5_allwells', 'puncta_allwells')
        save([ savingdir, wellName, '_data'],'intintdapi_allwells',  'avgnuccy5_allwells', 'centroid_allwells', 'sitelist_allwells', 'puncta_allwells',  'SumPunctaArea_allwells', 'AvgPunctaIntensity_allwells', 'SumPunctaMetric_allwells')
    end
end
