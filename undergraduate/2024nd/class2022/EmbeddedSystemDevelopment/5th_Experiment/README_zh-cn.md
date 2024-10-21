# Linux 驱动程序设计实验指导书

**Warning:各位亲爱的CSGO：Global Offensive2 的玩家朋友，我们的虚拟机无法和完美世界电竞平台同时出现在您的电脑上，为了学习嵌入式，请删除完美世界电竞平台。**
*另：经验证，5E平台不受影响。*

## 1. 实验目的
- 掌握Linux设备驱动程序的编写与测试。
- 了解驱动程序的加载、卸载及其与内核的交互过程。
- 学会在Linux系统中使用`insmod`、`rmmod`、`lsmod`、`dmesg`等命令管理驱动程序。

## 2. 实验准备
### 2.1 实验设备
- **硬件**：个人电脑
- **软件**：Linux操作系统（如Ubuntu），以及安装了基本的开发工具（如`gcc`、`make`等）。

### 2.2 环境配置
- 确保已经正确安装Linux操作系统，并可以使用命令行工具。
- 使用VirtualBox或其他虚拟机软件以便隔离实验环境。

## 3. 实验步骤

### 3.1 创建驱动程序源码文件
1. 在终端中进入实验目录，创建一个名为`drv`的文件夹以存放所有驱动程序相关文件：
   ```bash
   mkdir drv
   cd drv
   ```

2. 使用以下命令创建一个名为`hello.c`的C语言源代码文件：
   ```bash
   gedit hello.c
   ```
   - 在这一步中，你也可以使用Vim来完成操作。在确保你的路径为drv的前提下，使用`Vim hello.c`来完成内容创建。

3. 在文件中添加以下代码，创建一个简单的驱动程序：
   ```c
   #include<linux/init.h>
   #include <linux/module.h>
   #include <linux/kernel.h>

   static int__init hello_init(void)
   {
       printk(KERN_ALERT "Hello, World!\n");
       return 0;
   }

   static void__exit hello_exit(void) {
       printk(KERN_INFO "Goodbye, World!\n");
   }

   MODULE_LICENSE("GPL");
   MODULE_DESCRIPTION("A simple hello world module");
   MODULE_AUTHOR("Your Name");
   module_init(hello_init);
   module_init(hello_exit);
   ```

4. 保存并关闭`hello.c`文件。

【图片1：显示`hello.c`文件的内容】

### 3.2 编写Makefile
1. 在相同目录下创建一个名为`Makefile`的文件，输入以下内容：
   ```makefile
   obj-m += hello.o
   ```
![Exam_makefile](assets/406a4d7f36c07d902f07eb3a59ac628.png)


2. 保存并关闭`Makefile`文件。


### 3.3 编译驱动程序
1. 在终端中运行`make`命令来编译驱动程序：
   ```bash
   make -C /lib/modules/$(uname -r)/build M=$(pwd) modules
   ```

2. 确认编译成功后，会生成一个名为`hello.ko`的驱动模块文件。可以用`ls`查看当前目录下生成的目标程序。

![Hello.ko_makefile](assets/582a6934e625308904101c8b0e4e9c7.png)


### 3.4 加载驱动程序模块
1. 使用`insmod`命令加载该模块：
   ```bash
   sudo insmod hello.ko
   ```

2. 使用`lsmod`命令检查驱动模块是否成功加载：
   ```bash
   lsmod hello.ko
   ```
   ```bash
    lsmod
   ```
   可以看到输出结果
   ![Ismod.ko_makefile](assets/lsmod 第一部分.png)



3. 使用`dmesg`命令查看系统日志，确认驱动模块是否输出“Hello, World!”信息：
   ```bash
   dmesg | tail
   ```



### 3.5 卸载驱动程序模块
1. 使用`rmmod`命令卸载驱动程序：
   ```bash
   sudo rmmod hello
   ```

2. 使用`dmesg`再次查看日志，确认已输出“Goodbye, World!”信息：
   ```bash
   dmesg | tail
   ```
   
![Ismod.ko_makefile](assets/99bec5dda29807647a6890e1b8d1e8b.jpg)


## 掌握Linux驱动程序设计的调试过程

**请注意，课本上的实验流程没有问题，但代码因为诸多原因跑不通，我重新写了一份代码，但不更改实验流程，供同学们参考**


### 1. 编写驱动程序

1. 从虚拟机运行Linux操作系统，启动终端后新建一个目录`chrdrv`。

    ```bash
    mkdir chrdrv
    cd chrdrv
    ```


2. 使用gedit编写一个字符设备驱动框架取名为`demo.c`。

    ```bash
    gedit demo.c
    ```
![Ismod.ko_makefile](assets/lsmod 第一部分.png)

    demo.c文件内容
   ```bash
 /******* demo.c ****/

#include <linux/module.h>  // 支持加载和卸载模块
#include <linux/kernel.h>  // 包含系统日志函数printk
#include <linux/fs.h>      // 包含文件操作相关的结构和定义
#include <linux/uaccess.h> // 包含用户空间与内核空间数据复制函数
#include <linux/slab.h>    // 包含内存分配函数，如kmalloc和kfree
#include <linux/init.h>    // 包含模块初始化和清理函数的宏

// 定义设备名称和主设备号
#define DEVICE_NAME "demodrv"
#define MAJOR_NUM 267
#define BUF_LEN 1024

// 静态变量定义
static char *device_buffer; // 设备缓存区
static int open_count = 0;  // 设备打开计数器

/* 函数原型 */
static int demo_open(struct inode *inode, struct file *file);
static int demo_release(struct inode *inode, struct file *file);
static ssize_t demo_read(struct file *file, char __user *buf, size_t count, loff_t *ppos);
static ssize_t demo_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos);

/* 文件操作结构体 */
static struct file_operations fops = {
    .open = demo_open,
    .release = demo_release,
    .read = demo_read,
    .write = demo_write,
};

/* 设备打开函数 */
static int demo_open(struct inode *inode, struct file *file) {
    open_count++;  // 增加设备打开计数
    printk(KERN_INFO "demodrv: Device opened %d time(s)\n", open_count);
    return 0;
}

/* 设备关闭函数 */
static int demo_release(struct inode *inode, struct file *file) {
    printk(KERN_INFO "demodrv: Device closed\n");
    return 0;
}

/* 从设备读取数据 */
static ssize_t demo_read(struct file *file, char __user *buf, size_t count, loff_t *ppos) {
    if (count > BUF_LEN) count = BUF_LEN;  // 限制读取长度
    if (copy_to_user(buf, device_buffer, count)) {  // 将数据从内核空间复制到用户空间
        return -EFAULT;
    }
    printk(KERN_INFO "demodrv: Read %zu bytes\n", count);
    return count;
}

/* 向设备写入数据 */
static ssize_t demo_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos) {
    if (count > BUF_LEN) count = BUF_LEN;  // 限制写入长度
    if (copy_from_user(device_buffer, buf, count)) {  // 将数据从用户空间复制到内核空间
        return -EFAULT;
    }
    printk(KERN_INFO "demodrv: Written %zu bytes\n", count);
    return count;
}

/* 模块初始化函数 */
static int __init demo_init(void) {
    int result;

    /* 分配设备缓存区 */
    device_buffer = kmalloc(BUF_LEN, GFP_KERNEL);
    if (!device_buffer) {
        printk(KERN_ALERT "demodrv: Failed to allocate device buffer\n");
        return -ENOMEM;
    }

    /* 注册字符设备 */
    result = register_chrdev(MAJOR_NUM, DEVICE_NAME, &fops);
    if (result < 0) {
        printk(KERN_ALERT "demodrv: Registering device failed with %d\n", result);
        kfree(device_buffer);
        return result;
    }

    printk(KERN_INFO "demodrv: Registered with major number %d\n", MAJOR_NUM);
    return 0;
}

/* 模块清理函数 */
static void __exit demo_exit(void) {
    unregister_chrdev(MAJOR_NUM, DEVICE_NAME);  // 注销字符设备
    kfree(device_buffer);  // 释放设备缓存区
    printk(KERN_INFO "demodrv: Unregistered and memory freed\n");
}

module_init(demo_init);
module_exit(demo_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Your Name");
MODULE_DESCRIPTION("A simple character device driver");
```

4. 编写完毕后保存文件，编写一个测试驱动的程序取名为`test_demo.c`，一个`Makefile`文件。

test_demo.c
```bash
/******* test_demo.c ****/

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>  // 文件控制定义
#include <unistd.h> // UNIX 标准函数定义
#include <string.h>

#define DEVICE "/dev/demodrv"  // 设备文件路径
#define BUF_LEN 1024  // 缓冲区长度

int main() {
    int fd;  // 文件描述符
    char write_buf[BUF_LEN] = "Hello from user space!";  // 写入设备的缓冲区
    char read_buf[BUF_LEN];  // 从设备读取的缓冲区

    /* 打开设备 */
    fd = open(DEVICE, O_RDWR);
    if (fd < 0) {
        perror("Failed to open the device");
        return EXIT_FAILURE;
    }

    /* 向设备写入数据 */
    if (write(fd, write_buf, strlen(write_buf)) < 0) {
        perror("Failed to write to the device");
        close(fd);
        return EXIT_FAILURE;
    }

    printf("Written to the device: %s\n", write_buf);

    /* 从设备读取数据 */
    if (read(fd, read_buf, BUF_LEN) < 0) {
        perror("Failed to read from the device");
        close(fd);
        return EXIT_FAILURE;
    }

    printf("Read from the device: %s\n", read_buf);

    /* 关闭设备 */
    close(fd);

    return EXIT_SUCCESS;
}
```

Makefile
```bash
# Makefile for compiling the demo driver and test program

obj-m += demodrv.o  # 指定要编译的模块
demodrv-objs := demo.o  # 指定模块的源文件

# Kernel build directory
KDIR := /lib/modules/$(shell uname -r)/build  # 获取当前内核版本并设置内核构建目录

# Current directory
PWD := $(shell pwd)  # 获取当前目录

# Default target
all:
	make -C $(KDIR) M=$(PWD) modules  # 使用内核构建系统编译模块
	gcc -o test_demo test_demo.c  # 编译测试程序

# Clean up the directory
clean:
	make -C $(KDIR) M=$(PWD) clean  # 清理模块编译生成的文件
	rm -f test_demo  # 删除测试程序
```

6. 使用`ls`命令查看目录中的文件。

    ```bash
    ls
    ```

    应看到如下文件：`demo.c`、`Makefile`、`test_demo.c`。
![Ismod.ko_makefile](assets/文件夹里应该有的三个文件.png)


### 2. 编译驱动程序

1. 使用Make编译驱动和测试文件，可以看到生成了`demodrv.ko`驱动模块。

    ```bash
    make
    ```
![Ismod.ko_makefile](assets/make编译成功.png)

2. 编译完成后，使用`ls`命令查看生成的文件。

    ```bash
    ls
    ```

    应看到如下文件：`demo.c`、`demodrv.mod.o`、`Makefile`、`Module.symvers`、`test_demo.o`、`demodrv.ko`、`demodrv.o`、`Module.markers`、`test_demo`、`modules.order`、`test_demo.c`。

### 3. 创建设备节点

1. 使用`mknod`命令创建设备节点。

    ```bash
    mknod /dev/demodrv c 267 0
    ```

2. 使用`ll`命令查看该节点的详细信息。

    ```bash
    ll /dev/demodrv
    ```
![Ismod.ko_makefile](assets/运行驱动程序.png)

### 4. 插入驱动模块

1. 使用`insmod`命令插入驱动模块。

    ```bash
    insmod demodrv.ko
    ```

2. 使用`lsmod`命令查看模块是否加载成功。

    ```bash
    lsmod
    ```

3. 查看`/proc/modules`文件中有关该模块加载的信息。

    ```bash
    cat /proc/modules
    ```

4. 查看`/var/log/messages`中关于该模块加载、读/写的输出信息。

    ```bash
    cat /var/log/messages
    ```

### 5. 测试驱动程序

1. 运行测试程序`test_demo`。

    ```bash
    ./test_demo
    ```
![Ismod.ko_makefile](assets/运行驱动程序.png)

2. 观察应用程序访问驱动的情形。

### 6. 卸载驱动模块

1. 使用`rmmod`命令将驱动模块卸载。

    ```bash
    rmmod demodrv.ko
    ```

2. 再次运行测试程序，验证驱动程序是否被卸载。

    ```bash
    ./test_demo
    ```

## 实验思考题

1. **驱动程序和应用程序有何区别？**

    驱动程序是操作系统的一部分，用于控制硬件设备；应用程序则是用户与操作系统之间的接口，用于执行特定任务。

2. **使用哪些命令能够实现Linux驱动模块的动态加载和卸载？**

    - 加载驱动模块：`insmod`
    - 卸载驱动模块：`rmmod`
    - 查看加载的模块：`lsmod`
    - 查看模块信息：`cat /proc/modules`

## 实验总结

通过本次实验，你应该能够理解Linux驱动程序的基本框架，并掌握驱动程序的编写、编译、加载、卸载和调试过程。

### 3.8 可能需要用到的补充内容
- Vim相关知识：Vim在使用的过程从，按`I`进入编辑模式，即可以书写代码。按`ESC`可推出编辑模式，按`:`，进入命令模式，同时，在命令模式中按`wq`，即可保存退出Vim。
- 你可能用到的终端指令：`cd /xx/xx/xx`，帮助你切换到xx（你指定的）路径，因为在实验中，要求你在同一路径下，cd可以帮助你快速切换。sudo+指令，让这条指令获得高级权限。
- 如何开启root权限。`sudo passwd root`,而后设置密码即可。下次想要开启root，只需要输入`sudo su`,而后输入刚刚设置的密码 即可开启。


## 4. 实验结果展示
在实验中，通过以下步骤可以观察到系统日志的输出：
1. 加载驱动程序时，`dmesg`输出“Hello, World!”。
2. 卸载驱动程序时，`dmesg`输出“Goodbye, World!”。

## 5. 常见问题分析与解决

### 5.1 编译错误
- **问题**：在运行`make`时可能出现错误，提示找不到内核头文件。
- **解决方案**：确保已经安装了Linux内核头文件。可以通过以下命令安装：
  ```bash
  sudo apt-get install linux-headers-$(uname -r)
  ```

### 5.2 无法加载驱动程序
- **问题**：使用`insmod`命令时，提示权限不足或模块加载失败。
- **解决方案**：确保使用`sudo`运行命令，并检查模块的编译是否成功。

### 5.3 驱动程序加载后没有输出日志
- **问题**：使用`dmesg`命令没有看到预期的“Hello, World!”或“Goodbye, World!”信息。
- **解决方案**：可能是日志缓冲区已满。使用`dmesg -c`清空缓冲区后，再次加载驱动进行测试。

### 5.4 无法卸载驱动模块
- **问题**：`rmmod`命令无法卸载模块，提示模块正在使用中。
- **解决方案**：确保没有进程正在使用该模块。可以使用以下命令查看模块的使用情况：
  ```bash
  lsmod | grep hello
  ```

### 5.5 输入课本中命令报错
- **问题**：提醒：目前无此命令，需要输入`sudo apt-get install xxx`
- **解决方案**：按照指定命令输入即可，有些东西Linux并没有直接都给你安装好。

## 6. 结果分析
通过本次实验，成功编写并加载了一个简单的Linux驱动模块，理解了驱动程序的基本工作流程。实验达到了以下目的：
- 学习了如何编写简单的驱动程序。
- 学会了如何使用Linux命令管理驱动模块。
- 掌握了驱动程序与系统日志的交互方法。

## 7. 思考题
- 什么是驱动程序？它的作用是什么？
- 你觉得这个简单的驱动程序可以扩展来做什么样的工作？
- 如何让驱动程序能够和应用程序进行交互？
