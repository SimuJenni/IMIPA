x=-1:0.2:1;
y=-5:5;
[xx,yy]=meshgrid(x,y);
zz=xx.^2-yy.^2;
surf(xx,yy,zz)