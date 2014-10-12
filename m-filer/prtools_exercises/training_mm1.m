clear all; clf; % z = x + y ?
% prload trainingset; % x
% prload testset;     % y
prload nutsbolts;   % z
[y,x] = gendat(z,[15 17 16 16 ])


subplot(221); scatterd(x); hold on;
subplot(222); scatterd(x); hold on;
subplot(223); scatterd(x); hold on;
subplot(224); scatterd(x); hold on;

w1 = nmsc(x);
w2 = ldc(x)
w3 = qdc(x);

subplot(221); plotc({w1,w2,w3});
subplot(222); plotm(w1,6)
subplot(223); plotm(w2,6)
subplot(224); plotm(w3,6)

fprintf('\nclassification errors are\n');
disp([testc(x*w1), testc(x*w2), testc(x*w3)])

%% -------------- Manually -------------------
%% Extract each class 
class1 = seldat(z,1); data1 = class1.data;
class2 = seldat(z,2); data2 = class2.data;
class3 = seldat(z,3); data3 = class3.data;
class4 = seldat(z,4); data4 = class4.data;

class1_cov= cov(data1) 
class1_mean = mean(data1)
class2_cov= cov(data2) 
class2_mean = mean(data2)
class3_cov= cov(data3) 
class3_mean = mean(data3)
class4_cov= cov(data4) 
class4_mean = mean(data4)
total_cov = cov(z.data)
figure;
plot(data1(:,1),data1(:,2), 'bx',data2(:,1),data2(:,2),'ks',data3(:,1),data3(:,2),'ro',data4(:,1),data4(:,2),'m*');
legend('Class1','Class 2','Class 3','Class 4');hold on;
hold on; plot(class1_mean(1),class1_mean(2),'k*',class2_mean(1),class2_mean(2),'k*',class3_mean(1),class3_mean(2),'k*',class4_mean(1),class4_mean(2),'k*');

data = data1;
N = length(data);
mu = mean(data);
C = cov(data);
z_minus_mu = [data(:,1)-mu(1) data(:,2)-mu(2)]'
% p = 1/sqrt(( 2*pi)^N*det(C)) * exp( ( ( -(z_minus_mu)  )'*inv(C)*( z_minus_mu)  )/2  )





