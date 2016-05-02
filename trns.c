#include<stdio.h>
#define n 512

int main()
{
 int *a, *b;
 a= (int*)malloc(n*n*sizeof(int));
 b=(int*)malloc(n*n*sizeof(int));
 int i,j;
 float t1,t2,t3;
 t1=clock();
 for(i=0;i<n;i++)
 {
  for(j=0;j<n;j++)
  {
   a[i*n+j]=j+1;
  } 
 }
 /*printf("\n\nOriginal Matrix");
 for(i=0;i<n;i++)
 {
  printf("\n");
  for(j=0;j<n;j++)
  {
   printf("\t%d",a[i*n+j]);
  } 
 }*/
 //transpose
 for(i=0;i<n;i++)
 {
  for(j=0;j<n;j++)
  {
   b[j*n+i]=a[i*n+j];
  } 
 }
 t2=clock();
 t3=(t2-t1);
 printf("\n%f",(t3/1000000));
 /*printf("\n\nTransposed Matrix");
 for(i=0;i<n;i++)
 {
  printf("\n");
  for(j=0;j<n;j++)
  {
   printf("\t%d",b[i*n+j]);
  } 
 }*/

}
