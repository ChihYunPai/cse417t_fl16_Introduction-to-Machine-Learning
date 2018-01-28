scatter3(Q,N,md1,'b')
hold on 
scatter3(Q,N,md2,'g')
hold on
scatter3(Q,N,md3,'m')
hold on
scatter3(Q,N,md4,'y')
hold on
scatter3(Q,N,md5,'r')
xlabel('Q_f');
ylabel('Number of Training Data');
zlabel('median error measurement');
legend('var=0','var=0.5','var=1','var=1.5','var=2');
%%%
scatter3(Q,N,mm1,'b')
hold on 
scatter3(Q,N,mm2,'g')
hold on
scatter3(Q,N,mm3,'m')
hold on
scatter3(Q,N,mm4,'y')
hold on
scatter3(Q,N,mm5,'r')
xlabel('Q_f');
ylabel('Number of Training Data');
zlabel('mean error measurement');
legend('var=0','var=0.5','var=1','var=1.5','var=2');
%%%
cla
load accidents hwydata                             % load data

long = -hwydata(:,2);                              % longitude data
lat = hwydata(:,3);                                % latitude data
rural = 100 - hwydata(:,17);                       % percent rural data
fatalities = hwydata(:,11);                        % fatalities data

scatter3(N,Qf,var,40,fatalities,'filled')    % draw the scatter plot
ax = gca;
ax.XDir = 'reverse';
view(-31,14)
xlabel('N')
ylabel('Qf')
zlabel('var')