function z = merge(x, y)
% x is a vector of length nx with x(1) <= x(2) <= ... <= x(nx)
% y is a vector of length ny with y(1) <= y(2) <= ... <= y(ny)
% z is an (nx+ny)-vector comprised of all the values in x and
%   y and sorted so that z(1) <= ... <= z(nx+ny)

nx = length(x); ny = length(y); z = zeros(1,nx+ny);
ix = 1;   % The index of the next x-value to select.
iy = 1;   % The index of the next y-value to select.
iz = 1;   % The index of the next z-component to fill.
while ix<=nx && iy<=ny
    %    x and v have not been exhausted...
    if x(ix) <= y(iy)
        z(iz) = x(ix); ix = ix+1; iz = iz+1;
    else
        z(iz) = y(iy); iy = iy+1; iz = iz+1;
    end
end
% If any elements in x remain, then copy them into z...
while ix<=nx
    z(iz) = x(ix); ix = ix+1; iz = iz+1;
end
% If any elements in y remain, then copy them into z...
while iy<=ny
    z(iz) = y(iy); iy = iy+1; iz = iz+1;
end