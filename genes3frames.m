function n= genes3frames(fname,result) 
% Read a text file (fname) of a dna sequence and find possible genes
% (segements of dna sequence in between start and stop codon). Write genes
% to new file (result). Return number of genes found (n).

fid= fopen(fname,'r');

dna= concatenateLines(fid);     % subfunction
fclose(fid);
[n,W]= findGenes(dna);          % subfunction
write(W,result,n);            % subfunction
end
    

function dna= concatenateLines(fid)
% Store lines of text from file in cell array and concatenate cell array
% rows into 1-d (horizontal) char array to get continuous dna sequence
k=0;
fgetl(fid);       % Do not store first line of non-dna text
C={};
while ~feof(fid)
    k=k+1;
    C{k}=fgetl(fid);
end
% Concatenate cell array rows into 1-d char vector of continuous dna
% sequence
dna=[];
for k2=1:k
    dna=[dna C{k2}];
end
end


function [n, W]=findGenes(dna)
% Find number of genes (n) found for dna sequence (input variable "dna")
% for all 3 reading frames. Store genes sequences in cell array W. 
n=0;   % n is counter for number of genes.
       % Initialize n outside first for-loop, because we want to keep
       % adding to n when we go to the next frame (not reset n to zero
       % after each frame)
W={};
for frame=1:3
    j=frame;                    % Initialize j, counter for non-gene codons
    while j<=length(dna)-8      % Last codon to check for is 3rd to last
        % (8th to last nucleotide). Smallest gene possible is 1 codon long,
        % sandwiched between a start and a stop codon.
        codon=dna(j:j+2);
        if strcmp('ATG',codon)   % Start recording gene, from next codon
            a=true;       % Initialize variable a to enter while-loop
            % a=true means we want to store the codon (it's inside a gene)
            gene=[];      % Initialize gene char array
            while a && j<=length(dna)-5     % last codon that while-loop will 
                % evluate has starting index j=length(dna)-2, because j is
                % incremented by 3 in next line
                j=j+3;
                codon=dna(j:j+2);
                % 3 cases for each codon: stop, start, and part-of-gene.
                % Only store codons of last case.
                if strcmp('TAG',codon) || strcmp('TAA',codon) || ...
                        strcmp('TGA',codon)    % Detected a stop codon
                    a=false;     % Exit while loop, exit first if branch, 
                    % and search for start codon again
                    % Don't want to record empty genes: when a start codon
                    % is immediately followed by a stop codon
                    if length(gene)>0
                        n=n+1;
                        W{n}=gene;        % Store gene in cell array
                    end
                elseif strcmp('ATG',codon) 
                    % If encounter start codon before stop codon, 
                    % erase current gene vector and start storing new gene
                    gene=[];
                    % Staying within while loop
                else                 % codon is part of a gene so store it          
                    gene=[gene codon];
                end
            end
        end
        j=j+3;       % Increment j by 3 to access next codon
    end
end
end


function write(W,fnamew,n)
% W is a cell array of strings.
% Create a .txt file with the name
% specified by the string fname.
% The i-th line in the file is W{i}

fidw= fopen(fnamew, 'w');
if n==0
    fprintf(fidw,'%s\n',[]);   % If not genes are found, write blank file. 
else
    for i= 1:n
        fprintf(fidw, '%s\n', W{i});
    end
end
fclose(fidw);
end
