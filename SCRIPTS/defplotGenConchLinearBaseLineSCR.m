%defplotGenConchLinearBaseLineSCR
clear all

focusColVec = zeros(2, 1);
lineFun = @(x) 3/2 + 1/2 * x;
npts = 18;

abscissaIntval = [-3, 0];
distFun = @(l) l + sin(l);

i = linspace(0, 1, npts);
oVec = [focusColVec(1); focusColVec(2)];
nVec = [abscissaIntval(1); lineFun(abscissaIntval(1))];
sVec = [abscissaIntval(2); lineFun(abscissaIntval(2))];

pArray = nVec + (sVec - nVec) .* i;
lArray = pArray - nVec;
li = sqrt(lArray(1,:).^2 + lArray(2,:).^2);
di = distFun(li);

poArray = pArray - focusColVec(:);
poAbs = sqrt(poArray(1,:).^2 + poArray(2,:).^2);
uArray = poArray ./ poAbs;

qArray = pArray - di .* uArray;
qAsteArray = pArray + di .* uArray;

# Plotting.
figure()
hold on
plot(focusColVec(1), focusColVec(2), 'kx');
plot(pArray(1,:), pArray(2,:), '-');
plot(qArray(1,:), qArray(2,:), '-');
plot(qAsteArray(1,:), qAsteArray(2,:), '-');
hold off
axis equal
set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin');
set(gca, 'tickdir', 'out');
xlabel("x");
ylabel("y");
xlim([-5, 2]);
ylim([-2, 5]);
xticks(-5:1:2);
yticks(-2:1:5);
grid on
legend({'focus', 'base curve', 'inner branch', 'outer branch'});
legend('Orientation','horizontal');
legend('Location', 'southoutside');
legend boxoff

## Display tables at terminal.
display("Table 1. Points at base-curve, arc-lenghts and distances.");
display(sprintf("i\tpi_x\tpi_y\tli_x\tli_y\tl_i\td_i"));
for k = 1:1:npts
    display(sprintf("%4.3f\t%5.3f\t%5.3f\t%5.3f\t%5.3f\t%5.3f\t%5.3f", ...
        [i(k), pArray(1,k), pArray(2,k), lArray(1,k), lArray(2,k), li(k), di(k)]));
endfor

display("Table 2. Vector (p_i - o) and its unit vector u_o.");
display(sprintf("i\tpo_x\tpo_y\t|po|\tuo_x\tuo_y"));
for k = 1:1:npts
    display(sprintf("%4.3f\t%5.3f\t%5.3f\t%5.3f\t%5.3f\t%5.3f", ...
        [i(k), poArray(1,k), poArray(2,k), poAbs(k), uArray(1,k), uArray(2,k)]));
endfor

display("Table 3. Points for the inner and outer branches.");
display(sprintf("i\tq_x\tq_y\tq''_x\tq''_y"));
for k = 1:1:npts
    display(sprintf("%4.3f\t%5.3f\t%5.3f\t%5.3f\t%5.3f", ...
        [i(k), qArray(1,k), qArray(2,k), qAsteArray(1,k), qAsteArray(2,k)]));
endfor


## Create an HTMl table.

display("<table id='tab_ptsBaseCurveArclengthDists'>");
display("  <caption>Points at base-curve, arc-lenghts and distances.</caption>");
display(sprintf("  <tr><th rowspan='2'>\\(%s\\)</th><th colspan='2'>\\(%s\\)</th><th colspan='2'>\\(%s\\)</th><th rowspan='2'>\\(%s\\)</th><th rowspan='2'>\\(%s\\)</th></tr>", ...
   'i', '\boldsymbol{p}_i', '\boldsymbol{l}_i', '|\boldsymbol{l}_i|', 'd_i'));
display(sprintf("  <tr><th>\\(%s\\)</th><th>\\(%s\\)</th><th>\\(%s\\)</th><th>\\(%s\\)</th></tr>", ...
   'x', 'y', 'x', 'y'));
for k = 1:1:npts
    display(sprintf("  <tr><td>%4.3f</td><td>%5.3f</td><td>%5.3f</td><td>%5.3f</td><td>%5.3f</td><td>%5.3f</td><td>%5.3f</td></tr>", ...
        [i(k), pArray(1,k), pArray(2,k), lArray(1,k), lArray(2,k), li(k), di(k)]));
endfor
display("</table>");

display("<table id='tab_vectsPOandUniVect'>");
display("  <caption>Vector \\((\\boldsymbol{p}_i - \\boldsymbol{o})\\) and its unit vector \\(\\boldsymbol{u}_o\\).</caption>");
display(sprintf("  <tr><th rowspan='2'>\\(%s\\)</th><th colspan='2'>\\(%s\\)</th><th rowspan='2'>\\(%s\\)</th><th colspan='2'>\\(%s\\)</th></tr>", ...
   'i', '(\boldsymbol{p}_i - \boldsymbol{o})', '|\boldsymbol{p}_i - \boldsymbol{o}|', '\boldsymbol{u}_o'));
display(sprintf("  <tr><th>\\(%s\\)</th><th>\\(%s\\)</th><th>\\(%s\\)</th><th>\\(%s\\)</th></tr>", ...
   'x', 'y', 'x', 'y'));
for k = 1:1:npts
    display(sprintf("  <tr><td>%4.3f</td><td>%5.3f</td><td>%5.3f</td><td>%5.3f</td><td>%5.3f</td><td>%5.3f</td></tr>", ...
        [i(k), poArray(1,k), poArray(2,k), poAbs(k), uArray(1,k), uArray(2,k)]));
endfor
display("</table>");

display("<table id='tab_ptsInnerOuterBranches'>");
display("  <caption>Points for the inner and outer branches.</caption>");
display(sprintf("  <tr><th rowspan='2'>\\(%s\\)</th><th colspan='2'>\\(%s\\)</th><th colspan='2'>\\(%s\\)</th></tr>", ...
   'i', '\boldsymbol{q}_i', '\boldsymbol{q}''_i'));
display(sprintf("  <tr><th>\\(%s\\)</th><th>\\(%s\\)</th><th>\\(%s\\)</th><th>\\(%s\\)</th></tr>", ...
   'x', 'y', 'x', 'y'));
for k = 1:1:npts
    display(sprintf("  <tr><td>%4.3f</td><td>%5.3f</td><td>%5.3f</td><td>%5.3f</td><td>%5.3f</td></tr>", ...
        [i(k), qArray(1,k), qArray(2,k), qAsteArray(1,k), qAsteArray(2,k)]));
endfor
display("</table>");