% someLinearGenConchPlotsSCR
addpath("../BINS")
clear all

## General values.
focusColVec = zeros(2,1);
%lineFun = @(x) 3/2 + 1/2 * x;
lineFun = @(x) 1;
npts = 180;

## A: Special case of a GC, the Nicomedes conchoid.
abscissaIntval = 3 * [-1, 1];
distFun = @(l) 2;

# The GC.
gcLinPlotStruct = linegenconchoid (focusColVec, lineFun, abscissaIntval, ...
    distFun, npts);
# Plotting.
figure()
hold on
plotgenconchoid (gcLinPlotStruct, wantRays=false);
hold off
axis equal
set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin');
set(gca, 'tickdir', 'out');
grid on
legend({'focus', 'base curve', 'inner branch', 'outer branch'});
legend('Orientation','horizontal');
legend('Location', 'southoutside');
legend boxoff
%print linConchConstFun.svg


## B: Linear arc.lenght function.
abscissaIntval = 3 * [-1, 1];
distFun = @(l) 1*l;

# The GC.
gcLinPlotStruct = linegenconchoid (focusColVec, lineFun, abscissaIntval, ...
    distFun, npts);
# Plotting.
figure()
hold on
plotgenconchoid (gcLinPlotStruct, wantRays=false);
hold off
axis equal
set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin');
set(gca, 'tickdir', 'out');
grid on
legend({'focus', 'base curve', 'inner branch', 'outer branch'});
legend('Orientation','horizontal');
legend('Location', 'southoutside');
legend boxoff
%print linConchLinFun.svg


## C: Function sin arc.lenght function.
abscissaIntval = 4 * [-1, 1];
distFun = @(l) 2 * sin(l);

# The GC.
gcLinPlotStruct = linegenconchoid (focusColVec, lineFun, abscissaIntval, ...
    distFun, npts);
# Plotting.
figure()
hold on
plotgenconchoid (gcLinPlotStruct, wantRays=false);
hold off
axis equal
set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin');
set(gca, 'tickdir', 'out');
grid on
legend({'focus', 'base curve', 'inner branch', 'outer branch'});
legend('Orientation','horizontal');
legend('Location', 'southoutside');
legend boxoff
%print linConchSinFun.svg


## D: Function log arc.lenght function.
abscissaIntval = 2 * [-1, 1];
distFun = @(l) log(l);

# The GC.
gcLinPlotStruct = linegenconchoid (focusColVec, lineFun, abscissaIntval, ...
    distFun, npts);
# Plotting.
figure()
hold on
plotgenconchoid (gcLinPlotStruct, wantRays=false);
hold off
axis equal
set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin');
set(gca, 'tickdir', 'out');
grid on
legend({'focus', 'base curve', 'inner branch', 'outer branch'});
legend('Orientation','horizontal');
legend('Location', 'southoutside');
legend boxoff
%print linConchLogFun.svg