openscad -s metric-prusa-lm8uu/bar-clamp.stl source/bar-clamp.scad
openscad -s metric-prusa-lm8uu/belt-clamp_GT2.stl source/belt-clamp_GT2.scad
openscad -s metric-prusa-lm8uu/coupling.stl source/coupling.scad
openscad -s metric-prusa-lm8uu/makerbot-endstop-mount.stl source/makerbot-endstop-mount.scad
openscad -s metric-prusa-lm8uu/frame-vertex-neo-top.stl -D 'basefoot=false;' source/frame-vertex-neo.scad
openscad -s metric-prusa-lm8uu/frame-vertex-neo-foot.stl -D 'basefoot=true;' source/frame-vertex-neo.scad
openscad -s metric-prusa-lm8uu/pulley-GT2-20T.stl -D 'teeth=20;profile=12;motor_shaft=5.2;retainer=1;' source/Pulley_T-MXL-XL-HTD-GT2_N-tooth.scad
openscad -s metric-prusa-lm8uu/gregs-herringbone-small.stl -D 'small=true;' source/Wades_Gears_helix.scad
openscad -s metric-prusa-lm8uu/gregs-herringbone-big.stl -D 'small=false;' source/Wades_Gears_helix.scad
openscad -s metric-prusa-lm8uu/gregs-jhead_mount.stl -D 'hotend_mount=jhead_mount;' source/jonaskuehling_gregs-wade-v3.scad
openscad -s metric-prusa-lm8uu/ybrac-t.stl source/ybrac-t.scad
openscad -s metric-prusa-lm8uu/z-motor-mount-barclamp.stl source/z-motor-mount-barclamp.scad
openscad -s metric-prusa-lm8uu/x-end-idler.stl -D 'linear=true;lme8uu=false' source/x-end-idler.scad
openscad -s metric-prusa-lm8uu/x-end-motor.stl -D 'linear=true;lme8uu=false' source/x-end-motor.scad
openscad -s metric-prusa-lm8uu/x-carriage-doublefan.stl source/llluis-gregs-new-x-carriage-double.scad
openscad -s metric-prusa-lm8uu/y-bushing.stl -D 'linear=true;lme8uu=false' source/y-bushing.scad
openscad -s metric-prusa-lm8uu/lower-z-mount.stl source/parametric_lower_z_mount.scad
openscad -s metric-prusa-lm8uu/z-rod-stab.stl source/jme-z-rod-stab.scad
openscad -s metric-prusa-lm8uu/arduino-mount.stl source/arduino-brackets.scad
openscad -s metric-prusa-lm8uu/power-supply-mount.stl source/power-supply-mount.scad

#TODO: fan duct, power outlet mount, mod for z motor mount middle openning
