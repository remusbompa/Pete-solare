function val=SplineCubicN(x0,x,y)
	n=length(x);
	a=y;
	h=x(2:n)-x(1:n-1);
	c=zeros(1,n);
	c(1)=0;
	c(n)=0;
	diag=2*(h(2:n-1)+h(1:n-2));
	s=h(2:n-2);
	g=3*(a(3:n)-a(2:n-1))./h(2:n-1)-3*(a(2:n-1)-a(1:n-2))./h(1:n-2);
	c(2:n-1)=Thomas(s,diag,s,g);
	d=(c(2:n)-c(1:n-1))./(3*h);
	b=(a(2:n)-a(1:n-1))./h-h.*(2*c(1:n-1)+c(2:n))/3;
	val=x0;
	for i=1:length(x0)
                for k=1:n-1
                        if x0(i)>=x(k) && x0(i)<=x(k+1)
                                val(i)=polyval([d(k) c(k) b(k) a(k)],x0(i)-x(k));
                                break;
                        endif
                endfor
        endfor
endfunction
