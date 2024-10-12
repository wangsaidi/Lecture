# Linux Driver Development Experiment Guide

**Warning: Dear CSGO: Global Offensive 2 players, our virtual machine cannot coexist with the Perfect World Esports platform on your computer. To learn embedded systems, please uninstall the Perfect World Esports platform.**
*Note: The 5E platform is not affected.*

## 1. Experiment Objectives
- Master the writing and testing of Linux device drivers.
- Understand the process of loading, unloading, and interacting with the kernel.
- Learn to manage drivers in the Linux system using commands like `insmod`, `rmmod`, `lsmod`, and `dmesg`.

## 2. Experiment Preparation
### 2.1 Equipment
- **Hardware**: Personal computer
- **Software**: Linux operating system (e.g., Ubuntu) with basic development tools installed (e.g., `gcc`, `make`).

### 2.2 Environment Configuration
- Ensure the Linux operating system is correctly installed and command-line tools are available.
- Use VirtualBox or other virtual machine software to isolate the experimental environment.

## 3. Experiment Steps

### 3.1 Create Driver Source File
1. In the terminal, navigate to the experiment directory and create a folder named `drv` to store all related files:
   ```bash
   mkdir drv
   cd drv
   ```

2. Create a C source file named `hello.c` with the following command:
   ```bash
   gedit hello.c
   ```
   - Alternatively, you can use Vim. Ensure you are in the `drv` directory and use `vim hello.c`.

3. Add the following code to create a simple driver:
   ```c
   #include <linux/init.h>
   #include <linux/module.h>
   #include <linux/kernel.h>

   static int __init hello_init(void)
   {
       printk(KERN_ALERT "Hello, World!\n");
       return 0;
   }

   static void __exit hello_exit(void) {
       printk(KERN_INFO "Goodbye, World!\n");
   }

   MODULE_LICENSE("GPL");
   MODULE_DESCRIPTION("A simple hello world module");
   MODULE_AUTHOR("Your Name");
   module_init(hello_init);
   module_exit(hello_exit);
   ```

4. Save and close the `hello.c` file.

### 3.2 Write Makefile
1. In the same directory, create a file named `Makefile` and add the following content:
   ```makefile
   obj-m += hello.o
   ```

2. Save and close the `Makefile`.

### 3.3 Compile the Driver
1. Run `make` to compile the driver:
   ```bash
   make -C /lib/modules/$(uname -r)/build M=$(pwd) modules
   ```

2. Confirm that the compilation was successful, generating a file named `hello.ko`.

### 3.4 Load the Driver Module
1. Use `insmod` to load the module:
   ```bash
   sudo insmod hello.ko
   ```

2. Check if the module is loaded with `lsmod`:
   ```bash
   lsmod | grep hello
   ```

3. Use `dmesg` to check the system log for "Hello, World!" message:
   ```bash
   dmesg | tail
   ```

### 3.5 Unload the Driver Module
1. Use `rmmod` to unload the driver:
   ```bash
   sudo rmmod hello
   ```

2. Use `dmesg` again to check for "Goodbye, World!" message:
   ```bash
   dmesg | tail
   ```

## Display Experiment Results
In the experiment, observe the system log output:
1. When loading the driver, `dmesg` outputs "Hello, World!".
2. When unloading the driver, `dmesg` outputs "Goodbye, World!".

## Common Issues and Solutions

### 5.1 Compilation Errors
- **Issue**: Errors during `make`, indicating missing kernel headers.
- **Solution**: Ensure Linux kernel headers are installed:
  ```bash
  sudo apt-get install linux-headers-$(uname -r)
  ```

### 5.2 Unable to Load Driver
- **Issue**: Permission denied or module load failure during `insmod`.
- **Solution**: Use `sudo` and ensure successful module compilation.

### 5.3 No Log Output
- **Issue**: `dmesg` does not show "Hello, World!" or "Goodbye, World!".
- **Solution**: Clear the log buffer with `dmesg -c` and test again.

### 5.4 Unable to Unload Module
- **Issue**: `rmmod` fails, indicating the module is in use.
- **Solution**: Ensure no processes are using the module; check with:
  ```bash
  lsmod | grep hello
  ```

### 5.5 Command Errors from Textbook
- **Issue**: Command not found error.
- **Solution**: Install the required package:
  ```bash
  sudo apt-get install <package-name>
  ```

## Result Analysis
Successfully wrote and loaded a simple Linux driver module, understanding the basic workflow of driver development. The experiment achieved the following:
- Learned to write a simple driver.
- Managed driver modules using Linux commands.
- Interacted with system logs through the driver.

## Questions
- What is a driver? What is its purpose?
- How can this simple driver be extended for other tasks?
- How can drivers interact with user applications?
````
