clear all;

%% let's look at dataset first, which you did in the previous hw

load trainingset;
figure
hold on;
symbols = {'bx','ks','ro','m*'};
for ii=1:length(x.lablist)
  classdata = seldat(x,ii);
  alab(ii) = plot(classdata.data(:,1),classdata.data(:,2),symbols{ii});
end
legend(alab,x.lablist{1});
grid on;
xlabel('Feature Dimension 1');
ylabel('Feature Dimension 2');
axis([0 1 0 1]);

%% for each data class, compute and store covariance matrix and mean vector

C = cell(length(x.lablist),1); % I use a cell data type to store each matrix
means = cell(length(x.lablist),1); % I use a cell data type to store each vector
for ii=1:length(x.lablist)
  z = seldat(x,ii);
  C{ii} = cov(z.data);      % compute empirical covariance matrix
  means{ii} = mean(z.data); % compute empirical mean vector
end
totalcov = cov(x.data);     % compute covariance matrix of all data
C{:}  % display results
means{:}
totalcov

%% Minimum distance classifier w/ priors

% estimate priors of training data
load trainingset;
priors = classsizes(x);
priors = priors./sum(priors);

% load test dataset
load testset;
% find total number of observations
numelements = sum(classsizes(y));

% for each observation, see to which class mean it is closest
errors = 0; % start error counter
for ii = 1:numelements
  % for each mean vector
  for jj = 1:length(means)
    % find Euclidean distance between observation and mean
    dist(jj) = -2*log(priors(jj)) + distance(y.data(ii,:),means{jj}, ...
      (1/trace(totalcov)));
  end
  % find mean vector that is closest to observation
  [temp,predclass] = min(dist);
  % if the predicted class does not equal the real class, increment error
  if predclass ~= y.nlab(ii)
    errors = errors + 1;
  end
end

% compute error rate
errors = errors/numelements

%% Minimum Mahalnobis distance w/ priors

% estimate priors of training data
load trainingset;
priors = classsizes(x);
priors = priors./sum(priors);

% load test dataset
load testset;
% find total number of observations
numelements = sum(classsizes(y));

% for each observation, see to which class mean it is closest
errors = 0; % start error counter
for ii = 1:numelements
  % for each mean vector
  for jj = 1:length(means)
    % find Euclidean distance between observation and mean
    dist(jj) = -2*log(priors(jj)) + distance(y.data(ii,:),means{jj}, ...
      inv(totalcov));
  end
  % find mean vector that is closest to observation
  [temp,predclass] = min(dist);
  % if the predicted class does not equal the real class, increment error
  if predclass ~= y.nlab(ii)
    errors = errors + 1;
  end
end

% compute error rate
errors = errors/numelements

%% Full quadratic classifier w/ priors

% estimate priors of training data
load trainingset;
priors = classsizes(x);
priors = priors./sum(priors);

% load test dataset
load testset;
% find total number of observations
numelements = sum(classsizes(y));
% for each observation, see to which class mean it is closest
errors = 0; % start error counter
for ii = 1:numelements
  % for each mean vector
  for jj = 1:length(means)
    % full quadratic classifier
    dist(jj) = -log(det(C{jj})) + 2*log(priors(jj)) - ...
      distance(y.data(ii,:),means{jj},inv(C{jj}));
  end
  % find _maximum_ of the above expression
  [temp,predclass] = max(dist);
  % if the predicted class does not equal the real class, increment error
  if predclass ~= y.nlab(ii)
    errors = errors + 1;
  end
end

% compute error rate
errors = errors/numelements

%% Listing 2.3 from book
clear all;

% define several mean vectors
mus = [0.2 0.3; 0.35 0.75; 0.65 0.55; 0.8 0.25];
% define a covariance matrix
C = [0.018 0.007; 0.007 0.011];
% generate 200 points distributed in four classes above with covariance C
z = gauss(200,mus,C);
% create for this dataset a minimum Mahalanobis distance classifier
w = ldc(z);
figure(1);    % create figure
scatterd(z);  % create scatter plot
hold on;      % hold on so we can plot over
plotm(w);     % plot contours of distributions
figure(2);    % create figure
scatterd(z);  % create scatter plot
hold on;      % hold on so we can plot over
plotc(w);     % plot boundaries of classifier 