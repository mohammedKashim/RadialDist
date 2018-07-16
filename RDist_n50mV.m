%clear all
%imfilename='square_lattice.png';
%imfilename='image_-3mV_FFT_white.jpg';
%imfilename='image_-5mV_FFT_white.png';
%imfilename='image_-10mV_FFT_white.png';
%imfilename='image_-50mV_FFT_white.png';
%imfilename='image_-100mV_FFT_white.png';
%A=imread(imfilename);

% A2=importdata('Image_-3mV Fourier Image.asc');
% A2=importdata('Image_-5mV Fourier Image.asc');
% A2=importdata('Image_-10mV Fourier Image.asc');
% A2=importdata('Image_-50mV Fourier Image.asc');
A2=importdata('Image_-50mV Fourier Image_edit_2.asc');
% A2=importdata('Image_-100mV Fourier Image.asc');

figure
imagesc(A2.data);
% % image(A);
% centrep='Press enter after saving cursor info as c';
% centre= input(centrep);
% centrex = c.Position(1);
% centrey = c.Position(2);
% centrex = 1138;
% centrey = 1143;
% centrex = 1078;
% centrey = 1143;
centrex = 1098;
centrey = 1158;
dr=1;
%rvec=0;
rmin=0; rmax=200;
index=0;
counter=0;
%plotgR=[];
theta1=zeros(rmax+1,2);

for r=rmin:rmax
    index=index+1;
    %pixval1=zeros(5000,5000);
    pixval1=0;
    g=0;
    rvec=sqrt(r^2+r^2);
    drvec=sqrt((r+dr)^2+(r+dr)^2);
    rlim=drvec-rvec; 
    for theta=0:pi/200:2*pi 
        counter=counter+1;
        x=round(centrex+rvec*cos(theta));
        y=round(centrey+rvec*sin(theta));
        dx=round(centrex+drvec*cos(theta));
        dy=round(centrey+drvec*sin(theta));
%         disp(x);
%         disp(dx);
        for i=x:dx
           for j=y:dy
               %if i==j
               %pixval=abs(double(A(i,j))-255);
               pixval=A2.data(i,j);
               %pixval1(i,j)=pixval;
               g=g+pixval;
               %disp(pixval);
               %end
           end  
        end 
%         sumpixval=sum(pixval1);
%         g=sum(sumpixval,2);
    end
    %GofR=4*pi*rvec^2*dr*g;
    theta1(index,1)=rvec;
    theta1(index,2)=g;
end
xR=theta1(:,1);
xR1=xR/(70.28*3.16);
yR=theta1(:,2);
figure
hold on
s1=spec1d(xR1,yR,sqrt(yR));
% s1rn=normalise(rebin(s1,0.0001,'average'),1);
% [x1,y1,e1]=extract(s1rn);
plot(xR1,yR,'-k','linewidth',2);
xlim([0 0.9])

linepoint1=ginput(2);
grad=(linepoint1(2,2)-linepoint1(1,2))/(linepoint1(2,1)-linepoint1(1,1));
intercept=linepoint1(1,2)-(grad*linepoint1(1,1));
% pin2= [50 2 10 0 grad intercept 35 35 10 50 70 10];
% [so1,sf1]=fits(cut(s1, [0 120]), 'BWFmulti',pin2, [1 1 1 1 1 1 1 1 1 1 1 1]);

pin2= [10 0.05 0.02 0 grad intercept 35 0.16 0.05 50 0.32 0.1];
[so1,sf1]=fits(cut(s1, [0.01 0.4]), 'BWFmulti',pin2, [1 1 1 1 1 1 1 1 1 1 1 1]);

% pin1= [70 2 10 30 17.5 10 70 35 10 100];
% [so1,sf1]=fits(cut(s1, [0 50]), 'nlorz',pin1, [1 1 1 1 1 1 1 1 1 1]);

% pin1= [100 0.04 0.1 40 0.155 0.1 150 0.32 0.1 100];
% [so1,sf1]=fits(cut(s1, [0.02 0.5]), 'nlorz',pin1, [1 1 1 1 1 1 1 1 1 1]);

intensity50V{1,1}=abs(sf1.pvals(1));
centre50V{1,1}=abs(sf1.pvals(2));
width50V{1,1}=abs(sf1.pvals(3));
intensity50V{2,1}=abs(sf1.pvals(7));
centre50V{2,1}=abs(sf1.pvals(8));
width50V{2,1}=abs(sf1.pvals(9));
intensity50V{3,1}=abs(sf1.pvals(10));
centre50V{3,1}=abs(sf1.pvals(11));
width50V{3,1}=abs(sf1.pvals(12));
bg50V{1,1}=sf1.pvals(6);

intensitye50V{1,1}=abs(sf1.evals(1));
centree50V{1,1}=abs(sf1.evals(2));
widthe50V{1,1}=abs(sf1.evals(3));
intensitye50V{2,1}=abs(sf1.evals(7));
centree50V{2,1}=abs(sf1.evals(8));
widthe50V{2,1}=abs(sf1.evals(9));
intensitye50V{3,1}=abs(sf1.evals(10));
centree50V{3,1}=abs(sf1.evals(11));
widthe50V{3,1}=abs(sf1.evals(12));
bge50V{1,1}=abs(sf1.evals(6));


plot(s1)
plot(so1)

pv1=sf1.pvals;
v=axis;
info1=[sf1.pnames num2str(pv1)];
text(v(1)+.25*(v(2)-v(1)),v(3)+.8*(v(4)-v(3)),info1)
% plot(xR,yR,'b-','MarkerSize',5);
%set(gca,'Ydir','reverse')
hold off

% for r=rmin:rmax
%     g=0;
%     for theta=pi/2:pi/30:pi
%         rvec=sqrt(r^2+r^2);
%         drvec=sqrt((r+dr)^2+(r+dr)^2);
%         x=round(centrex-rvec*cos(theta));
%         y=round(centrey+rvec*sin(theta));
%         dx=round(centrex-drvec*cos(theta));
%         dy=round(centrey+drvec*sin(theta));     
%         rlim=drvec-rvec;
%         
%         for i=x:dx
%            for j=y:dy
%                g=g+A(i,j);
%                counter=counter+1;  
%            end    
%         end
%         
%     end
%     theta2{r+1,1}=double(rvec);
%         theta2{r+1,2}=double(g);
% end
% for r=rmin:rmax
%     g=0;
%     for theta=pi/2:pi/30:2*pi/3
%         rvec=sqrt(r^2+r^2);
%         drvec=sqrt((r+dr)^2+(r+dr)^2);
%         x=round(centrex-rvec*cos(theta));
%         y=round(centrey-rvec*sin(theta));
%         dx=round(centrex-drvec*cos(theta));
%         dy=round(centrey-drvec*sin(theta));        
%         rlim=drvec-rvec;
%         
%         for i=x:dx
%            for j=y:dy
%                g=g+A(i,j);
%                counter=counter+1;
%            end    
%         end
%        
%     end
%      theta3{r+1,1}=double(rvec);
%         theta3{r+1,2}=double(g);
% end
% for r=rmin:rmax
%      g=0;
%     for theta=3*pi/4:pi/30:2*pi
%         rvec=sqrt(r^2+r^2);
%         drvec=sqrt((r+dr)^2+(r+dr)^2);
%         x=round(centrex+rvec*cos(theta));
%         y=round(centrey-rvec*sin(theta));
%         dx=round(centrex+drvec*cos(theta));
%         dy=round(centrey-drvec*sin(theta));
%         rlim=drvec-rvec;
%        
%         for i=x:dx
%            for j=y:dy
%                g=g+A(i,j);
%                counter=counter+1;
%                disp(j);
%            end    
%         end
%         
%     end
%     theta4{r+1,1}=double(rvec);
%         theta4{r+1,2}=double(g);
% end
%tottheta=cell2mat(theta1);%+cell2mat(theta2)+cell2mat(theta3)+cell2mat(theta4);
%tottheta(:,1)=tottheta(:,1)/4;
%tottheta(:,2)=(tottheta(:,2)-(255*4))*(-1);
disp(counter);
%pG=cell2mat(theta);
% xR=tottheta(:,1);
% yR=tottheta(:,2);
% figure
% plot(xR,yR,'b-','MarkerSize',5);