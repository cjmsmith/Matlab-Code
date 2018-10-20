function v = rComplement(dna)
x=length(dna);
if x==0
    v=[];
else
    v=char(zeros(1,x));
    for k=1:x
        v(x-k+1)=dna(k);
    end
    for i=1:x
        if v(i)=='A'
            v(i)='T';
        elseif v(i)=='T'
            v(i)='A';
        elseif v(i)=='C'
            v(i)='G';
        elseif v(i)=='G'
            v(i)='C';
        else
          disp('Strand is not valid')
        end
    end
end
end

                