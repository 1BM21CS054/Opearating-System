#include<stdio.h>
#include<stdlib.h>

int mutex=1,full=0,empty=3,x=0;

int main()
{
    int n;
    void producer();
    void consumer();
    int wait(int);
    int signal(int);
    printf("\n1.Producer\n2.Consumer\n3.Exit");
    while(1)
    {
        printf("\nEnter your choice:");
        scanf("%d",&n);
        switch(n)
        {
            case 1:    if((mutex==1)&&(empty!=0))
                        producer();
                    else
                        printf("Buffer is full!!");
                    break;
            case 2:    if((mutex==1)&&(full!=0))
                        consumer();
                    else
                        printf("Buffer is empty!!");
                    break;
            case 3:
                    exit(0);
                    break;
        }
    }

    return 0;
}

int wait(int s)
{
    return (--s);
}

int signal(int s)
{
    return(++s);
}

void producer()
{
    mutex=wait(mutex);
    full=signal(full);
    empty=wait(empty);
    x++;
    printf("\nProducer produces the item %d",x);
    mutex=signal(mutex);
}

void consumer()
{
    mutex=wait(mutex);
    full=wait(full);
    empty=signal(empty);
    printf("\nConsumer consumes item %d",x);
    x--;
    mutex=signal(mutex);
}
EDF
#include <stdio.h>

#define MAX_TASKS 100

typedef struct {
    int task_id;
    int arrival_time;
    int execution_time;
    int deadline;
    int is_completed;
} Task;

float calc_cpu_util(Task tasks[], int n) {
    float total_util = 0.0;

    for (int i = 0; i < n; i++) {
        float task_util = (float)tasks[i].execution_time / tasks[i].deadline;
        total_util += task_util;
    }

    float cpu_util = total_util * 100;
    return cpu_util;
}

int main() {
    int n, i;

    printf("Enter the number of tasks: ");
    scanf("%d", &n);

    Task tasks[MAX_TASKS];

    for (i = 0; i < n; i++) {
        printf("Task %d\n", i + 1);
        printf("Enter execution time: ");
        scanf("%d", &tasks[i].execution_time);
        printf("Enter deadline: ");
        scanf("%d", &tasks[i].deadline);

        tasks[i].task_id = i + 1;
        tasks[i].is_completed = 0;
    }

    float cpu_util = calc_cpu_util(tasks, n);

    printf("CPU Utilization: %.2f%%\n", cpu_util);

    return 0;
}

