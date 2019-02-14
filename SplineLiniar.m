function val=SplineLiniar(x0,x,y)
	n=length(x);
	val=zeros(1,length(x0));
	a=(y(2:n)-y(1:n-1))./(x(2:n)-x(1:n-1));
	b=(x(2:n).*y(1:n-1)-x(1:n-1).*y(2:n))./(x(2:n)-x(1:n-1));
	for i=1:length(x0)
		for k=1:n-1
			if x0(i)>=x(k) && x0(i)<=x(k+1)
				val(i)=a(k)*x0(i)+b(k);
				break;
			endif
		endfor
	endfor
endfunction
