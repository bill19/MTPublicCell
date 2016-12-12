//
//  MTPublicCController.m
//  MTPublicCell
//
//  Created by HaoSun on 16/11/9.
//  Copyright © 2016年 MaiTian. All rights reserved.
//

#import "MTPublicCController.h"

@interface MTPublicCController ()

@end

@implementation MTPublicCController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self forWhileWord];
    [self forDoWhileWord];

}

- (void)forWhileWord{

    int i = 0;
    while (i < 10) {
        i++;
        NSLog(@"forWhileWord-%d\n",i);
    }
}
- (void)forDoWhileWord{

    int i = 0;

    do {
        i++;
        NSLog(@"forDoWhileWord-%d\n",i);
    } while (i<10);
}

/*
天行健，君子以自强不息

常见经典排序算法
1.希尔排序
2.二分插入法
3.直接插入法
4.带哨兵的直接排序法
5.冒泡排序
6.选择排序
7.快速排序
8.堆排序
*/


//一.希尔（Shell）排序法（又称宿小增量排序，是1959年由D.L.Shell提出来的）
/* Shell 排序法 */
void ShellSort(int v[],int n)
{
    int gap,i,j,temp;
    for(gap=n/2;gap>0;gap /= 2) /* 设置排序的步长，步长gap每次减半，直到减到1 */
    {
        for(i=gap;i<n;i++)  /* 定位到每一个元素 */
        {
            for(j=i-gap;(j >= 0) && (v[j] > v[j+gap]);j -= gap ) /* 比较相距gap远的两个元素的大小，根据排序方向决定如何调换 */
            {
                temp=v[j];
                v[j]=v[j+gap];
                v[j+gap]=temp;
            }
        }
    }
}

void ShellSortMy(int v[],int n){

    int gap ,i , j , temp;
    for (gap = n/2; gap>0; gap /= 2) {
        for (i = gap; i < n ; i++) {
            for (j = i - gap; (j >= 0) && (v[j] > v[j+gap]); j -= gap) {
                temp = v[j];
                v[j] = v[j+gap];
                v[j+gap] = temp;
            }
        }
    }
}


//二.二分插入法

/* 二分插入法 */
void HalfInsertSort(int a[], int len)
{
    int i, j,temp;
    int low, high, mid;
    for (i=1; i<len; i++)
    {
        temp = a[i];/* 保存但前元素 */
        low = 0;
        high = i-1;
        while (low <= high) /* 在a[low...high]中折半查找有序插入的位置 */
        {
            mid = (low + high) / 2; /* 找到中间元素 */
            if (a[mid] > temp)  /* 如果中间元素比但前元素大，当前元素要插入到中间元素的左侧 */
            {
                high = mid-1;
            }
            else    /* 如果中间元素比当前元素小，但前元素要插入到中间元素的右侧 */
            {
                low = mid+1;
            }
        }       /* 找到当前元素的位置，在low和high之间 */
        for (j=i-1; j>high; j--)/* 元素后移 */
        {
            a[j+1] = a[j];
        }
        a[high+1] = temp; /* 插入 */
    }
}



//三.直接插入法

/*直接插入法*/

void InsertionSort(int input[],int len)
{
    int i,j,temp;
    for (i = 1; i < len; i++)
    {
        temp = input[i];  /* 操作当前元素，先保存在其它变量中 */
        for (j = i - 1;j>-1&&input[j] > temp ; j--) /* 从当前元素的上一个元素开始查找合适的位置 */
        {
            input[j + 1] = input[j]; /* 一边找一边移动元素 */
            input[j] = temp;
        }
    }
}



//四.带哨兵的直接排序法

/**
 * 带哨兵的直接插入排序,数组的第一个元素不用于存储有效数据
 * 将input[0]作为哨兵，可以避免判定input[j]中，数组是否越界
 * 因为在j--的过程中，当j减小到0时,变成了input[0]与input[0]
 * 自身进行比较，很明显这个时候说明位置i之前的数字都比input[i]小
 * 位置i上的数字不需要移动，直接进入下一轮的插入比较。
 *
 */
void InsertionSortWithPiquet(int input[],int len)
{
    int i,j;
    for (i = 2; i < len; i++)  /* 保证数组input第一元素的存储数据无效，从第二个数据开始与它前面的元素比较 */
    {
        input[0] = input[i];
        for (j = i - 1; input[j] > input[0] ; j--)
        {
            input[j + 1] = input[j];
            input[j] = input[0]; /* input[j]一直都是排序的元素中最大的那一个 */
        }
    }
}



//五.冒泡法

/* 冒泡排序法 */
void Bublesort(int a[],int n)
{
    int i,j,k;
    for(j=0;j<n;j++)   /* 气泡法要排序n次*/
    {
        for(i=0;i<n-j;i++)  /* 值比较大的元素沉下去后，只把剩下的元素中的最大值再沉下去就可以啦 */
        {
            if(a[i]>a[i+1])  /* 把值比较大的元素沉到底 */
            {
                k=a[i];
                a[i]=a[i+1];
                a[i+1]=k;
            }
        }
    }
}



//六.选择排序法
/*算法原理：首先以一个元素为基准，从一个方向开始扫描，
 * 比如从左至右扫描，以A[0]为基准。接下来从A[0]...A[9]
 * 中找出最小的元素，将其与A[0]交换。然后将基准位置右
 * 移一位，重复上面的动作，比如，以A[1]为基准，找出
 * A[1]~A[9]中最小的，将其与A[1]交换。一直进行到基准位
 * 置移到数组最后一个元素时排序结束（此时基准左边所有元素
 * 均递增有序，而基准为最后一个元素，故完成排序）。
 */
void Selectsort(int A[],int n)
{
    int i,j,min,temp;
    for(i=0;i<n;i++)
    {
        min=i;
        for(j=i+1;j<=n;j++)  /* 从j往前的数据都是排好的，所以从j开始往下找剩下的元素中最小的 */
        {
            if(A[min]>A[j])  /* 把剩下元素中最小的那个放到A[i]中 */
            {
                temp=A[i];
                A[i]=A[j];
                A[j]=temp;
            }
        }
    }
}



//七.快速排序
/* 快速排序（quick sort）。在这种方法中，
 * n 个元素被分成三段（组）：左段left，
 * 右段right和中段middle。中段
 * 仅包含一个元素。左段中各元素都小于等
 * 于中段元素，右段中各元素都大于等于中
 * 段元素。因此left和right中的元
 * 素可以独立排序，并且不必对left和
 * right的排序结果进行合并。
 * 使用快速排序方法对a[0:n-1]排序
 * 从a[0:n-1]中选择一个元素作为middle，
 * 该元素为支点把余下的元素分割为两段left
 * 和right，使得left中的元素都小于
 * 等于支点，而right 中的元素都大于等于支点
 * 递归地使用快速排序方法对left 进行排序
 * 递归地使用快速排序方法对right 进行排序
 * 所得结果为left+middle+right
 */

void Quick_sort(int data[],int low,int high)
{
    int mid;
    if(low<high)
    {
        mid=Partition(data,low,high);
        Quick_sort(data,low,mid-1); /* 递归调用 */
        Quick_sort(data,mid+1,high);
    }
}
/* 要注意看清楚下面的数据之间是如何替换的，
 * 首先选一个中间值，就是第一个元素data[low],
 * 然后从该元素的最右侧开始找到比它小的元素，把
 * 该元素复制到它中间值原来的位置(data[low]=data[high])，
 * 然后从该元素的最左侧开始找到比它大的元素，把
 * 该元素复制到上边刚刚找到的那个元素的位置(data[high]=data[low])，
 * 最后将这个刚空出来的位置装入中间值(data[low]=data[0])，
 * 这样一来比mid大的都会跑到mid的右侧，小于mid的会在左侧，
 * 最后一行，返回的low是中间元素的位置，左右分别递归就可以排好序了。
 */
int Partition(int data[],int low,int high)
{
    int mid;
    data[0]=data[low];
    mid=data[low];
    while(low < high)
    {
        while((low < high) && (data[high] >= mid))
        {
            --high;
        }
        data[low]=data[high]; /* 从high的位置开始往low的方向找，找到比data[low]小的元素，存到data[low]中 */

        while((low < high) && (data[low] < mid)) /* 新得到的data[low]肯定小于原来的data[low]即mid */
        {
            ++low;
        }
        data[high]=data[low];  /* 从low的位置开始往high的方向找，找到比data[high]大的元素，存在data[high]中 */
    }
    data[low]=data[0];    /* 把low的新位置存上原来的data[low]的数据 */
    return low;     /* 递归时，把它做为右侧元素的low */
}




//八.堆排序

/**************************************************************
 * 堆的定义 n 个元素的序列 {k1,k2,...,kn}当且仅当满足下列关系时，
 * 称为堆:
 * ki<=k2i     ki<=k2i+1     (i=1,2,...,n/2)
 * 或
 * ki>=k2i     ki>=k2i+1     (i=1,2,...,n/2)
 * 堆排序思路：
 * 建立在树形选择排序基础上；
 * 将待排序列建成堆（初始堆生成）后，序列的第一个元素（堆顶元素）就一定是序列中的最大元素；
 * 将其与序列的最后一个元素交换，将序列长度减一；
 * 再将序列建成堆（堆调整）后，堆顶元素仍是序列中的最大元素，再次将其与序列最后一个元素交换并缩短序列长度；
 * 反复此过程，直至序列长度为一，所得序列即为排序后结果。
 **************************************************************/
void HeapAdjust(int data[],int s,int m) /* 排列成堆的形式 */
{
    int j,rc;
    rc=data[s];     /* 保存处理元素 */
    for(j=2*s;j<=m;j*=2)        /* 处理父亲元素 */
    {
        if(j<m && data[j]<data[j+1])  ++j; /* 取较大的孩子节点 */
        if(rc>data[j]) break;
        data[s]=data[j];   /* 父节点比较大的孩子节点大则互换 ,保证父节点比所有子节点都大（父节点存储在前面）*/
        s=j;
    }
    data[s]=rc;     /* 相当于data[j]=rc */
}


void Heap_sort(int data[],int long_n) /* 堆排序函数 */
{
    int i,temp;
    for(i=long_n/2;i>0;--i)  /* 还没有读懂这样处理的原因，希望大家不吝赐教 */
    {
        HeapAdjust(data,i,long_n); /* 处理后，data[i]是这个数组后半部分的最大值 */
    }
    for(i=long_n;i>0;--i)
    {
        temp=data[1];    /* 把根元素（剩下元素中最大的那个）放到结尾 ,下一次只要排剩下的数就可以啦*/
        data[1]=data[i];
        data[i]=temp;
        HeapAdjust(data,1,i-1);
    }
}
//
//地址：
//http://wenku.baidu.com/view/c3054c0f7cd184254b353516.html
//
//本文转载：http://blog.csdn.net/wengwuzi/archive/2008/10/05/3017968.aspx

@end
