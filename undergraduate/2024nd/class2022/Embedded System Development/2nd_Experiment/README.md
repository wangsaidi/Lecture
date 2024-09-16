#                          Experiment 2

## 1. Experimental objective

① Be familiar with the C language development environment under Ubuntu.  

② Master the use of Vi, GCC, and GDB.  

③ Master the C language programming process under Linux.  

④ Master the integrated development environment under Linux.

## 2. Experimental equipment 

Hardware:PC.  

Software: VirtualBox virtual machine, Ubuntu operating system.

## 3. Experimental preview requirements

① Read section 2.1.2 to get familiar with the C language development process under Linux.  

② Read section 2.2 to master the use of the Vim editor.  

③ Read section 2.3 to master the use of the GCC compiler.  

④ Read section 2.4 to master the use of the GDB debugger.  

⑤ Read Section 2.5, Make Engineering Manager.  

⑥Read section 2.6 and become familiar with the CodeBlocks integrated development environment.

## 4. Experimental content

① The C language development process under Linux.  

② Use of the Vi and Vim editors.  ③ Use of the GCC compiler.  

④ Use of the GDB debugger.  

⑤ Use of the Make Engineering Manager.  

⑥ Familiar with the CodeBlocks integrated development environment.

## 5. The Experimental Procedures of No

#### **（**1**）** Development process of C language under Linux (refer to Section 2.1) 

① Start the virtual machine, enter the operating system, and then press the shortcut key“ Ctrl +  Alt + T ”to start the terminal.

② Enter the root mode.  If you do not enter root mode before, enter the user password and set the new password for root  mode; if you have set root mode before, enter the command “`su root`” to enter.

As shown in Figure Figure 2-1

![](.\assets\图片1.png)

③ Update directory easy to install Vim editor, GCC compiler, etc: `sudo apt update` 

④ Install the Vim editor: `apt-get install vim` 

⑤ Install the GCC compiler: `apt-get install gcc `

⑥ Install the build-essential: `sudo apt install build-essential`

⑦ Use Vim to edit the source program, enter "`vi Hello.c`" in the terminal, start the Vi editor, and  enter the command-line mode.After starting, press the “i” key to enter the insertion mode. If the  "Insert" prompt appears on the lower left, the user can edit the text. Enter the `Hello.c `source code,  as shown in Figure Figure 2-2.

![](.\assets\图片2.png)

Finally, press Esc to convert the insertion mode to command line mode, and enter the command "`:  wq`" to exit. 

⑧ Compile the source code and enter the command "`gcc Hello.c-o Hello`" under the terminal for  compile. 

⑨ Run the program, enter the command under the terminal "`. / Hello` " to run. As shown in Figures 2 – 3.

![](.\assets\图片3.png)

#### **（2）The use of Vi, Vim editors (refer to Section 2.2)**

① Start and exit Vim, enter the command "`vim`" at the terminal to start. If you exit vim, press "Esc" to return to command line mode and then type "`: q`", and press "Enter" to exit.

② Switching between 3 modes (command mode, edit mode, and bottom row mode), and the use of common commands in 3 modes. Command line mode common function keys are listed in Table 3-1. Base row mode common function keys are listed in Table 3-2. Complete the following operation exercises.

1) Create a directory named'/ Vi under the / root directory: `mkdir /Vi` 

2) Enter the ` / Vi ` directory: `cd /Vi` 
3) Copy the file "/ etc/systemd/system.conf" to the "/ Vi" directory: `cp /etc/systemd/system.conf /Vi/` 
4) Open the system.conf file in the / Vi directory using Vim: `vim /Vi/system.conf` 
5) Set the line number: `:set number` 
6) Find a specific row or setting: Use “/” plus the string to search for, such as “ `/ DefaultLimitNOFILE=`” , and then press “Enter ”to  find specific settings. 
7) Copy, paste, and move the cursor: In command line mode, copy the current line using “ `yy` ”, “ `p`” paste the copied content, “`G` ”  move to the end of the file, “`gg`” to the beginning of the file, “`0` ” to the beginning of the line, and  “`$`”to the end of the line. 
8) Delete the current row: `dd` 
9) Save the file but do not exit: `:w` 
10) Insert Text: -In command line mode,  press “i ” to enter insert mode and then enter text. 
11) Force to exit Vim without saving the changes: `:q!`

#### （3）The use of the GCC editor

**1）**. **The GCC compilation process**

It is mainly divided into four processes: preprocessing, compilation, compilation, and linking.

![](.\assets\图片4.png)

**2**）. **GCC to compile the command**

First create a hello.c file with Vi, type "`vi hello.c`", press “i” to enter the insertion mode, write the program, edit the save disk, the program source code is as follows:

![](.\assets\图片5.png)

To compile this program, first enter "`gcc-o hello hello.c`" under the command line, and the GCC compiler generates an executable file, and then enter "`. / Hello`" You can see the output of the program.

![](.\assets\图片6.png)

You can control the gcc compilation process with different gcc options to split the gcc compilation process

Only for preprocessing, and generated. i document:

`gcc -E -o hello.i hello.c`

Only to compile operations, will. i file generation. The assembly file of the s:

`gcc -S -o hello.s hello.i`

Only perform assembly operations, will. s file generation. o document:

`gcc -c -o hello.o hello.s`

Only do the link operation, will. The o file is linked to generate the final executable file:

`gcc -o hello hello.o`

![](.\assets\图片7.png)

**3**）**.Common compilation options**

|  常用选项   |                        描述                        |
| :---------: | :------------------------------------------------: |
|     -E      | 预处理，开发过程中想快速确定某个宏可以使用“-E -dM” |
|     -c      |       把预处理、编译、汇编都做了，但是不链接       |
|     -o      |                    指定输出文件                    |
| -I(i的大写) |                   指定头文件目录                   |
|     -L      |                指定链接时库文件目录                |
| -l(L的小写) |                指定链接哪一个库文件                |

For example, use the “-I” parameter to specify the header file directory

The header file directory is the current directory

`gcc -c -o main.o main.c -I`

**4**）**. Compile multiple files**

① Use the GCC compiler to compile and link the main.c and sub.c source code files together into an executable file with the file name test.

`gcc -o test main.c sub.c`

② Use the GCC compiler to compile main.c into a target file (object file) with the name main.o.

`gcc -c -o main.o main.c`

③ Compcompile sub.c into a target file named sub.o

`gcc -c -o sub.o sub.c`

④ Link the previously compiled target files main.o and sub.o into an executable file with the file name test.

`gcc -o test main.o sub.o`

**5）. Use the GCC to check for errors in the program**

Use the following source code to use the GCC for error check, warning prompt.

![](.\assets\图片8.png)

It is not difficult to find the following errors in the code:

\>The return value of the main function is declared void, but it should actually be main;

\> Using a CNU syntax extension that uses long long to declare 64-bit integers, but does not meet ANSI / ISO language standards;

\> Main function calls the return statement return value in a function with no return value.

When the GCC compiles the source code that does not meet the ANSI / ISOC language standard, with the "-pedantic" option, where the extended syntax is used generates a warning message.

![](.\assets\图片9.png)

And“-Wall” enables the GCC to generate more warnings:

![](.\assets\图片10.png)

### **（4**）The use of the GDB basic commands

1).Eit to Vim and enter “`vim greet.c`”

2).Enter "`i`" to enter the insertion mode and type the following source code

![](.\assets\图片11.png)

![](.\assets\图片12.png)

3).After editing, complete the inventory, enter "`: wq`"

4).With the GCC compilation: `gcc-g greet.c-o greet`

5).Run:`. / greet`

![](.\assets\图片13.png)

6).Start the Gdb debugging: `gdb greet`

7).View the source code: `list 1`

8).Set the breakpoint at 20 rows (for loop): `break 20`

9).Set the breakpoint at 23 lines (at the printf function): `break 23`

10).View the breakpoint setting situation:`info breakpoints`

![](.\assets\图片14.png)

11).Run the code: `run`

12).Single-step run code: `next`

13).View the pause point variable value: `print string2 [size-i]`

14).Run the code several times and use the command to see the value of the string2 array.

15).Continue with the program running: `continue`

17).Exit the GDB : `quit`

![](.\assets\图片15.png)

### （5）**The Use of Make Project Manager**

**Experiment Objectives**

  	* Master the use of Vi editor to edit C language source code files.
  	* Learn how to manually write Makefile files to automate the compilation process.
  	* Understand and practice using the Make tool to compile projects.
  	* Explore the use of automatic generation tools.

**Experiment Environment**

- Linux operating system
- Vi text editor
- GCC compiler
- Make tool
- Automake (optional, for automatically generating Makefile)

**Experiment Steps**

Step 1: Edit the Source Code

- Open the terminal: Start the Linux terminal.
- Create and edit the hello.c file:

1. - Enter the command `vi hello.c` to open or create the hello.c file.
   - In the Vi editor, enter the following C language code:

​                               ![](.\assets\图片16.png)

1. - Press the "Esc" key to exit insert mode, then type “ `:wq` ” to save and exit the Vi editor.

 ![](.\assets\图片17.png)

Step 2: Manually Write the Makefile

- Create the Makefile file:

1. - Enter the command “`vi Makefile`”  to create or edit the Makefile file.
   - In the Vi editor, enter the following content:
   - Save and exit the Vi editor.

![](.\assets\图片18.png)

Step 3: Compile the Project Using Make

- Compile the project in the terminal:

1. - Enter the command “`make`”  and press Enter.
   - Observe the output to confirm whether the hello executable file and hello.o object file      were successfully generated.
   - Run the program by entering the command “`./hello`” and check if the output is “Hello, Make!.”

![](.\assets\图片19.png)

Step 4: Use Automatic Generation Tools to Generate Makefile

- Create a file named Makefile or makefile in the specified directory
- Terminal input “`make`”, default execution of Makefile file 
- Specify the execution of a makefile file

![](.\assets\图片20.jpg)

### **(6)** **Familiar with the CodeBlocks integrated development environment**

1). Install the Code:: Blocks

First, you need to download the Code:: Blocks version for your operating system from the official website <https://www.codeblocks.org/downloads/>. The installation process is usually simple and follow the instructions of the installation wizard.

2). Understand the Code:: Blocks interface

After installation, open Code:: Blocks and you will see an intuitive user interface. It mainly includes menu bar, toolbar, project browser, editor window, log window and other parts. Familiarity with these interface elements is the basis for the efficient use of the Code:: Blocks.

3). Create and manage the projects

In Code:: Blocks, you can organize and manage the code by creating projects. Click File-> New-> Project..., select a project type (such as Console application), and create the project following the wizard instructions. After the creation is complete, you can see the project structure and files list in the Project Browser.

4). Written and compiled the code

Write the code in the editor window, and after saving it, you can compile the project either by clicking the "Build and run" button on the toolbar or by pressing the shortcut key (such as F9). After a successful compilation, you can see the compilation information in the log window.

5). Debug code

Code:: Blocks has powerful debugging capabilities built in to help you find and resolve errors in your code. To debug the code, you first need to set the breakpoint (right-click in the code line number area and select "Toggle breakpoint"). Then, click the "Debug" button on the toolbar or press the shortcut key (such as F8) to start debugging. During debugging you can view variable values, single step execution code, in and out functions etc.

6). Practical skills

①. Use code template: Code:: Blocks Support custom code template, which can help you quickly generate commonly used code structures and improve writing efficiency.

②. Automatic completion: When entering the code in the editor, Code:: Blocks will automatically prompt the possible completion options according to the context to reduce the input errors.

③. External Library Management: If you need to use an external library in a project, you can configure the path and link options of the library file by "Settings" -> "Compiler..." -> "Linker settings".

④. Custom shortcut keys: Code:: Blocks Allows you to customize the shortcut keys to perform common operations more quickly.

**Code:: Use of the Blocks**

**1)** **Create the file by clicking on File-> New-> File in the upper left corner**

![](.\assets\图片21.png)

##### 2) Select the category

![](.\assets\图片22.png)

![](.\assets\图片23.png)

##### 3) Name it and save it.

![](.\assets\图片24.png)

##### 4) Enter the code, and then save the Ctrl + S.

![](.\assets\图片25.png)

##### 5) Take a look at the key button functions, which can be compiled and then executed, or directly compiled + execution.

![](.\assets\图片26.png)

##### 6) An error message or warning will be displayed here after compilation

![](.\assets\图片27.png)

##### 7) Execution after compilation.

![](.\assets\图片28.png)

 ##  6.Thinking questions

(1) An executable program for compiling the hello.c into an ARM architecture.

(2) What is remote debugging?

(3) Programatically input any two integers a and b less than 100, and then output all numbers of a and b within 100, and compile and debug with GCC and GDB.

