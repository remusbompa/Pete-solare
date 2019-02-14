function x=Thomas(a,b,c,d)
	n=length(b);
	x=zeros(1,n);
	a=[0 a];
	for j=2:n
		t=a(j)/b(j-1);
		b(j)=b(j)-t*c(j-1);
		d(j)=d(j)-t*d(j-1);
	endfor
	x(n)=d(n)/b(n);
	for i=n-1:-1:1
		x(i)=(d(i)-c(i)*x(i+1))/b(i);
	endfor
endfunction
