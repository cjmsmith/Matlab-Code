% Draw a frame on the edge of a grayscale jpeg image

close all

% Read the original picture (jpeg) and show it:
P= imread('pic.jpg');
imshow(P)
pause

% Add a frame 50 pixels wide on the edge of picture
width= 50;
frameColor= 255;  % white
[nr,nc]= size(P);
for r= 1:nr
    for c= 1:nc
        if r<=width || r>nr-width ||c<=width ||c>nc-width
            P(r,c)= frameColor;
        end
    end
end

imshow(P)
shg