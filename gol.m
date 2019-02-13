%size of world (x and y)
nx=input('set world size x: ');
ny=input('set world size y: ');
nstep=input('set number of steps: ');

%create array
a=zeros(nx+2,ny+2);

%set delay between steps (s)
del=input('set delay: ');

%set start position of creatures
row1=1+input('set top boundary: ');
row2=1+input('set bottom boundary: ');
col1=1+input('set left boundary: ');
col2=1+input('set right boundary: ');
a(row1:row2,col1:col2)=[1];
imagesc(a)

%add more blocks of creatures if wanted, (yes add=1, no add=2)
add = menu('add more creatures?','Yes','No');
%while yes is chosen add<2 so more creatures added
while (add <2)
row1=1+input('set top boundary: ');
row2=1+input('set bottom boundary: ');
col1=1+input('set left boundary: ');
col2=1+input('set right boundary: ');
a(row1:row2,col1:col2)=[1];
imagesc(a)
add = menu('add more creatures?','Yes','No');
end

%step through moves
for i = 1:nstep

%count neighbors
mr=1+1; %check row of matrix(+1 because boundary)
mc=1+1; %check column of matrix

%create matrix to hold no. neighbors at each pos
b=zeros(nx,ny);

%loop to check each column
while (mc<nx+2)
%loop to check each row
while (mr<ny+2)
%above
nba=a(mr+1,mc);
%below
nbb=a(mr-1,mc);
%left
nbl=a(mr,mc-1);
%right
nbr=a(mr,mc+1);
%upper left
nbul=a(mr+1, mc-1);
%upper right
nbur=a(mr+1, mc+1);
%bottom left
nbbl=a(mr-1, mc-1);
%bottom right
nbbr=a(mr-1, mc+1);

%sum neighbors
snb=nba+nbb+nbl+nbr+nbul+nbur+nbbl+nbbr;
%add number of nbs to corresponding pos in matrix b
b(mr-1,mc-1)=[snb];
mr=mr+1;
end
mc=mc+1;
%reset mr
mr=2;
end
b;
a;
%loop through b changing matrix a based on corresponding values of b

%set variables to loop through b
mr2=1;
mc2=1;
%loop to check row/columns of b
while (mc2<nx+1)

while (mr2<ny+1)
%take corresponding value from matrix b
bvalue=b(mr2,mc2);
%based on value choose what happens to original matrix a
%switch bvalue
%dies if 1 or 0 neighbors, dies if 4 or more neighbors
%case 0&1&4&5&6&7&8
%alsfdhlehf=1
%survives if 2 or 3 neighbors
%case 2&3
%asldhflehf=2
%end
if bvalue < 2 | bvalue > 3
%change value of a (dies)
a(mr2+1,mc2+1)=0;

else if bvalue == 3;
%change value of a (lives)
a(mr2+1,mc2+1)=1;

end
end

mr2=mr2+1;
end

mc2=mc2+1;

mr2=1;
end
a;
imagesc(a);
pause(del);
end
livingcells=sum(a(:))