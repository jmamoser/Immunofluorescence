%% IF_analysis_Pooled_Wells
% A pipeline that allows you to compare multiple wells and pool them for
% analysis.
% This example assumes you have four replica wells per condition, and that
% these are organized by row. Thus, rows 1-4 of column 1 are technical
% replicates.

clear all; close all; clc
%% 20min parameters
dataset = '\';
savedir = '\';
cell_line = 'WT MCF7';
dot_limits = 5000; %the number of cells to plot per scatter. Used for random sampling.

manual_gate  = [1]; %manually set gate to separate high signal from low signal. Change for your purposes.
DNA_limits   = [ ]; %manually set DNA limits
normpRb_lims = [ ]; %manually set target limits. In this experiment, we're looking at normalized pRb.

%% Now iterate through the data, 20min dataset first

all_rows = [1:8];
all_cols = [1:12];
sites    = [1:9];

hours = ''; %treatment duration
dapi_matrix = cell(length(all_rows),length(all_cols));
FITC_matrix = cell(length(all_rows),length(all_cols));
Cy5_matrix = cell(length(all_rows),length(all_cols));

%% Load the data
% Pools all sites from a given well.
for c = all_cols
    for r = all_rows
        for s = sites
            try
                load([dataset, num2str(r) '_' num2str(c) '_' num2str(s) '_IF.mat'])
                disp('Done')
            catch
                disp([num2str(r) '_' num2str(c) '_' num2str(s) ' not found!'])
            end
            clear dapi fitc cy5
            
            for i = 1:size(cells,2)
                dapi(i) = (cells(i).dapi);
                fitc(i) = (cells(i).fitc_nuc_median);
                cy5(i) = (cells(i).cy5_nuc_median);
            end
            if s ~=1
                dapi_matrix{r,c} = [dapi_matrix{r,c}, dapi];
                FITC_matrix{r,c} = [FITC_matrix{r,c}, fitc];
                Cy5_matrix{r,c} = [Cy5_matrix{r,c}, cy5];
            else
                dapi_matrix{r,c} = dapi;
                FITC_matrix{r,c} = fitc;
                Cy5_matrix{r,c} = cy5;
            end
        end
    end
end

%% Determine the number of dots to have per plot.
% looks at the rows and columns you want, determines the number of
% datapoints per condition. Assumes rows 1-4 and 5-8 are technical
% replicates of one another, and that each column is independent. Adjust
% accordingly!

for r = [1 5]
    for c = all_cols
        conditioncount(r,c) = numel(dapi_matrix{r,c}) + numel(dapi_matrix{r+1,c}) + numel(dapi_matrix{r+2,c}) + numel(dapi_matrix{r+3,c});
    end
end
conditioncount(conditioncount == 0) = NaN;
min_val = round(nanmin(conditioncount(:)),-2); %round to nearest 100
if min_val > dot_limits
    min_val = dot_limits;
end

%% Look at replica wells for outliers, and start plotting
rows = [1 5];
cols = all_cols;
counter = 1;

for r = rows
    for c = cols
        %% Determine condition being plotted depending on row and column
        if c == 1
            if r == 1
                condition = 'DMSO';
            elseif r == 5
                condition = '1uM Palbociclib';
            end
            
        elseif c == 2
            if r == 1
                condition = '9uM RO3306';
            elseif r == 5
                condition = '25nM PF3600';
            end
        elseif c == 3
            if r == 1
                condition = '100nM PF3600';
            elseif r == 5
                condition = '500nM PF3600';
            end
        elseif c == 4
            if r == 1
                condition = '25nM PF3600 and 1uM Palbo';
            elseif r == 5
                condition = '100nM PF3600 and 1uM Palbo';
            end
        elseif c == 5
            if r == 1
                condition = '500nM I';
            elseif r == 5
                condition = '500nM J';
            end
        elseif c == 6
            if r == 1
                condition = '500nM I + 1uM Palbo';
            elseif r == 5
                condition = '500nM J + 1uM Palbo';
            end
        elseif c == 7
            if r == 1
                condition = '3uM CDK1 2 i III';
            elseif r == 5
                condition = '60uM CDK2i III';
            end
        end
        %% Initialize figures for each of your plots
        normpRb_ksdensity = figure; suptitle([cell_line ' ' condition ' DNA vs normalized pRb, time: ' hours])
        normpRbscatter = figure;  suptitle([cell_line ' ' condition ' DNA vs normalized pRb, time: ' hours])
        
        %% Wrangle the data
        DNA_rep1 = dapi_matrix{r,c};
        DNA_rep2 = dapi_matrix{r+1,c};
        DNA_rep3 = dapi_matrix{r+2,c};
        DNA_rep4 = dapi_matrix{r+3,c};
        
        tRb_rep1 = FITC_matrix{r,c};
        tRb_rep2 = FITC_matrix{r+1,c};
        tRb_rep3 = FITC_matrix{r+2,c};
        tRb_rep4 = FITC_matrix{r+3,c};
        
        pRb_rep1 = Cy5_matrix{r,c};
        pRb_rep2 = Cy5_matrix{r+1,c};
        pRb_rep3 = Cy5_matrix{r+2,c};
        pRb_rep4 = Cy5_matrix{r+3,c};
        
        %% KSDensity Plots to identify outliers
        figure(normpRb_ksdensity)
        subplot(3,1,1)
        ksdensity(DNA_rep1); hold on; ksdensity(DNA_rep2); ksdensity(DNA_rep3); ksdensity(DNA_rep4);
        title('DNA')
        legend('Rep1','Rep2','Rep3','Rep4')
        subplot(3,1,2)
        ksdensity(tRb_rep1); hold on; ksdensity(tRb_rep2); ksdensity(tRb_rep3); ksdensity(tRb_rep4);
        title('total Rb')
        subplot(3,1,3)
        ksdensity(pRb_rep1); hold on; ksdensity(pRb_rep2); ksdensity(pRb_rep3); ksdensity(pRb_rep4);
        title('pRb(807 811)')
        legend('Rep1','Rep2','Rep3','Rep4')
        saveas(normpRb_ksdensity, [savedir, cell_line ' ' condition ' quality testing ' hours '.fig']);     saveas(normpRb_ksdensity, [savedir, cell_line ' ' condition ' quality testing ' hours '.pdf'])
        
        %% Pool data and Datasample
        pooled_DNA  = [DNA_rep1 DNA_rep2 DNA_rep3 DNA_rep4];
        pooled_tRb  = [tRb_rep1 tRb_rep2 tRb_rep3 tRb_rep4];
        pooled_pRb  = [pRb_rep1 pRb_rep2 pRb_rep3 pRb_rep4];
        
        if numel(pooled_DNA) > min_val
            [~,indices] = datasample(pooled_DNA,min_val,'Replace',false);
            pooled_DNA  = pooled_DNA(indices);
            pooled_tRb  = pooled_tRb(indices);
            pooled_pRb  = pooled_pRb(indices);
        end
        
        pooled_normalized_pRb = pooled_pRb./pooled_tRb; %Divide pRb by total Rb to normalized it
        
        %% Parse cells into 2N, >2N, or 4N
        % Code taken from Backstop_DNA_normpRb_fracs.m
        % Uses Otsu's method to approximate
        if strcmpi(condition,'DMSO')
            %pause
            dna_sample = pooled_DNA >= DNA_limits(1) & pooled_DNA <= DNA_limits(2);
            bins = 150;
            [c,x] = histcounts(pooled_DNA(dna_sample),bins);
            T = otsuthresh(c);
            yy = round(T*bins);
            DNA_auto_thresh = x(yy);
            S_start = 0.85*DNA_auto_thresh;
            S_end   = 1.15*DNA_auto_thresh;
            
            frac_2N = length(find(pooled_DNA < S_start))./length(pooled_DNA);
            frac_4N = length(find(pooled_DNA > S_end))./length(pooled_DNA);
            frac_3N = length(find(S_end >= pooled_DNA & pooled_DNA >= S_start ))./length(pooled_DNA);
            
            figure, hold on;
            histogram(pooled_DNA(dna_sample),bins);
            line([DNA_auto_thresh DNA_auto_thresh],ylim,'Color','k') %identifies the midpoint between 2N and 4N cells
            line([S_start S_start],ylim,'Color','k') %approximates the start of S
            line([S_end S_end],ylim,'Color','k') %approximates the end of S
            fprintf(['\n' condition ' ' hours ' Approximate Fraction 2N: ' num2str(frac_2N)])
            fprintf(['\n' condition ' ' hours ' Approximate Fraction S phase: ' num2str(frac_3N)])
            fprintf(['\n' condition ' ' hours ' Approximate Fraction 4N: ' num2str(frac_4N)])
            %fprintf(['\n' condition ' ' hours ' Approximat Fraction S phase with high pRb: ' num2str(
            %pause
        else
            frac_2N = length(find(pooled_DNA < S_start))./length(pooled_DNA);
            frac_4N = length(find(pooled_DNA > S_end))./length(pooled_DNA);
            frac_3N = length(find(S_end >= pooled_DNA & pooled_DNA >= S_start ))./length(pooled_DNA);
            fprintf(['\n' condition ' ' hours ' Approximate Fraction 2N: ' num2str(frac_2N)])
            fprintf(['\n' condition ' ' hours ' Approximate Fraction S phase: ' num2str(frac_3N)])
            fprintf(['\n' condition ' ' hours ' Approximate Fraction 4N: ' num2str(frac_4N)])
        end
        %% calc the fraction of S phase cells with high pRb
        S_phase_cells = find(S_end >= pooled_DNA & pooled_DNA >= S_start);
        S_phase_highpRb = find(pooled_normalized_pRb(S_phase_cells) > manual_gate);
        frac_S_high = length(S_phase_highpRb)/length(S_phase_cells);
        fprintf(['\n' condition ' ' hours ' Approximate Fraction S phase with high norm pRb: ' num2str(frac_S_high)])
        
        figure(normpRbscatter)

        dscatter(pooled_DNA',pooled_normalized_pRb')
        xlim([DNA_limits])
        ylim([norm_pRb_limits])
        hold on
        line([S_start S_start],ylim,'Color','r','LineWidth',1)
        line([S_end S_end],ylim,'Color','r', 'LineWidth',1)
        line(xlim,[manual_gate manual_gate],'Color','r','LineWidth',1)
        xlabel('DNA')
        ylabel('normalized pRb')
        title(condition)
        saveas(normpRbscatter, [savedir, cell_line ' ' condition ' DNA vs normpRb ' hours '.fig']);     saveas(normpRbscatter, [savedir, cell_line ' ' condition ' DNA vs normpRb ' hours '.pdf'])
        
    end
end
