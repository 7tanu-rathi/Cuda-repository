#include<stdio.h>

#define n 3

__global__ void Matinn(float*d1, int k)

{

}


int main()

{

 float *a,*d1,det;
 
 int i,j;
 
 printf("Enter the elements of %dX%d Matrix : \n",n,n);
 a=(float*)malloc(n*n*sizeof(float)); 
 for (i=0;i<k;i++)
 { 
  for (j=0;j<k;j++) 
  {
   a[i*k+j]=i+j+1; 
  } 
 } 
 
 printf("\noriginal matrix\n");
 for (i=0;i<k;i++)
 { printf("\n");
  for (j=0;j<k;j++) 
  {
   printf("%f\t",a[i*k+j]); 
  } 
 } 
 //allocating device memory
 
cudaMalloc((void**)&d1,(n*n)*sizeof(int));
 
cudaMemcpy(d1, a, ((n*n)*sizeof(int)), cudaMemcpyHostToDevice);

 
}
