function[Model2,minval,nmin,Mmin,Nmin]=hybrid(theta,ett)
%The enchanced cstr in series model
%max r=13
r=2;
x=theta;
n=(0:1/r:1);
M=(0:1/r:1);
N=(1/10:1/10:4);
[x2,n2,M2,N2]=ndgrid(x,n,M,N);
d=(N2.*n2./M2.*x2);
Model=(1-n2).*dirac(d);

for i=1:1:length(N)
        Model=Model+(N2.*n2./M2.*(gamma(N2+1).*exp(-d).*(d.^(i-1)).*((1-n2).^(N2-i)).*n2.^i))./(gamma((N2-i+1)).*(gamma(i+1)).*(gamma(i)));
end
inf=isinf(Model);
Model(inf)=0;
nan=isnan(Model);
Model(nan)=0;
E=Modeltest(x,ett,Model);
[minval,minindex]=min(E(:));
[~,nmin,Mmin,Nmin]=ind2sub(size(E),minindex);
nmin=n(nmin);
Mmin=M(Mmin);
Nmin=N(Nmin);
d=(Nmin.*nmin./Mmin.*theta);
Model2=(1-nmin).*dirac(d);

for i=1:1:length(Nmin)
        Model2=Model2+(Nmin.*nmin./Mmin.*(gamma(Nmin+1).*exp(-d).*(d.^(i-1)).*((1-nmin).^(Nmin-i)).*nmin.^i))./(gamma((Nmin-i+1)).*(gamma(i+1)).*(gamma(i)));
end
inf=isinf(Model2);
Model2(inf)=0;
nan=isnan(Model2);
Model2(nan)=0;
end