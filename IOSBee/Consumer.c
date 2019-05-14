#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/shm.h>
int main(int argc, char *argv[])
{
    pid_t pid;
    pid=fork();   // fork two process
    if (pid<0) {
        printf("error\n");
    }
    if (pid==0) {   //child process to get location and name from Produce
        int shmid;
        char *shmptr;
        if((shmid=shmget(0x45,BUFSIZ,(SHM_R | SHM_W)|IPC_CREAT))<0){
            perror("shmget");
        }
        if((shmptr=shmat(shmid,0,0))==(void*)-1){
            perror("shmat");
        }
        printf("%s\n",shmptr);
    }else{    //parents start Producer and send a charater to Producer
        int shmid_out;
        char *shmptr_out;
        if((shmid_out=shmget(0x46,BUFSIZ,(SHM_R | SHM_W)|IPC_CREAT))<0){
            perror("shmget");
        }
        if((shmptr_out=shmat(shmid_out,0,0))==(void*)-1){
            perror("shmat");
        }
        sprintf(shmptr_out,"%c",'x');
        execl("./Producer", NULL,NULL);
    }
    return 0;
}

