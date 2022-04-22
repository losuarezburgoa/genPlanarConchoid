% someCircarcGenConchPlotsSCR
clear all

## General values.
focusColVec = zeros(2,1);
thetaAngleIntval = [0, 2*pi];
npts = 180;


## A1: linear arc-length function.
circStruct = struct("c", [0; -2], "r", 3);
distFun = @(l) 5,

# The GC.
gcCircarcPlotStruct = circarcgenconchoid (focusColVec, circStruct, ...
    thetaAngleIntval, distFun, npts);
# Plotting.
figure()
hold on
plotgenconchoid (gcCircarcPlotStruct);
plot(circStruct.c(1), circStruct.c(2), 'kx');
hold off
axis equal
set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin');
set(gca, 'tickdir', 'out');
grid on
legend({'focus', 'base curve', 'inner branch', 'outer branch'});
legend('Orientation','horizontal');
legend('Location', 'southoutside');
legend boxoff
%print circConchConst1Fun.svg

## A2: linear arc-length function.
%circStruct = struct("c", [0; 7/2], "r", 2);
circStruct = struct("c", [0; 113/100], "r", 80/100);
%distFun = @(l) 3,
distFun = @(l) 136/100,

# The GC.
gcCircarcPlotStruct = circarcgenconchoid (focusColVec, circStruct, ...
    thetaAngleIntval, distFun, npts);
# Plotting.
figure()
hold on
plotgenconchoid (gcCircarcPlotStruct);
plot(circStruct.c(1), circStruct.c(2), 'kx');
hold off
axis equal
set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin');
set(gca, 'tickdir', 'out');
grid on
legend({'focus', 'base curve', 'inner branch', 'outer branch'});
legend('Orientation','horizontal');
legend('Location', 'southoutside');
legend boxoff
%print circConchConst2Fun.svg

## B: Linear arc-length function.
circStruct = struct("c", [0; 7/2], "r", 2);
distFun = @(l) 1*l;

# The GC.
gcCircarcPlotStruct = circarcgenconchoid (focusColVec, circStruct, ...
    thetaAngleIntval, distFun, npts);
# Plotting.
figure()
hold on
plotgenconchoid (gcCircarcPlotStruct);
plot(circStruct.c(1), circStruct.c(2), 'kx');
hold off
axis equal
set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin');
set(gca, 'tickdir', 'out');
grid on
legend({'focus', 'base curve', 'inner branch', 'outer branch'});
legend('Orientation','horizontal');
legend('Location', 'southoutside');
legend boxoff
%print circConchLinFun.svg

## C: Function sin arc.lenght function.
circStruct = struct("c", [0; 7/2], "r", 2);
distFun = @(l) 2 * sin(l);

# The GC.
gcCircarcPlotStruct = circarcgenconchoid (focusColVec, circStruct, ...
    thetaAngleIntval, distFun, npts);
# Plotting.
figure()
hold on
plotgenconchoid (gcCircarcPlotStruct);
plot(circStruct.c(1), circStruct.c(2), 'kx');
hold off
axis equal
set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin');
set(gca, 'tickdir', 'out');
grid on
legend({'focus', 'base curve', 'inner branch', 'outer branch'});
legend('Orientation','horizontal');
legend('Location', 'southoutside');
legend boxoff
%print circConchSinFun.svg

## D: Function log arc.lenght function.
circStruct = struct("c", [0; 7/2], "r", 2);
distFun = @(l) log(l);

# The GC.
gcCircarcPlotStruct = circarcgenconchoid (focusColVec, circStruct, ...
    thetaAngleIntval, distFun, npts);
# Plotting.
figure()
hold on
plotgenconchoid (gcCircarcPlotStruct);
plot(circStruct.c(1), circStruct.c(2), 'kx');
hold off
axis equal
set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin');
set(gca, 'tickdir', 'out');
grid on
legend({'focus', 'base curve', 'inner branch', 'outer branch'});
legend('Orientation','horizontal');
legend('Location', 'southoutside');
legend boxoff
%print circConchLogFun.svg