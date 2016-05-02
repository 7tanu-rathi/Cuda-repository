#include<stdio.h>
#define n 512

__global__ void matinv( int *d1,int *d2)
{
 int row= blockIdx.y * blockDim.y + threadIdx.y;
 int col = blockIdx.x * blockDim.x + threadIdx.x;
   
 d2[col*n+row]=d1[row*n+col];
}

int main()
{
 int *a, *b;
 int *dmat1, *dmat2;
 a=(int*)malloc(n*n*sizeof(int));
 b=(int*)malloc(n*n*sizeof(int));
 float t1,t2,t3;
 int i,j;
 for(i=0;i<n;i++)
 {
  for(j=0;j<n;j++)
  {
   a[i*n+j]=j+1;
  }
 }
 
 t1=clock();
 cudaMalloc((void**)&dmat1,n*n*sizeof(int));
 cudaMalloc((void**)&dmat2,n*n*sizeof(int));
 
 cudaMemcpy(dmat1, a,((n*n)*sizeof(int)),cudaMemcpyHostToDevice);
 dim3 threadsperblock(2,2);
 dim3 blockspergrid(128,128);
 
 matinv<<<blockspergrid,threadsperblock>>>(dmat1,dmat2);

 cudaMemcpy(b, dmat2, ((n*n)*sizeof(int)), cudaMemcpyDeviceToHost);
 t2=clock();
 t3=(t2-t1);

 /*for(i=0;i<n;i++)
 {
  printf("\n");
  for(j=0;j<n;j++)
  {
   printf("\t%d",b[i*n+j]);
  }
 }*/
 printf("\n%f",(t3/1000000));
 cudaFree(dmat1); cudaFree(dmat2);free(a);free(b);
}
