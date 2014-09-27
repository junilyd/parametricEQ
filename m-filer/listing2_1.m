print = 1;
prload nutsbolts;
w=gaussm(z,1);                          
figure(1);                                   % Estimate the mixture of Gaussians
% subplot(121); 
scatterd(z); hold on; 
plotm(w,6,[0.1 0.5 1.0]);                 % 3D-plot
% if print == 1
%     fig2tikz(gcf,'2','probability densities of the measurements3d','pr_pdf_and_contour','/Users/OSX/Documents/UNI/P7/diary');
% end
% subplot(122); 
figure(2); scatterd(z); hold on;
for c=1:4
    w=gaussm(seldat(z,c),1);                % Estimate a Gaussian per class.
    plotm(w,2,[0.1 0.5 1.0]);               % 2D-plot
end
if print == 1
    fig2tikz(gcf,'2','probability densities of the measurements','pr_pdf_and_contour_2d','/Users/OSX/Documents/UNI/P7/diary');
end
cost = [-0.20 0.07  0.07 0.07; ...          % Cost Function
        0.07 -0.15  0.07 0.07; ...
        0.07  0.07 -0.05 0.07; ...
        0.03  0.03  0.03 0.03];
w1 = qdc(z);
w2 = w1*classc*costm([],cost);
figure(3); scatterd(z);plotc(w1); plotc(w2);
if print == 1
    fig2tikz(gcf,'1','Estimating Decision Boundaries with inclusion of function','pr_decision_boundaries','/Users/OSX/Documents/UNI/P7/diary');
end
