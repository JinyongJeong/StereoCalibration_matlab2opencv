%Generate left cam parameter yml
left_intrinsic = stereoParams.CameraParameters1.IntrinsicMatrix;
if size(stereoParams.CameraParameters1.RadialDistortion,2) == 2
    left_distortion = [stereoParams.CameraParameters1.RadialDistortion(1:2) stereoParams.CameraParameters1.TangentialDistortion 0.0];
elseif size(stereoParams.CameraParameters1.RadialDistortion,2) == 3
    left_distortion = [stereoParams.CameraParameters1.RadialDistortion(1:2) stereoParams.CameraParameters1.TangentialDistortion stereoParams.CameraParameters1.RadialDistortion(3)];
end
keySet = {'width','height','K','D'};
valueSet = {stereoParams.CameraParameters1.ImageSize(2), stereoParams.CameraParameters1.ImageSize(1),left_intrinsic, left_distortion};
left_parameter = containers.Map(keySet,valueSet);
matlab2opencv(left_parameter,'./../calib_result/cam_left.yml');

%Generate right cam parameter yml
right_intrinsic = stereoParams.CameraParameters2.IntrinsicMatrix;
if size(stereoParams.CameraParameters2.RadialDistortion,2) == 2
    right_distortion = [stereoParams.CameraParameters2.RadialDistortion(1:2) stereoParams.CameraParameters2.TangentialDistortion 0.0];
elseif size(stereoParams.CameraParameters2.RadialDistortion,2) == 3
    right_distortion = [stereoParams.CameraParameters2.RadialDistortion(1:2) stereoParams.CameraParameters2.TangentialDistortion stereoParams.CameraParameters2.RadialDistortion(3)];
end
keySet = {'width','height','K','D'};
valueSet = {stereoParams.CameraParameters2.ImageSize(2), stereoParams.CameraParameters2.ImageSize(1),right_intrinsic, right_distortion};
right_parameter = containers.Map(keySet,valueSet);
matlab2opencv(right_parameter,'./../calib_result/cam_right.yml');

%Generate extrinsic parameter yml
extrinsic_R = stereoParams.RotationOfCamera2;
extrinsic_T = stereoParams.TranslationOfCamera2* 0.001;
keySet = {'R','T'};
valueSet = {extrinsic_R, extrinsic_T};
extrinsic_parameter = containers.Map(keySet,valueSet);
matlab2opencv(extrinsic_parameter,'./../calib_result/extrinsic.yml');

%run opencv to calculate rectification matrix

system('./../build/calculate_rectification');




