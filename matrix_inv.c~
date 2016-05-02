#include<stdio.h>
#include<math.h> 
 
float determinant(float*,int); 
void cofactor(float*,int); 
void transpose(float*,float*,int);

int main() 
{
 float*a,d;
 int k;
 int i,j; printf("-------------------------------------------------------------\n"); 
 //printf("----------------made by C code champ ------------------------\n"); 
 //printf("-------------------------------------------------------------\n"); 
 //printf("\n C Program to find inverse of Matrix\n\n");
 printf("Enter the order of the Matrix : "); scanf("%d",&k); 
 printf("Enter the elements of %dX%d Matrix : \n",k,k);
 a=(float*)malloc(k*k*sizeof(float)); 
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
 d=determinant(a,k); 
 printf("Determinant of the Matrix = %f",d); 
 if (d==0) {printf("\nInverse of Entered Matrix is not possible\n");} 
 else cofactor(a,k); 
 printf("\n\n**** Thanks for using the program!!! ****"); 
} 

/*For calculating Determinant of the Matrix */ 

float determinant(float*a,int k) 
{ 
 float s=1,det=0,*b;
 b= (float*)malloc(k*k*sizeof(float)); 
 int i,j,m,n,c; 
 if (k==1) 
 { 
  return (*a); 
 } 
 else 
 {
  det=0; 
  for (c=0;c<k;c++) 
  { 
   m=0; n=0; 
   for (i=0;i<k;i++)
   { 
    for (j=0;j<k;j++) 
    { 
     b[i*k+j]=0; 
     if (i != 0 && j != c)
     {
	  b[m*k+n]=a[i*k+j]; 
	  if (n<(k-2)) n++; else { n=0; m++; } 
     }
    }
   } 
   det=det + s * (a[0*k+c] * determinant(b,k-1)); s=-1 * s; 
  }
 } return (det); 
} 

void cofactor(float* num,int f) 
{
	float* b,*fac;
        b = (float*)malloc(f*f*sizeof(float));
        fac = (float*)malloc(f*f*sizeof(float)); 
	int p,q,m,n,i,j;
        for (q=0;q<f;q++) 
	{ 
         for (p=0;p<f;p++) 
	 { 
	  m=0; n=0; 
          for (i=0;i<f;i++)
          { 
           for (j=0;j<f;j++) 
           {
            if (i != q && j != p)
            {
             b[m*f+n]=num[i*f+j]; 
             if (n<(f-2)) n++;
             else
             { n=0; m++; 
             } 
            }
           }
          } 
          fac[q*f+p]=pow(-1,q + p) * determinant(b,f-1);
         }
        }
        transpose(num,fac,f); 
       }

 /*Finding transpose of matrix*/

void transpose(float*num,float *fac,int r)
 { 
  int i,j;
  float*b,*inverse,d;
  b=(float*)malloc(r*r*sizeof(float));
  inverse=(float*)malloc(r*r*sizeof(float));
  for (i=0;i<r;i++) 
  {
   for (j=0;j<r;j++) 
   {
    b[i*r+j]=fac[j*r+i]; 
   }
  }
  d=determinant(num,r); 
  for (i=0;i<r;i++) 
  {
   for (j=0;j<r;j++) 
   { 
    inverse[i*r+j]=(b[i*r+j] / d); 
   }
  }
  printf("\n\n\nThe inverse of matrix is : \n");
  for (i=0;i<r;i++)
  {
   for (j=0;j<r;j++) 
   {
    printf("\t%f",inverse[i*r+j]); 
   }
   printf("\n");
  }
 }

