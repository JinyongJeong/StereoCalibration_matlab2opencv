## Stereo calibration parameter converter from Matlab to Opencv

This repository converts the parameters used for OpenCV and ROS to the results of performing stereo calibration in matlab.

### Maintainer

- JinyongJeong

### Dependencies

- OpenCV

### Compilation

Compile all the files using the following commands.

```bash
mkdir build && cd build
cmake ..
make
```

### Run

Run the `matlab_calib_2_opencv.m` file with the calibration results from Matlab stored in the `stereoParams`.

The final result is stored in the `calib_result` folder as `left.yaml`, `right.yaml`.


