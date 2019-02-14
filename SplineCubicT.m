function val=SplineCubicT(x0,x,y)
	n=length(x);
        a=y;
        h=x(2:n)-x(1:n-1);
        c=zeros(1,n);
	diag(1)=2*h(1);
        diag(2:n-1)=2*(h(2:n-1)+h(1:n-2));
	diag(n)=2*h(n-1);
        s=h(1:n-1);
	g(1)=3*(a(2)-a(1))/h(1)-(y(2)-y(1))/h(1);
        g(2:n-1)=3*(a(3:n)-a(2:n-1))./h(2:n-1)-3*(a(2:n-1)-a(1:n-2))./h(1:n-2);
	g(n)=3*(y(n)-y(n-1))/h(n-1)-3*(a(n)-a(n-1))/h(n-1);
	c(1:n)=Thomas(s,diag,s,g);
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
	
