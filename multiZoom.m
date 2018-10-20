function newIm = multiZoom(jName)
% Display an image and "zoom in" user-selected rectangular regions.
% jName is the string that names a JPEG image in the current directory.
% newIm is the uint8 array storing the data of the last "zoom detail." If no zoom
% detail has been calculated then newIm is the empty uint8 array, uint8([]).
%
% Detailed specifications:
% After displaying the image named by jName, repeat the following:
% - Accept 2 user mouseclicks on the original image which define a rectangular area.
% - Compute the "zoom detail": perform 2-d interpolation on the selected area of the
% image.
% - Display the zoom detail in a separate figure window.
% If the user mouse clicks indicate a very narrow area (4 pixels or fewer in width
% and/or height), consider that to be a "stop signal" which indicates that the user
% wishes to stop.
close all

Q=imread(jName);
imshow(Q)

% The two mouseclicks define corners of selected area
title('Make two clicks to select a rectangular area');
[xvec,yvec]=ginput(2);
xvec=floor(xvec); yvec=floor(yvec);
    
if abs(xvec(2)-xvec(1))<=4 || abs(yvec(2)-yvec(1))<=4 %If user stops
    newIm=[];
else    
    [nr,nc,np]=size(Q);
    for k=1:2               % Check if a click is outside image
        if yvec(k)>nr       % If it is, assign its x and/or y values  
            yvec(k)=nr;     % to edge of image
        elseif yvec(k)<1
            yvec(k)=1;
        end
        if xvec(k)>nc
            xvec(k)=nc;
        elseif xvec(k)<1
            xvec(k)=1;
        end
    end
    % Extract subarray of selected area
    ri=min(yvec(1),yvec(2));
    rf=max(yvec(1),yvec(2));
    ci=min(xvec(1),xvec(2));
    cf=max(xvec(1),xvec(2));
    P=Q(ri:rf,ci:cf,:);
    % Interpolate with a subfunction
    newIm = vectorizedInterpolate3D(P);
end

figure % start new figure window. Use figure(k) command
imshow(newIm) % newIm is the uint8 array containing the data of the zoom detail
title('Detail of selected area')
pause(2)
figure(1) % bring figure 1 forward, i.e., make it the active figure
end

function newIm = vectorizedInterpolate3D(P)
% newIm is interpolated matrix of P
% Create matrix newIm with zeros. Insert values of P into matrix newIm.
% Take each value of zero and give them the average of the two values 
% either above and below or to the right and left.
% If image is a 3D array (i.e. a colar image), each layer will be 
% interpolated seperately.

[nr,nc,np]=size(P);
i=2*nr-1; j=2*nc-1;     % i and j are row and column dimensions of newIm
newIm=uint8(zeros(i,j,np)); 
% Plug original values into newIm
newIm((2*(1:nr)-1),(2*(1:nc)-1),:)= P;    
% Interpolate non-zero columns using adjacent values above and below
for n=2:2:i
        newIm(n,:,:)=1/2*newIm(n-1,:,:)+1/2*newIm(n+1,:,:);
end
% Interpolate zero columns using adjacent columns (to left and right)
for m=2:2:j
    newIm(:,m,:)=1/2*newIm(:,m-1,:)+1/2*newIm(:,m+1,:);
end

end