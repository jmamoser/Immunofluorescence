%  list all of your rows and columns and call the IF script

dir='Y:\IXMicroImages-goodNames\Mansi\MA60-20160414-OPP-sortedp21_1545\';    %folder containing the movies folders 
mkdir([dir,'/analyzedData'])

for row=[3 6]
    for col=[2:5 ]
        [intintdapi_allwells,  avgnuccy5_allwells, wellName]=IFfunction_MA60(row, col, dir);
        
        save([ dir, '/analyzedData/' wellName, '_data'],'intintdapi_allwells',  'avgnuccy5_allwells')
    end
end
