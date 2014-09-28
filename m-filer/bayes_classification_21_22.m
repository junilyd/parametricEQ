clear all; print = 0; clf; 
prload nutsbolts;

% z = setprior(z,[0.21 0.3 0.29 0.2])

%% Estimate the mixture of Gaussians
w=gaussm(z,1);                          
figure(1);                                  
subplot(321); scatterd(z); 
plotm(w,6,'perc'); title('Probabiltity Densities of the Measurements');
subplot(322); scatterd(z);
plotc(w); title('Decision Boundaries');

%% Estimate a Gaussian per class.
for num_class = 1:4
    w=gaussm(seldat(z,num_class),1);                
    subplot(323); scatterd(z); plotm(w,2,[0.1 0.1 0.5 1.0]); hold on;
    subplot(324); scatterd(z); plotc(w);hold on;
end
subplot(323);title('PFDs of the Measurements (one gauss pr class)');
subplot(324);title('Decision Boundaries (one gauss pr class)');


% Cost Function - Bayesian Classification
cost = [-0.20 0.27  0.27 0.07; ...          
        0.27 -0.15  0.27 0.07; ...
        0.27  0.27 -0.05 0.07; ...
        0.03  0.03  0.03 -0.23];
w1 = qdc(z);
w2 = w1*classc*costm([],cost);

subplot(325);scatterd(z);plotc(w1);title('Decision Boundaries, w. qdc()');
subplot(326);scatterd(z); plotc(w2);title('Decision Boundaries, w. qdc() &  cost function');


% if print == 1
%     fig2tikz(gcf,'1','Estimating Decision Boundaries with inclusion of function','pr_decision_boundaries','/Users/OSX/Documents/UNI/P7/diary');
% end
