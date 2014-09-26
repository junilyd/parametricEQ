% Exercise 4 (Plots)
% 
% The hyperbolic paraboloid has the equation y^2/b^2-x^2/a^2=z/c (c>0), which we will now use.
% 
% a) Plot the equation in the xz-plane for a=3, b=2 og c=1.
% b) Put lables, title, etc. on the plot.
% c) Create a contour plot of the function.
% d) Create a surface plot of the function for -20<x<20 og -10<y<10.
% e) Try different viewpoints, colormaps og shadings.
% f) Export one of the figures in a suitable format.
%
%
close all;clear all;
svn_path = '/Users/OSX/Documents/UNI/P7/LaTeX/article_template';
domain = [-20:20];
syms x y;
b = 2; a = 3; c = 1;
f(x,y) = (y.^2./b.^2-x.^2./a.^2)*c;

% a) Plot the equation in the xz-plane for a=3, b=2 og c=1.
figure
plot(domain,f(0,domain));
xlabel('y-axis');ylabel('f(0,y)');title('Hyperboloid f(x,y) = (y^2/2^2-x^2/a^2), for x=0');
fig2tikz(gcf,'2d','Graph Plot','Graph Plot',svn_path) 

figure
subplot(211)
plot(domain,f(domain,0));
xlabel('y-axis');ylabel('f(x,0)');
subplot(212)
plot(domain,f(0,domain));
xlabel('x-axis');ylabel('f(0,y)');
fig2tikz(gcf,'2d','Comparison of $ f(x,y) $ when $ x=0 $ and $ y=0 $','Sub Plot',svn_path) 

% c) Create a contour plot of the function.
[x y] = meshgrid(-20:1:20,-20:1:20);
figure
contour(x,y,f(x,y))

% d) Create a surface plot of the function for -20<x<20 og -10<y<10.
figure
[x y] = meshgrid(-20:1:20,-10:0.5:10);
f = (y.^2./b.^2-x.^2./a.^2)*c;
surf(x,y,f)
legend('Surf Plot');
ylabel('y-axis'); xlabel('x-axis'); zlabel('f(x,y)');
fig2tikz(gcf,'3d','$ f(x,y) $ in 3 dimensions.','Surf Plot',svn_path) 

figure
surfc(x,y,f)


