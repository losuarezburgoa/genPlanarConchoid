## -*- texinfo -*- 
## @deftypefn {} {@var{gcLinPlotStruct} =} circarcgenconchoid (
##     @var{focusColVec}, @var{circStruct}, @var{thetaAngleIntval}, 
##     @var{distFun}, @var{npts})
##
## Creates the generalized planar conchoid (GPC), stored in a data structure, 
## named @var{gcLinPlotStruct}. The GPC is generated with a base curve being a
## circular-arc.
##
## Input(s):
## @var{focusColVec}: A 2 x 1 vector (colum vector) with the coordinates of the
## GPC focus.
## @var{circStruct}: A data structure that defines the circle from which the 
## circulart-arc will be defined. The data structure has the following fields.
##     c: Column vector with the coordiantes of the circle center.
##     r: Radius of the circle.
## @var{thetaAngleIntval}: The interval in radias of the staring and ending 
## angles that defines the circular arc. This is stored in a row vector, where
## the first element is tha staring angle and the second the ending angle. The
## first should be less than the second.
## @var{distFun}: A function of that relates the base-curve arc-length with the
## distance between the focus and one of the two brances, i.e. the internal and
## the external branches. It is also an anonymus function.
## @var{npts} : Number of points the base curve has been divided, an intenger
## number.
##
## Output(s):
## The GPC data structure, @var{gcLinPlotStruct} composed by the 
## following fields.
##     F: Point coordiantes of the GPC focus.
##     curveXY : Coordinates (x,y) of the 'base curve' of the GPC. Is a matrix
##               of 2 x npts, the first row are the x-values and the second row
##               the y-vales.
##     conchInt: Coordinates (x,y) of the interior branch of the GPC. The matrix
##               is the same size and shape as the 'curveXY' coordinates.
##     conchExt: Coordinates (x,y) of the exterior branch of the GPC.
##     raysInt : Rays that connects the base curve with the interior branch GPC.
##     raysEnt : Rays that connects the base curve with the exterior branch GPC.
##     npts    : Number of points the base curve has been divided, an intenger
##               number.
##
## @seealso{linegenconchoid, plotgenconchoid}
## @end deftypefn

## Author: Ludger O. Suarez-Burgoa <losuarezb@unal.edu.co>
## Created: 2022-02-17

function gcCircarcPlotStruct = circarcgenconchoid (focusColVec=zeros(2,1), ...
    circStruct=struct("c", [0; -2], "r", 3), ...
    thetaAngleIntval=[0, 2*pi], distFun=@(l)5, npts=18)

## Location of the focus, guaranting it is a column vector.
F = focusColVec(:);
ffun = distFun;

## Circle function.
circCent = circStruct.c;
circR = circStruct.r;
cfun = @(x) circCent(2) + sqrt(circR^2 - (x - circCent(1)).^2);

## P_i points generated from arc-length from N.
thetaN = thetaAngleIntval(1);
thetaS = thetaAngleIntval(2);

thetaTot = thetaS - thetaN;
lTot = circR * thetaTot;

lrelArray = linspace(0, 1, npts);
%lrelArray = 0:0.01:1;

thetaArray = thetaN + lTot * lrelArray / circR;
pArray = [circCent(1) + circR * cos(thetaArray); ...
    circCent(2) + circR * sin(thetaArray)];

## Arc lengths.
lArray = lTot * lrelArray;

## Q_i and Q'_i points.
# Unit vector conecting F with P.
u = (pArray - F) ./ sqrt(dot(pArray - F, pArray - F));
# Internal branch.
qArray = pArray  - ffun(lArray) .* u;
# External branch.
qAsteArray = pArray  + ffun(lArray) .* u;

## Verification of distances.
dpq = sqrt(dot(qArray - pArray, qArray - pArray));
dpqAste = sqrt(dot(qAsteArray - pArray, qAsteArray - pArray));

## Coordiantes of the rays.
# Internal branch.
xxI = [pArray(1,:); qArray(1,:)];
yyI = [pArray(2,:); qArray(2,:)];
# External branch.
xxE = [pArray(1,:); qAsteArray(1,:)];
yyE = [pArray(2,:); qAsteArray(2,:)];

raysInt = {xxI, yyI};
raysExt = {xxE, yyE};

## Creating the output structure.
gcCircarcPlotStruct = struct( ...
    "F", focusColVec, ...
    "curveXY", pArray, ...
    "conchInt", qArray, ...
    "conchExt", qAsteArray, ...
    "raysInt", raysInt, ...
    "raysExt", raysExt, ...
    "npts", npts);
endfunction
## Copyright (C) 2022 Ludger O. Suarez-Burgoa
## BSD 3 Licence.