clear all; close all; clc;

rawdir_IF  = '\'; %Where your ND2 files live
datadir_IF = '\'; %Where you want your data to be written 

fileList = dir(fullfile(rawdir_IF,'*.nd2')); %looks in rwadir_IF for all ND2 files
fileList = {fileList.name}; %parses the ND2 files it finds to only contain their name

for iFile = 1:numel(fileList) 
      
    currFile = fullfile(rawdir_IF,fileList{iFile});
    IF_nd2(currFile, rawdir_IF, datadir_IF); 
    
end  








