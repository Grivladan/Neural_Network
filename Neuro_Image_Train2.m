names = fileread('Neuro_Train/File_Name_tx1.txt');
str_names = strsplit(names);
a = cell(20);
for i=1:20
    s = strcat('Neuro_Train/',str_names{i},'.bmp');
    a{i} = imread(s);
    a{i} = reshape(a{i}(:,:,1),256,1);
end;
P = im2double(horzcat(a{1},a{2},a{3},a{4},a{5},a{6},a{7},a{8},a{9},a{10},a{11},a{12},a{13},a{14},a{15},a{16},a{17},a{18},a{19},a{20}));
P(1,:) = 0;
T = [1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1];
 
 net = newff(P,T,[16 12],{'logsig','tansig'});

gensim(net);

net.trainFcn = 'traingda';

net.performFcn = 'mse';

net.trainParam.epochs=1500;
net.trainParam.goal=1E-4;
net.trainParam.time=120;
net.divideParam.trainRatio = 1;
net.divideParam.valRatio = .0;
net.divideParam.testRatio = .0;

[net4,tr] = train(net,P,T,[],[],[],[]);

ep1=tr.epoch;
mse1=tr.perf;

save net4