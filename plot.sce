z1 = read( '<File Location>.mat', -1, 2);
V = 4.88e-3*z1( : , 2);
I = 4.88e-3*z1( : , 1);
plot( V,I );
xgrid();
xtitle( "NPN_Ib_equal_5_5uA_steps","Collector_Voltage_V","Collector_Current_mA");
