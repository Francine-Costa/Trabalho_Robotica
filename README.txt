kr3.init
 
kr3.init é um arquivo implementado no software MATLAB que realiza a modelagem cinemática do manipulador KUKA AGILUS KR3 R540, sendo considerado como efetuador uma garra FESTO HGPLE-14-30-3, 1-DC-VCSC-G96.

Além disto, este arquivo calcula a velocidade angular e linear do efetuador.
 
 
O programa foi elaborado com o auxílio de Robotics Toolbox, biblioteca de código aberto, de autoria de Peter Corke.  
 
 
Além da modelagem de cinemática, o programa conta também com um protótipo do manipulador em 3 dimensões. 
 
 
Parâmetros de Denavit-Hartenberg (DH) 
 
 
Os parâmetros de DH foram utilizados para descrever o manipulador e podem ser observados na tabela seguir: 
 
 
Elo 
Theta_i 
d_i 
a_i 
alpha_i 
1 
theta_1 
-345 
20 
pi/2 
2 
theta_2 
0 
260 
0 
3 
theta_3 - pi/2 
0 
20 
pi/2 
4 
theta_4 - (80*pi/180) 
-260 
0 
-pi/2 
5 
theta_5 
0 
0 
pi/2 
6 
theta_6 + pi 
-75 
0 
-pi 
 
 
 
 
 
 
 
Requisitos 
- Software MATLAB 
- Biblioteca Robotics Toolbox - disponível em <http://petercorke.com/wordpress/toolboxes/robotics-toolbox.> 
 
 
 
Autoras 
Franciele de O. Costa 
Francine de O. Costa 
Marcela R. da Silva