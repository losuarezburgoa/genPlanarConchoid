% defplotGenConchSCR
addpath("../BINS")
clear all

## Line as base curve.
# General values.
focusColVec = zeros(2, 1);
lineFun = @(x) 3/2 + 1/2 * x;
npts = 18;

abscissaIntval = [-3, 0];
distFun = @(l) l + sin(l);

# The GC.
gcLinPlotStruct = linegenconchoid (focusColVec, lineFun, abscissaIntval, ...
    distFun, npts);
# Plotting.
figure()
hold on
plotgenconchoid (gcLinPlotStruct, wantRays=true, 16*ones(1,2));
hold off
axis equal
set(gca, 'tickdir', 'out');
xlabel("x");
ylabel("y");
xlim([-5, 2]);
ylim([-2, 5]);
xticks(-5:1:2);
yticks(-2:1:5);
%print defplotGenConchLin.svg


## Circle as base curve.
# General values.
focusColVec = zeros(2,1);
thetaAngleIntval = [0*pi, 9/8*pi];
npts = 18*10;

circStruct = struct("c", [5; 10], "r", 6);
distFun = @(l) 1./l + l;
# The GC.
gcCircarcPlotStruct = circarcgenconchoid (focusColVec, circStruct, ...
    thetaAngleIntval, distFun, npts);
# Plotting.
figure()
hold on
plotgenconchoid (gcCircarcPlotStruct, wantRays=true, 70*ones(1,2));
%plotgenconchoid (gcCircarcPlotStruct);
plot(circStruct.c(1), circStruct.c(2), 'kx');
hold off
axis equal
set(gca, 'tickdir', 'out');
%print defplotGenConchCircarc.svg