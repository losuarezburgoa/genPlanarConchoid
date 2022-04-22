## -*- texinfo -*- 
## @deftypefn {} {@var{gcLinPlotStruct} =} linegenconchoid (@var{focusColVec}, 
##     @var{lineFun}, @var{abscissaIntval}, @var{distFun}, @var{npts}, )
##
## Creates the generalized planar conchoid (GPC), stored in a data structure, 
## named @var{gcLinPlotStruct}. The GPC is generated with a base curve being a
## line-segment.
##
## Input(s):
## @var{focusColVec}: A 2 x 1 vector (colum vector) with the coordinates of the
## GPC focus.
## @var{lineFun}: The linear function expressed as an  anonymous function 
## (lambda function). For example, @(x) 3 + 1/2.*x. It always be a function in 
## terms of 'x', because the next variable @var{abscissaIntval} will define the
## interval of x in this function.
## @var{abscissaIntval}: The interval, expressed as a 1 x 2 vector (row vector)
## at which the x-varaible will vary to evaluate the function expressed in 
## the anonymus function in @var{lineFun}.
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
## @seealso{circarcgenconchoid, plotgenconchoid}
## @end deftypefn

## Author: Ludger O. Suarez-Burgoa <losuarezb@unal.edu.co>
## Created: 2022-02-03

function gcLinPlotStruct = linegenconchoid (focusColVec=zeros(2,1), ...
    lineFun=@(x)1, abscissaIntval=3*[-1,1], distFun=@(l)2, npts=18)

## Location of the focus, guaranting it is a column vector.
F = focusColVec(:);

## Staring and ending points.
xN = abscissaIntval(1);
xS = abscissaIntval(2);
# the curve function.
cfun = lineFun;
ffun = distFun;

# starting point, N
N = [xN; cfun(xN)];
# ending point, S.
S = [xS; cfun(xS)];
    
## P_i points generated from arc-length from N.
lrelArray = linspace(0, 1, npts);
%uL = (S-N) / norm(S-N);
%dNS = sqrt(dot(S-N, S-N));
%pArray = N + lrelArray * dNS .* uL;
pArray = N + lrelArray .* (S-N);

## Arc lengths from point N.
lArray = sqrt(dot(pArray - N, pArray - N));

## Q_i points.
# Unit vector connecting F with P.
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
gcLinPlotStruct = struct( ...
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