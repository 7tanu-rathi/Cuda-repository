#define n 1024
#include<stdio.h>

__global__ void Matmul(int *d1,int *d2, int *d3)
{
  int row = blockIdx.y * blockDim.y + threadIdx.y;
  int col = blockIdx.x * blockDim.x + threadIdx.x;
  int sum=0;
  for(int i=0; i<n; i++)
  {
   sum= sum + (d1[row*n+i]*d2[i*n+col]);
  }
  d3[row*n+col]=sum;
 }
int main()
{
int *a, *b, *c, i,j;
 a= new int[n*n];
 b= new int[n*n];
 c= new int[n*n];
 for(i=0;i<n;i++)
  {
   for(j=0;j<n;j++)
   {
    a[i*n+j]=1;
    b[i*n+j]=2;
   }
  }
 float t1= clock();
 int *dmat1, *dmat2, *dmat3;

  cudaMalloc((void**)&dmat1,(n*n)*sizeof(int));
  cudaMalloc((void**)&dmat2,(n*n)*sizeof(int));
  cudaMalloc((void**)&dmat3,(n*n)*sizeof(int));

  
 dim3 threadsperblock(64,64);
 dim3 blockspergrid(16,16);
 cudaMemcpy(dmat1, a, ((n*n)*sizeof(int)), cudaMemcpyHostToDevice);
 cudaMemcpy(dmat2, b, ((n*n)*sizeof(int)), cudaMemcpyHostToDevice);
 
 Matmul<<<blockspergrid,threadsperblock>>>(dmat1,dmat2,dmat3);

 cudaMemcpy(c, dmat3, ((n*n)*sizeof(int)), cudaMemcpyDeviceToHost);
 float t2 = clock();
 float t3=(t2-t1);
 
 for(i=0;i<1;i++)
  {
   printf("\n");
   for(j=0;j<1;j++)
   {
    printf("%d\n",c[i*n+j]);
   }
  }
  printf("\n%f\n",(t3/1000000));
 cudaFree(dmat1);
 cudaFree(dmat2);
 cudaFree(dmat3);
 free(a);free(b);free(c);
}
