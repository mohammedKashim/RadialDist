figure
hold on
legendnames=[];

%     y1=lorz(x,[(cell2mat(intensity3V(i,1))-cell2mat(bg3V(i,1)))/(cell2mat(intensity3V(i,1))-cell2mat(bg3V(i,1))) cell2mat(centre3V(i,1)) cell2mat(width3V(i,1)) 0]);
%     y2=BWF(x,[(cell2mat(intensity5V(i,1))-cell2mat(bg5V(i,1)))/(cell2mat(intensity5V(i,1))-cell2mat(bg5V(i,1))) cell2mat(centre5V(i,1)) cell2mat(width5V(i,1))  0 0 i/3 ]);
%     y3=lorz(x,[(cell2mat(intensity10V(i,1))-cell2mat(bg10V(i,1)))/(cell2mat(intensity10V(i,1))-cell2mat(bg10V(i,1))) cell2mat(centre10V(i,1)) cell2mat(width10V(i,1)) 0]);
%     y4=BWF(x,[(cell2mat(intensity50V(i,1))-cell2mat(bg50V(i,1)))/(cell2mat(intensity50V(i,1))-cell2mat(bg50V(i,1))) cell2mat(centre50V(i,1)) cell2mat(width50V(i,1))  0 0 i/3 ]);
%     y5=lorz(x,[(cell2mat(intensity100V(i,1))-cell2mat(bg100V(i,1)))/(cell2mat(intensity100V(i,1))-cell2mat(bg100V(i,1))) cell2mat(centre100V(i,1)) cell2mat(width100V(i,1)) 0]);
    y11=lorz(xR1,[cell2mat(intensity3V(1,1))/cell2mat(intensity3V(3,1)) cell2mat(centre3V(1,1)) cell2mat(width3V(1,1)) 0]);
    y12=lorz(xR1,[cell2mat(intensity3V(2,1))/cell2mat(intensity3V(3,1)) cell2mat(centre3V(2,1)) cell2mat(width3V(2,1)) 0]);
    y13=lorz(xR1,[cell2mat(intensity3V(3,1))/cell2mat(intensity3V(3,1)) cell2mat(centre3V(3,1)) cell2mat(width3V(3,1)) 0]);
    y21=BWF(xR1,[cell2mat(intensity5V(1,1))/cell2mat(intensity5V(3,1)) cell2mat(centre5V(1,1)) cell2mat(width5V(1,1))  0 0 1]);
    y22=BWF(xR1,[cell2mat(intensity5V(2,1))/cell2mat(intensity5V(3,1)) cell2mat(centre5V(2,1)) cell2mat(width5V(2,1))  0 0 1]);
    y23=BWF(xR1,[cell2mat(intensity5V(3,1))/cell2mat(intensity5V(3,1)) cell2mat(centre5V(3,1)) cell2mat(width5V(3,1))  0 0 1]);
    y31=lorz(xR1,[cell2mat(intensity10V(1,1))/cell2mat(intensity10V(3,1)) cell2mat(centre10V(1,1)) cell2mat(width10V(1,1)) 2]);
    y32=lorz(xR1,[cell2mat(intensity10V(2,1))/cell2mat(intensity10V(3,1)) cell2mat(centre10V(2,1)) cell2mat(width10V(2,1)) 2]);
    y33=lorz(xR1,[cell2mat(intensity10V(3,1))/cell2mat(intensity10V(3,1)) cell2mat(centre10V(3,1)) cell2mat(width10V(3,1)) 2]);
    y41=BWF(xR1,[cell2mat(intensity50V(1,1))/cell2mat(intensity50V(3,1)) cell2mat(centre50V(1,1)) cell2mat(width50V(1,1))  0 0 3]);
    y42=BWF(xR1,[cell2mat(intensity50V(2,1))/cell2mat(intensity50V(3,1)) cell2mat(centre50V(2,1)) cell2mat(width50V(2,1))  0 0 3]);
    y43=BWF(xR1,[cell2mat(intensity50V(3,1))/cell2mat(intensity50V(3,1)) cell2mat(centre50V(3,1)) cell2mat(width50V(3,1))  0 0 3]);
    y51=lorz(xR1,[cell2mat(intensity100V(1,1))/cell2mat(intensity100V(3,1)) cell2mat(centre100V(1,1)) cell2mat(width100V(1,1)) 4]);
    y52=lorz(xR1,[cell2mat(intensity100V(2,1))/cell2mat(intensity100V(3,1)) cell2mat(centre100V(2,1)) cell2mat(width100V(2,1)) 4]);
    y53=lorz(xR1,[cell2mat(intensity100V(3,1))/cell2mat(intensity100V(3,1)) cell2mat(centre100V(3,1)) cell2mat(width100V(3,1)) 4]);

    
    CM = winter(3);
% eval(['h' num2str(i) '=plot(x,y1,''color'',CM (i,:));'])
plot(xR1,y11+y12+y13,xR1,y21+y22+y23,xR1,y31+y32+y33,xR1,y41+y42+y43,xR1,y51+y52+y53)

% %legendnames=[legendnames; 'h' num2str(i)]
%    set(gca,'YTickLabel',{' '})
% %xlim([120 280])
% legendInfo3{i} = [num2str(tempnumn{i}) 'C'];

hold off
figure
xV=[3;5;10;50;100]; yV=[cell2mat(intensity3V(1,1))/cell2mat(intensity3V(3,1));cell2mat(intensity5V(1,1))/cell2mat(intensity5V(3,1));cell2mat(intensity10V(1,1))/cell2mat(intensity10V(3,1));cell2mat(intensity50V(1,1))/cell2mat(intensity50V(3,1));cell2mat(intensity100V(1,1))/cell2mat(intensity100V(3,1))];
plot(xV,yV,'.r','MarkerSize',10)