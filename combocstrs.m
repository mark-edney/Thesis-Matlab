function[Model2,E,nmin,Mmin,Nmin]=combocstrs(theta,ett)
%The enchanced cstr in series model
%max r=12
r=5;
x=theta;
n=(0:1/r:1);
M=(0:1/r:1);
N=(1:.2:r);
[x,n,M,N]=ndgrid(x,n,M,N);
d=(N.*n./M.*x);
Model=(1-n).*dirac(d);

for i=1:1:r
        Model=Model+(N.*n./M.*(gamma(N+1).*exp(-d).*(d.^(i-1)).*((1-n).^(N-i)).*n.^i))./(gamma((N-i>1).*(N-i)).*(gamma(i+1)).*(gamma(i)));
end
inf=isinf(Model);
Model(inf)=0;
nan=isnan(Model);
Model(nan)=0;
E=Modeltest(x,ett,Model);
[minval,minindex]=min(E(:));
[xmin,nmin,Mmin,Nmin]=ind2sub(size(E),minindex);
nmin=1/r*nmin;
Mmin=Mmin/r;
d=(Nmin.*nmin./Mmin.*theta);
Model2=(1-nmin).*dirac(d);

for i=1:1:Nmin
        Model=Model+(Nmin.*nmin./Mmin.*(gamma(Nmin+1).*exp(-d).*(d.^(i-1)).*((1-nmin).^(Nmin-i)).*nmin.^i))./(gamma((Nmin-i>1).*(Nmin-i)).*(gamma(i+1)).*(gamma(i)));
end
inf=isinf(Model2);
Model2(inf)=0;
nan=isnan(Model2);
Model2(nan)=0;
E=Modeltest(x,ett,Model2)
end