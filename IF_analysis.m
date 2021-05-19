%% Vanilla IF Analysis for Single Wells
% this script is a jumping off point to help you get your custom analysis
% off the ground. The assumption for this script is that you have 4
% fluoresence channels and only care about the nuclear signal for each.

clear all; close all; clc
datapath = '\';

rows  = []; %the rows you want to analyze i.e. [1:8] or [1 4]
cols  = []; %the columns you want to analyze
sites = []; %the sites you want to analyze

%% Load the data by looping through the plate
dapi_matrix = cell(length(rows),length(cols));
fitc_matrix = cell(length(rows),length(cols));
Cy3_matrix  = cell(length(rows),length(cols));
Cy5_matrix  = cell(length(rows),length(cols));

for c = cols
    for r = rows
        for s = sites
            try
                load([datapath, num2str(r) '_' num2str(c) '_' num2str(s) '_IF.mat'])
            catch
                disp([num2str(r) '_' num2str(c) '_' num2str(s) ' not found!']) %notifies you if a datafile is missing
            end
            clear dapi fitc cy3 cy5
            
            for i = 1:size(cells,2)
                dapi(i) = (cells(i).dapi);
                fitc(i) = (cells(i).fitc_nuc_median);
                cy3(i)  = (cells(i).cy3_nuc_median);
                cy5(i)  = (cells(i).cy5_nuc_median);
            end
            dapi_matrix{r,c,s} = dapi;
            fitc_matrix{r,c,s} = fitc; 
            cy3_matrix{r,c,s}  = cy3;
            cy5_matrix{r,c,s}  = cy5;
        end
    end
end

%% Set the limits for each signal you're analyzing
dnalims  = []; 
fitclims = [];
cy3lims  = [];
cy5lims  = [];
for c = cols
    for r = rows
        %% Samples for how to automate labeling. In this example, assume 
        % there are two cell lines on the plate which received a different 
        % dose of drug. Each column (4-8 here) is probed for a different
        % target. Each row received drug or vehicle for a different length
        % of time.
        
        if r <=4
            cell_line = 'MCF7';
            dose      = '25nM';
        else
            cell_line = 'MCF10A';
            dose      = '100nM';
        end
        switch c
            case 4
                target = 'CDK4';
            case 5
                target = 'CDK6';
            case 6
                target = 'CCND1';
            case 7
                target = 'CCND2';
            case 8
                target = 'CCND3';
        end
        switch r
            case {1, 5}
                time = 'DMSO';
            case {2, 6}
                time = '24hr';
            case {3, 7}
                time = '8hr';
            case {4, 8}
                time = '2hr';
        end
        %% Wrangle the data. 
        % Natural log of each is taken, but this can be removed depending 
        % on your  needs.
        
        dna_1   =  log(dapi_matrix{r,c,1});
        dna_2   =  log(dapi_matrix{r,c,2});
        dna_3   =  log(dapi_matrix{r,c,3});
        dna_4   =  log(dapi_matrix{r,c,4});
        all_dna = [dna_1 dna_2 dna_3 dna_4];
        
        fitc_1   = log(fitc_matrix{r,c,1});
        fitc_2   = log(fitc_matrix{r,c,2});
        fitc_3   = log(fitc_matrix{r,c,3});
        fitc_4   = log(fitc_matrix{r,c,4});
        all_fitc = [fitc_1 fitc_2 fitc_3 fitc_4];
        
        cy3_1   = log(cy3_matrix{r,c,1});
        cy3_2   = log(cy3_matrix{r,c,2});
        cy3_3   = log(cy3_matrix{r,c,3});
        cy3_4   = log(cy3_matrix{r,c,4});
        all_cy3 = [cy3_1 cy3_2 cy3_3 cy3_4];
        
        cy5_1   = log(cy5_matrix{r,c,1});
        cy5_2   = log(cy5_matrix{r,c,2});
        cy5_3   = log(cy5_matrix{r,c,3});
        cy5_4   = log(cy5_matrix{r,c,4});
        all_cy5 = [cy5_1 cy5_2 cy5_3 cy5_4];
       
        fprintf(['\n' cell_line ' ' dose ' ' time])
        fprintf(['\nTotal cells included: ' num2str(length(all_dna))])
        
        figure
        subplot(2,2,1)
        dscatter(all_dna',all_fitc'); 
        xlabel('ln(DNA)')
        ylabel('ln(FITC)')
        xlim(dna_lims)
        ylim(fitc_lims)
        title('DNA vs FITC')
        
        subplot(2,2,2)
        dscatter(all_dna',all_cy3'); 
        xlabel('ln(DNA)')
        ylabel('ln(Cy3)')
        xlim(dna_lims)
        ylim(cy3_lims)
        title('DNA vs Cy3')
        
        subplot(2,2,3)
        dscatter(all_dna',all_cy5'); 
        xlabel('ln(DNA)')
        ylabel('ln(Cy5)')
        xlim(dna_lims)
        ylim(cy5_lims)
        title('DNA vs cy5')
        suptitle([cell_line ' ' target ' ' time])
        
    end
end