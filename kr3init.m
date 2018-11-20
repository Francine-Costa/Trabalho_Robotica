%Trabalho Introdução à Robótica Industrial - UFSC Campus Blumenau- 2018.2
%Alunas: Franciele de O. Costa, Francine de O. Costa e Marcela R. da Silva
%Inicialização dos parâmetros do KR3 R540
%Cálculo da Cinemática Direta
%Velocidade angular e linear do efetuador

function kr3init2()
format short
global robo;
global angulos_juntas;

%L(n)=Link([THETA     D         A       ALPHA       SIGMA       OFFSET]) -> sigma = 0 p/ junta rev.
L(1) = Link([0      -345        20      pi/2        0               0]);
L(2) = Link([0         0       260         0        0               0]);
L(3) = Link([0         0        20      pi/2        0           -pi/2]);
L(4) = Link([0      -260         0     -pi/2        0      -80*pi/180]);
L(5) = Link([0         0         0      pi/2        0               0]);
L(6) = Link([0       -75         0       -pi        0              pi]);
%L(7) = Link([0     146.9         0        0        0                0]); %dh ferramenta


robo = SerialLink(L);
robo.name = 'KR3 540'
robo.plot([0 0 0 0 0 0]); %plot dos thetas

angulos_juntas = [0 -90 90 80 0 0];
b = [0 0 0 0 0 0]*pi/180; %transformar p/ rad pois o offset está em rad

%A = [0 0 0 0 0 0;];
%Cinemática Direta:

   
% A(i) = [cos(b(i)+L(i).offset)     -sin(b(i)+L(i).offset)*cos(L(i).alpha)      sin(b(i)+L(i).offset)*sin(L(i).alpha)     (L(i).a)*cos(b(i)+L(i).offset);
%             sin(b(i)+L(i).offset)      cos(b(i)+L(i).offset)*cos(L(i).alpha)      -cos(b(i)+L(i).offset)*sin(L(i).alpha)    (L(i).a)*sin(b(i)+L(i).offset);
%                     0                            sin(L(i).alpha)                      cos(L(i).alpha)                                    L(i).d;
%                     0                                   0                                       0                                           1];
     
A1 = [cos(b(1)+L(1).offset)     -sin(b(1)+L(1).offset)*cos(L(1).alpha)      sin(b(1)+L(1).offset)*sin(L(1).alpha)     (L(1).a)*cos(b(1)+L(1).offset);
            sin(b(1)+L(1).offset)      cos(b(1)+L(1).offset)*cos(L(1).alpha)      -cos(b(1)+L(1).offset)*sin(L(1).alpha)    (L(1).a)*sin(b(1)+L(1).offset);
                    0                            sin(L(1).alpha)                      cos(L(1).alpha)                                    L(1).d;
                    0                                   0                                       0                                           1];
                
A2 = [cos(b(2)+L(2).offset)     -sin(b(2)+L(2).offset)*cos(L(2).alpha)      sin(b(2)+L(2).offset)*sin(L(2).alpha)     (L(2).a)*cos(b(2)+L(2).offset);
            sin(b(2)+L(2).offset)      cos(b(2)+L(2).offset)*cos(L(2).alpha)      -cos(b(2)+L(2).offset)*sin(L(2).alpha)    (L(2).a)*sin(b(2)+L(2).offset);
                    0                            sin(L(2).alpha)                      cos(L(2).alpha)                                    L(2).d;
                    0                                   0                                       0                                           1];


A3 = [cos(b(3)+L(3).offset)     -sin(b(3)+L(3).offset)*cos(L(3).alpha)      sin(b(3)+L(3).offset)*sin(L(3).alpha)     (L(3).a)*cos(b(3)+L(3).offset);
            sin(b(3)+L(3).offset)      cos(b(3)+L(3).offset)*cos(L(3).alpha)      -cos(b(3)+L(3).offset)*sin(L(3).alpha)    (L(3).a)*sin(b(3)+L(3).offset);
                    0                            sin(L(3).alpha)                      cos(L(3).alpha)                                    L(3).d;
                    0                                   0                                       0                                           1];



A4 = [cos(b(4)+L(4).offset)     -sin(b(4)+L(4).offset)*cos(L(4).alpha)      sin(b(4)+L(4).offset)*sin(L(4).alpha)     (L(4).a)*cos(b(4)+L(4).offset);
            sin(b(4)+L(4).offset)      cos(b(4)+L(4).offset)*cos(L(4).alpha)      -cos(b(4)+L(4).offset)*sin(L(4).alpha)    (L(4).a)*sin(b(4)+L(4).offset);
                    0                            sin(L(4).alpha)                      cos(L(4).alpha)                                    L(4).d;
                    0                                   0                                       0                                           1];

A5 = [cos(b(5)+L(5).offset)     -sin(b(5)+L(5).offset)*cos(L(5).alpha)      sin(b(5)+L(5).offset)*sin(L(5).alpha)     (L(5).a)*cos(b(5)+L(5).offset);
            sin(b(5)+L(5).offset)      cos(b(5)+L(5).offset)*cos(L(5).alpha)      -cos(b(5)+L(5).offset)*sin(L(5).alpha)    (L(5).a)*sin(b(5)+L(5).offset);
                    0                            sin(L(5).alpha)                      cos(L(5).alpha)                                    L(5).d;
                    0                                   0                                       0                                           1];

A6 = [cos(b(6)+L(6).offset)     -sin(b(6)+L(6).offset)*cos(L(6).alpha)      sin(b(6)+L(6).offset)*sin(L(6).alpha)     (L(6).a)*cos(b(6)+L(6).offset);
            sin(b(6)+L(6).offset)      cos(b(6)+L(6).offset)*cos(L(6).alpha)      -cos(b(6)+L(6).offset)*sin(L(6).alpha)    (L(6).a)*sin(b(6)+L(6).offset);
                    0                            sin(L(6).alpha)                      cos(L(6).alpha)                                    L(6).d;
                    0                                   0                                       0                                           1];

Cinematica_Direta = A1*A2*A3*A4*A5*A6


%------Teste velocidade-------------------------------------------------
%Recebe como argumento a posicao e a velocidade das juntas, e calcula a
%velocidade no efetuador:


%Posicao das juntas deve ser inserida na tabela de DH
%Velocidade das juntas deve ser inserida no vetor abaixo:
velocidade_juntas = [1; 1; 1; 1; 1; 1];

z0 = [0; 0; 1];
p = 1; %junta prismatica

%encontrar z1:
%pegar elementos da matriz de transformaçao A1:
z1 = [A1(9); A1(10); A1(11)];

%encontrar z2:
%pegar elementos da matriz de transformaçao A12 = A1*A2:
A12 = A1*A2;
z2 = [A12(9); A12(10); A12(11)];


%encontrar z3:
%pegar elementos da matriz de transformaçao A123 = A1*A2*A3:
A123 = A1*A2*A3;
z3 = [A123(9); A123(10); A123(11)];

%encontrar z4:
%pegar elementos da matriz de transformaçao A1234 = A1*A2*A3*A4:
A1234 = A1*A2*A3*A4;
z4 = [A1234(9); A1234(10); A1234(11)];

%encontrar z5:
%pegar elementos da matriz de transformaçao A12345 = A1*A2*A3*A4*A5:
A12345 = A1*A2*A3*A4*A5;
z5 = [A12345(9); A12345(10); A12345(11)];

%VELOCIDADE ANGULAR:
%w = [wx; wy; wz];
jacobiano_angular = [p*z0 p*z1 p*z2 p*z3 p*z4 p*z5];

velocidade_angular_efetuador = jacobiano_angular*velocidade_juntas



%VELOCIDADE LINEAR:
A123456 = A1*A2*A3*A4*A5*A6;
On = [A123456(13); A123456(14); A123456(15)];
O0 = [0; 0; 0];
Jv1 = cross(z0,On);

O1 = [A1(13); A1(14); A1(15);];
vet_auxiliar1 = On - O1;
Jv2 = cross(z1, vet_auxiliar1);

O2 = [A12(13); A12(14); A12(15)];
vet_auxiliar2 = On - O2;
Jv3 = cross(z2, vet_auxiliar2);

O3 = [A123(13); A123(14); A123(15)];
vet_auxiliar3 = On - O3;
Jv4 = cross(z3, vet_auxiliar3);

O4 = [A1234(13); A1234(14); A1234(15)];
vet_auxiliar4 = On - O4;
Jv5 = cross(z4, vet_auxiliar4);

O5 = [A12345(13); A12345(14); A12345(15)];
vet_auxiliar5 = On - O5;
Jv6 = cross(z5, vet_auxiliar5);

jacobiano_linear = [Jv1 Jv2 Jv3 Jv4 Jv5 Jv6];

velocidade_linear_efetuador = jacobiano_linear*velocidade_juntas


%produto vetorial no matlab: vet_result = cross( vet1 , vet2 ) 
%-----------------------------------------------------------------------



set(gca, 'ZDir', 'reverse', 'YDir', 'reverse', ...
      'ZLim', [-1000 1], 'YLim', [-1000 1000], 'XLim', [-1000 1000], ...
      'ZLimMode', 'manual', 'YLimMode', 'manual', 'XLimMode', 'manual');
robo.teach





