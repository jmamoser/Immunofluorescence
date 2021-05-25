%  list all of your rows and columns and call the IF script

dir='Y:\IXMicroImages-goodNames\Mansi\MA69-singlesiteIF-nonimagedplate_1839\';    %folder containing the movies folders 
mkdir([dir,'/analyzedData'])

for row=[5:8]
    for col=[  5 6 8 9 ]
        [intintdapi_allwells,  avgnuccy5_allwells, wellName]=IFfunction_MA69(row, col, dir);
        
        save([ dir, '/analyzedData/' wellName, '_data'],'intintdapi_allwells',  'avgnuccy5_allwells')
    end
end
