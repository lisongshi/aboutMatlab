

tp_group = [];
fp_group = [];
fn_group = [];
tn_group = [];
ttemp = [twoErrors, corFlagError];

for i = 1:3000
    if pointClassF(i) == 1
        tp_temp = [pt1(i,:),twoErrors(i,:)];
        tp_group = [tp_group;tp_temp];
    elseif pointClassF(i) == 2
        fp_temp = [pt1(i,:),twoErrors(i,:)];
        fp_group = [fp_group;fp_temp];
    elseif pointClassF(i) == 3
        fn_temp = [pt1(i,:),twoErrors(i,:)];
        fn_group = [fn_group;fn_temp];
    elseif pointClassF(i) == 4
        tn_temp = [pt1(i,:),twoErrors(i,:)];
        tn_group = [tn_group;tn_temp];
    end
end

figure(1);
%axis([0,1000,-10,10]);
%plot ( tp_group(:,2),tp_group(:,3),'go' );
%plot ( tp_group(:,1),tp_group(:,2),'go' );
stem3(tp_group(:,1),tp_group(:,2),tp_group(:,4),'g-');
hold on
%axis([0,1000,-10,10]);
%plot ( fp_group(:,2),fp_group(:,3),'rx' );
%plot ( fp_group(:,1),fp_group(:,2),'rx' );
stem3(fp_group(:,1),fp_group(:,2),fp_group(:,4),'r:');
hold on
%axis([0,1000,-10,10]);
%plot ( fn_group(:,2),fn_group(:,3),'ro' );
%plot ( fn_group(:,1),fn_group(:,2),'ro' );
stem3(fn_group(:,1),fn_group(:,2),fn_group(:,4),'r-');
hold on 
%axis([0,1000,-10,10]);
%plot ( tn_group(:,2),tn_group(:,3),'gx' );
%plot ( tn_group(:,1),tn_group(:,2),'gx' );
stem3(tn_group(:,1),tn_group(:,2),tn_group(:,4),'g:');