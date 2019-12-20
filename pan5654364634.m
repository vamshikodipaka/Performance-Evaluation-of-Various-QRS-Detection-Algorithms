figure(7)
subplot(2,1,1)
max_h = max(x6);
thresh = mean (x6 );
poss_reg =(x6>thresh*max_h)';
 
figure (8)
subplot(2,1,1)
hold on
plot (t(200:600),x1(200:600)/max(x1))
box on
xlabel('second');ylabel('Integrated')
xlim([1 3])
 
subplot(2,1,2)
plot (t(200:600),x6(200:600)/max(x6))
xlabel('second');ylabel('Integrated')
xlim([1 3])
 
left = find(diff([0 poss_reg])==1);
right = find(diff([poss_reg 0])==-1);
 
left=left-(6+16);  % cancle delay because of LP and HP
right=right-(6+16);% cancle delay because of LP and HP
 
for i=1:length(left)
    [R_value(i) R_loc(i)] = max( x1(left(i):right(i)) );
    R_loc(i) = R_loc(i)-1+left(i); % add offset
 
    [Q_value(i) Q_loc(i)] = min( x1(left(i):R_loc(i)) );
    Q_loc(i) = Q_loc(i)-1+left(i); % add offset
 
    [S_value(i) S_loc(i)] = min( x1(left(i):right(i)) );
    S_loc(i) = S_loc(i)-1+left(i); % add offset
 
end
 
% there is no selective wave
Q_loc=Q_loc(find(Q_loc~=0));
R_loc=R_loc(find(R_loc~=0));
S_loc=S_loc(find(S_loc~=0));
 
figure
subplot(2,1,1)
title('ECG Signal with R points');
plot (t,x1/max(x1) , t(R_loc) ,R_value , 'r^', t(S_loc) ,S_value, '*',t(Q_loc) , Q_value, 'o');
legend('ECG','R','S','Q');
subplot(2,1,2)
plot (t,x1/max(x1) , t(R_loc) ,R_value , 'r^', t(S_loc) ,S_value, '*',t(Q_loc) , Q_value, 'o');
xlim([1 3])