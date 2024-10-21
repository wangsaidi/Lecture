## 实验三：文件I/O和进程控制编程

第5组

## 实验目的

-   在Linux下的主文件I/O编程。
    
-   在Linux下的主进程控制编程。
    

## 实验设备

-   硬件：PC机器
    
-   软件：VirtualBox虚拟机和Ubuntu操作系统。
    

## 实验视频教程

[嵌入式Linux实验三视频](https://tingwu.aliyun.com/doc/transcripts/wg57n33gk5xjnkr3?sl=1#)

## 实验预习要求

-   阅读第2.7节
    
-   阅读第2.8节
    

## 实验内容

-   精通基本的输入/输出编程。
    
-   精通标准输入/输出操作编程。
    
-   创建子进程。
    
-   掌握exec()函数族、exit()函数和wait()函数的使用。
    
-   精通僵尸进程编写。
    

## 实验程序

-   ### 精通基本的输入/输出编程。
    

#### 通过综合示例，我熟悉了Linux下的基本输入/输出编程，并掌握了基本的I/O操作，例如在打开、读取、写入、定位和关闭时使用的函数open、read、write、lseek和close。参考代码如下，输入源代码，编译并运行，然后在终端查看结果。

```
<sider-code-explain id="sider-code-explain" data-gpts-theme="light"></sider-code-explain><code># include&lt;unistd.h&gt;
# include&lt;sys/types.h&gt;
# include&lt;sys/stat.h&gt;
# include&lt;fcntl.h&gt;
# include&lt;stdlib. h&gt;
# include&lt;stdio.h&gt;
#include&lt;string.h&gt;
int main(void)
{
   char * buf ="Hello! I'm writing to this file!";
   char buf_r[11];
   int fd,size,len;
   len = strlen(buf);
   buf_r[10] =\o';/* 首先调用 open 函数，并指定相应的权限/
   if((fd = open("hello.c",0_CREAT | 0_TRUNC|0_RDMR,0666))&lt;0)
   {
      perror("open:");
      exit(1);
   }
   else
    printf("open and create file:hello.c td OK\n",fd);/* 调用 write 函数，将 buf 中的内容写入到打开的文件中*/
   if((size = write( fd, buf,len))&lt;0)
   {
      perror("write:");
      exit(1);
   }
   else
   printf("Write:号 s OK\n",buf);
   /* 调用lseek 函数将文件指针移动到文件起始，并读出文件中的10字节 */
   lseek(fd,0,SEEK_SET);
   if((size = read( fd, buf_r,10))&lt;0)
   {
      perror("read:");
      exit(1);
   }
   else
   printf(" read form file:s OK\n",buf_r);
   if(close(fd)&lt;0)
   {
      perror("close:");
      exit(1);
   }
   else
      printf("Close hello.c OK\n");return 0;
}

</code>
```

#### 结果示例

[![img](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/2/1.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/2/1.png)

-   ### 精通标准输入/输出操作编程。
    

#### 掌握fopen()函数、fclose()函数、fread()和fwrite()函数的使用，通过综合示例，参考代码如下，输入源代码，编译并运行，在终端查看结果：

```
<sider-code-explain id="sider-code-explain" data-gpts-theme="light"></sider-code-explain><code># include&lt;stdio.h&gt;
# include&lt;unistd.h&gt;
# include&lt;fcntl.h&gt;
# include&lt;sys/stat.h&gt;
# include&lt;sys/types.h&gt;
char buf1[] ="abcdefghij";
char buf2[] = "ABCDEFGHIJ";
void err_exit(char *err_s){
    perror(err_s);
    exit(1);
    }
        int main(void)
    {
    FILE *fp;
    if((fp = fopen("hole.file","w"))== NULL)
        err_exit("file open fail!");
    if(fwrite(buf1,sizeof(buf1),1,fp)!=1)
        err_exit("file write buf1 error!");
    if(fseek(fp,40,SEEK_SET)==-1)
        err_exit("fseek error!");
    if(fwrite(buf2,strlen(buf2),1,fp)!=1)
        err_exit("file write buf2 error!");
    fclose(fp);
}

</code>
```

#### 结果示例

[![img](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/3/1.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/3/1.png) [![img](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/3/2.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/3/2.png)

-   ### 创建子进程。
    

#### 使用fork函数编程创建子进程，了解父进程的执行过程，参考代码如下，输入源代码，编译并运行，在终端查看结果。

#### 源代码功能：父进程创建子进程，父子进程分别循环输出字符串6次，每次输出后使用sleep(5)延迟5秒，然后进入下一个循环。

```
<sider-code-explain id="sider-code-explain" data-gpts-theme="light"></sider-code-explain><code># include&lt;stdio.h&gt;
main(){
    int p,i;
    while((p= fork())==-1); //创建子进程直至成功
    if(p==0)
    //子进程返回
    {
        for(i=0;i&lt;6;i++)
        {
            printf("Hello,this is a child process! ID= 8d \n",getpid());
            sleep(5); //延时5s
        }
    }
        //父进程返回
     else
    {
        for(i=0;i&lt;6;i++)
        {
            printf("Hello,this is a parent process! ID= n",getpid());
            sleep(5); //延时5s
        }
    }
}

</code>
```

#### 首先，修改上述程序，使用 exit() 和 wait() 实现父进程的同步，其同步模式为父进程。

#### 为了同步子进程，即子进程循环输出6次，然后父进程循环输出6次。

```
<sider-code-explain id="sider-code-explain" data-gpts-theme="light"></sider-code-explain><code># include&lt;stdio.h&gt;
main()
{   int p,i;
    while((p= fork())==-1); //创建子进程直至成功
    if(p&gt;0)//返回父进程
    {
    wait(0);
    //父进程等待子进程终止
    for(i=0;i&lt;6;i++)
    {
        printf("Hello,this is a parent process! ID= n",getpid());
        sleep(5);
        //延时5s
    }
    }
    else
    {
        //返回子进程
        for(i=0;i&lt;6;i++)
        {
            printf("Hello,this is a child process! ID= n",getpid());
            sleep(5);
        }
        exit(0);//子进程向父进程发终止信号
    }
}

</code>
```

#### 结果示例

[![img](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/4/1.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/4/1.png) [![img](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/4/2.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/4/2.png)

-   ### 掌握exec()函数族、exit()函数和wait()函数的使用。
    

#### 参考代码如下，输入源代码，编译并运行，然后在终端查看结果。

#### 代码功能：通过 fork()、wait() 和 exit() 实现进程创建、并发和同步；使用 fork 创建一个子进程，该进程调用 exec() 启动 Shell 命令 ps 以查看系统当前的进程信息。

```
<sider-code-explain id="sider-code-explain" data-gpts-theme="light"></sider-code-explain><code># include&lt;stdio.h&gt;
# include&lt;sys/types.h&gt;
#include&lt;unistd.h&gt;
main(){
    pid_t pid;
    char * path="/bin/ps";char * argv[5]={"ps","-a","-x",NULL};
    printf("Run ps with execve by child process:\n");
    if((pid=fork())&lt;0)
    {
        printf("fork error!");exit(0);
    }
    else if(pid==0)
    {
        if(execve(path,argv,0)&lt;0)
        {
            printf("fork error!");
            exit(0);
        }
        printf("child is ok!\n");
        exit(0);
    }
    wait();
    printf("it is ok!\n");
    exit(0);
}

</code>
```

#### 结果示例：

```
<sider-code-explain id="sider-code-explain" data-gpts-theme="light"></sider-code-explain><code>#include &lt;stdio.h&gt;
#include &lt;unistd.h&gt;
#include &lt;stdlib.h&gt;
#include&lt;sys/types.h&gt;
#include &lt;sys/wait.h&gt;
main(void)
pid t pid =0;
int status;
pid = fork();
if(pid ==0)
printf("I am the child.");execl("/bin/ls","ls","-1"，"/home/ubuntu/",(char *)0);perror("In exec():");
if(pid &gt;e)printf("I am the parent, and the child is %d.\n", pid);pid = wait(&amp;status);printf("End of process %d:",pid);
if(WIFEXITED(status)){
printf("The process ended with exit(%d).\n",WEXITSTATUS(status));
if(WIFSIGNALED(status)){
printf("The process ended with kill -%d.\n", WTERMSIG(status));
if(pid&lt;o){
perror("In fork():");
exit(0);
}
#include&lt;stdio.h&gt; // printf()
#include&lt;stdlib.h&gt;// exit()
#include&lt;sys/types.h&gt; // pid t                                           
 #include&lt;sys/wait.h&gt;//wait()                                                          
#include&lt;unistd.h&gt;// fork
int main(int argc, char **argv)
pid t pid;
pid = fork();
if(pid==0)
printf("It is the child process and pid is %d\n",getpid());
int i=0;
for(i=0;i&lt;8;i++)
printf("%d\n",i);
exit(0);
else if(pid &gt;8)
printf("It is the parent process and pid is %d\n",getpid());
int status;
wait(&amp;status);
printf("child is reaped\n");
else
printf("Error in forking..\n");                                                                                                      
   exit(EXIT FAILURE)；                                                                                                                                        
}                                                                                                                                                      
   return 0；
 }
</code>
```

[![img](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/5/1.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/5/1.png) [![img](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/5/2.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/5/2.png)

-   ### 精通僵尸进程编写。
    

#### 参考代码如下，输入源代码，编译并运行，然后在终端查看结果。

```
<sider-code-explain id="sider-code-explain" data-gpts-theme="light"></sider-code-explain><code># include&lt;stdio.h&gt;
# include&lt;sys/types.h&gt;
main()
{
    pid_t pid;
    pid= fork();
    if(p&lt;0)
    //出错处理
        printf("error occurred");
    else if(p==0)
        exit(0);
    else
    {
        sleep(60);
        wait(NULL);
    }
}


</code>
```

#### 结果示例

[![img](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/6/1.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/6/1.png) [![img](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/6/2.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/6/2.png) [![img](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/6/3.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/6/3.png)

-   ### 思考问题
    

#### 基本I/O操作和标准I/O操作之间有什么区别？

**_解决方案：_**[![img](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/questions/1.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/questions/1.png)

#### fork函数有几种不同的返回值，每个返回值的含义是什么？

**_解决方案：_**[![img](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/questions/2.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/questions/2.png)

#### 使用exec函数调用“ls -1”命令的编程实现。

**_解决方案：_**[![img](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/questions/3.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/questions/3.png) [![img](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/questions/32.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/questions/32.png)

#### 在互联网上搜索僵尸进程，调试并理解程序，掌握编写僵尸进程的方法。

**_解决方案：_**[![img](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/questions/4.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/questions/4.png) [![img](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/questions/42.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/questions/42.png) [![img](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/questions/43.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/3rd_Experiment/assets/questions/43.png)

-   ### 部门
    

#### 张静歌：团队负责人，负责仓库建设、文档撰写和任务组织。

#### 周心怡:负责掌握基本的IO编程，以及相应的代码编写部分

#### 郭若晗:负责掌握标准IO操作编程，以及相应的代码编写部分

#### 李圣炎：负责创建子流程并编写相应的代码

#### 唐新豪：负责掌握 exec 函数族、exit 函数和 wait 函数的使用，以及相应部分的代码编写。

#### 赵浩宇:负责掌握Zombie进程的编写及相应的代码部分

#### 张地:负责解决思考问题

#### 张赛博:两人负责视频的录制。

#### 刘明庆：两个人负责视频的录制。

#### 王佳慧:帮助大家并完善细节