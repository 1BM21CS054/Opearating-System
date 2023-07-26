#include<stdio.h>
#define MAX_TASKS 100

typedef struct {
    int pid;
    int period;
    int exec_time;
    int deadline;
} Task;

float cpu_util(Task tasks[], int n) {
    float total_utilization = 0.0;

    for (int i = 0; i < n; i++) {
        float task_utilization = (float)tasks[i].exec_time / tasks[i].period;
        total_utilization += task_utilization;
    }

    float cpu_utilization = total_utilization * 100;
    return cpu_utilization;
}

rateMonotonic(){
    int n, i;

    printf("Enter the number of tasks: ");
    scanf("%d", &n);

    Task tasks[MAX_TASKS];

    for (i = 0; i < n; i++) {
        printf("Task %d\n", i + 1);
        printf("Enter period: ");
        scanf("%d", &tasks[i].period);
        printf("Enter execution time: ");
        scanf("%d", &tasks[i].exec_time);
       /* printf("Enter execution time: ");
        scanf("%d", &tasks[i].exec_time;*/
        printf("Enter deadline: ");
        scanf("%d", &tasks[i].deadline);

        tasks[i].pid = i + 1;
    }

    float cpu_utilization = cpu_util(tasks, n);

    printf("CPU Utilization: %.4f%%\n", cpu_utilization);
}

void main(){
    int choice, n, i;
    printf("1.Rate montonic\n2.exit\n\n");
    while(1){
        scanf("%d",&choice);
        switch(choice){
            case 1: rateMonotonic();
            break;
            case 2:
                exit(0);
            default: printf("Wrong choice\n");
        }
    }
}
