# Point-based Mathematical Morphology

Created by Jesús Balado Frías, Peter van Oosterom, Lucía Díaz-Vilariño and Martijn Meijers.

## Introduction



## Work

The designed method is described in the article ****Mathematical morphology directly applied to point cloud data****.

Before applying the code, reading the paper is highly recommended.

It is available in Open Access at this [link](https://doi.org/10.1016/j.isprsjprs.2020.08.011).


## Application
The code consists of two fundamental functions: erosion and dilation. Both functions require two input point clouds with only geospatial (XYZ) coordinates:
* Point cloud input: composed of an Nx3 matrix, where N is the number of points. It is the objective point cloud of the dilatation or erosion process.
* Point cloud strutcturing element: composed of an Nx3 matrix, where N is the number of points. It is the auxiliary point cloud that acts as a structuring element.

The output is an eroded or dilated point cloud. The eorsion and dilation functions can be combined to generate morphological openings and closings. In the example.m file, there is example code for using both functions.


## Citation
Balado, J., Van Oosterom, P., Díaz-Vilariño, L., & Meijers, M. (2020). Mathematical morphology directly applied to point cloud data. ISPRS Journal of Photogrammetry and Remote Sensing, 168, 208-220.
