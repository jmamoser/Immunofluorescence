%  list all of your rows and columns and call the IF script

dir='Y:\IXMicroImages-goodNames\Mansi\MA57-20160405-Day10-Hs68-msp21-rb-pRB_1522\';    %folder containing the movies folders 
mkdir([dir,'/analyzedData'])

for row=4
    for col=[9:12 ]
        [intintdapi_allwells, avgnucfitc_allwells, avgnuccy5_allwells, wellName]=IFfunction_MA57(row, col, dir);
        
        save([ dir, '/analyzedData/' wellName, '_data'],'intintdapi_allwells', 'avgnucfitc_allwells', 'avgnuccy5_allwells')
    end
end
