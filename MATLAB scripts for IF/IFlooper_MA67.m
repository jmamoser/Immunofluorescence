%  list all of your rows and columns and call the IF script

dir='Y:\IXMicroImages-goodNames\Mansi\MA67-IF-9sites_1799\';    %folder containing the movies folders 
mkdir([dir,'/analyzedData'])

for row=[1:4]
    for col=[1 3 5 6 8 10]
        [intintdapi_allwells,  avgnuccy5_allwells, wellName]=IFfunction_MA67(row, col, dir);
        
        save([ dir, '/analyzedData/' wellName, '_data'],'intintdapi_allwells',  'avgnuccy5_allwells')
    end
end
