function val=valPolNewton(x0,x,y)
	x=x';y=y';
	n=length(x);
	f=y;
	c(1)=f(1);
	for k=2:n
		f(1:n-k+1)=(f(1:n-k+1)-f(2:n-k+2))./(x(1:n-k+1)-x(k:n));
		c(k)=f(1);
	endfor
	val=0;
	for k=1:n
		produs=1;
		for i=1:k-1
			produs.*=x0-x(i);
		endfor
		val+=c(k)*produs;
	endfor
endfunction
