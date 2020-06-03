# Yocto/PathExtension: Hair Shading Project
- **Ivan Colantoni 1704031, Giulia Cassarà 1856973**

The goal of our project is to integrate the model implemented by [pbrt](https://www.pbrt.org/hair.pdf), suited for hair rendering in production , in the Yocto library. In the following report we proceed to present a brief introduction to the problem, the steps that we take in order to make work the implementation, the results obtained, some comments and evaluations of the performances. 

## Introduction [pbrt](https://www.pbrt.org/hair.pdf)

Hair modeling in graphics is a demanding task. The geometric complexity of fibers and the singular way the light is scattered from this material make realistic hair rendering a computationally hard task. Nevertheless some models implemented on physically-based renderer work reasonably well, but either make the resulting outputs difficult to control for artists, or sometimes are more focused on some *had hoc* solutions that make it impossible to generalize. 
In this model these problems are addressed, and the solution is made effective on the following contributions:
* The implementation of a single-based fiber scattering model that allows for efficient Monte Carlo rendering of path-traced multiple fiber scattering.
* A reparameterization of the absorption coefficient and roughnessparameters that is more intuitive for artists and enables efficientartist workflow, while remaining physically consistent.


## Implementation 
**Integration to Yocto/yocto_trace.cpp
We followed the implementation made by the authors of the paper [pbrt-v3/hair.cpp](https://github.com/mmp/pbrt-v3/blob/master/src/materials/hair.cpp). First of all we needed to include a library: 
'''cpp
#include <numeric>
''' 
    #include <numeric>

then we defined the costant parameters of the model:
    static const int pMax = 3;
    static const float eta = 1.55f;
    static const float beta_m = 0.3f;
    static const float beta_n = 0.3f;
    const float h = 0.0f;
    float sin2kAlpha[3], cos2kAlpha[3];
    float v[pMax + 1];
    static const float SqrtPiOver8 = 0.626657069f;
    