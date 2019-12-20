load projf10.m
m=projf10(:,1);
n=projf10(:,2);
findpeaks(m,n);
xlabel('m');
ylabel('n');
title('peaks');