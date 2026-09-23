%%clear: 작업공간 변수 모두 삭제, closeall: 그림닫기, clc: 명령창 초기화
clear; close all; clc;

% 꽃 데이터 불러오기
% 1: se - length
% 2: se - width
% % 3: pet - length
% 4: pet - width
load fisheriris;

% 특징 그려보기
figure;
plot(meas(:,1), meas(:,2), 'k. ');
xlabel('sepal length');
ylabel('sepal width');

%% 각 종을 숫자로 표현
%% 1 = setosa, 2 = versi, 3 = virgi
spcs2num = [];
for k=1:1:length(species)
    if strcmp(species(k), 'setosa') == 1
        spcs2num(k,1) = 1;
    elseif strcmp(species(k), 'versicolor') == 1
        spcs2num(k,1) = 2;
    elseif strcmp(species(k), 'virginica') == 1
        spcs2num(k,1) = 3;
    end
end

% 종별로 다른 색으로 그려보기
idx1 = find(spcs2num == 1); %%세토사만 찾기
idx2 = find(spcs2num == 2); %%버시칼라만 찾기
idx3 = find(spcs2num == 3); %%버지니카만 찾기

% 세토사는 빨간점, 버시칼라는 초록으로, 버지니카는 파란X으로
figure;
plot(meas(idx1, 1), meas(idx1, 2), 'r. '); hold on;
plot(meas(idx2, 1), meas(idx2, 2), 'go'); hold on;
plot(meas(idx3, 1), meas(idx3, 2), 'bx'); hold on;
xlabel('Sepal length');
ylabel('Sepal width');

figure;
plot(meas(idx1, 3), meas(idx1, 4), 'r. '); hold on;
plot(meas(idx2, 3), meas(idx2, 4), 'go'); hold on;
plot(meas(idx3, 3), meas(idx3, 4), 'bx'); hold on;
xlabel('Petal length');
ylabel('Petal width');


% % 학습/평가 데이터 분리
% versiclolor viginica만 분리
% 1~50: 세토사, 51~100: 버지칼라 101~150: 버지니카
% 학슴: 71~100: 버지칼라, 121~150: 버지니카
% 평가: 51~70, 101~120
tr_id = [71:1:100 121:1:150];
Training_data = meas(tr_id, :);
Training_label = spcs2num(tr_id,:);

ts_id = [51:1:70 101:1:120];
Test_data = meas(ts_id,:);
Test_label = spcs2num(ts_id,:);