/*
 * @Date: 2020-09-11 14:42:51
 * @LastEditTime: 2020-09-21 16:17:03
 * @LastEditors: Li Xiang
 * @Description: learn_cuda
 * @FilePath: /src/learn_cuda/src/hello.cpp
 */

#include <ros/ros.h>
#include <iostream>
#include <math.h>
#include <chrono>

using namespace std;
using namespace std::chrono;

// __global__ functions, or "kernels", execute on the device
__global__ void hello_kernel(void)
{
  printf("Hello, world from the device!\n");
}

int main(void)
{
  // greet from the host
  printf("Hello, world from the host!\n");

  // launch a kernel with a single thread to greet from the device
  hello_kernel<<<1,1>>>();

  // wait for the device to finish so that we see the message
  cudaDeviceSynchronize();

  return 0;
}