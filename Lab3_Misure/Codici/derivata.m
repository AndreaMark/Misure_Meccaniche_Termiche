clear all
close all
clc

syms R R_S R_P,

diff((R*R_P - R^2) / (R_P*R_S + R*R_P - R^2), R, 1)


