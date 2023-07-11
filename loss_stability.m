% Loss Probability --- Stability

h=0.01;
Ad=[1 1-exp(-h);0 exp(-h)];
A01=Ad-[h h+exp(-h)-1;0 1-exp(-h)]*[0;1000]*[0.005 0.005];
A0=[A01(1),A01(3),0;A01(2),A01(4),0;-0.005,-0.005,0];
tmp=[h h+exp(-h)-1;0 1-exp(-h)]*[0;1000];
A1=[Ad(1),Ad(3),tmp(1);Ad(2),Ad(4),tmp(2);0,0,1];
unstable = [];
i=1;
for p=0:0.01:1
    setlmis([]);
    P=lmivar(1,[3,1]);
    lmiterm([-1,1,1,P],1,1);%P>0
    lmiterm([2,1,1,P],(1-p)*A0',A0);
    lmiterm([2,1,1,P],p*A1',A1);
    lmiterm([2,1,1,P],-1,1);
    lmis=getlmis;
    [tmin,xfeas]=feasp(lmis);
    if tmin>0
        unstable = [unstable p];
    end
end