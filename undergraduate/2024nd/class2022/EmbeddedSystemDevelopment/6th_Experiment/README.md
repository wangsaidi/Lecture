## Embedded Linux Experiment Six

## Experiment Objective

-   Familiarize with the use of the Qt Creator development environment.
-   Learn how to create a basic GUI application in Qt.
-   Understand how the Qt signal and slot mechanism works.
-   Implement a basic counter application that increments the counter by one with each button click.

## Prepare the experimental environment.

1.  **Qt Version**：Qt Creator 6.8.0
2.  **Operating System**：Ubuntu 22.04.2

## Video Tutorial

[{Embedded Linux Qt Development=Signals and Slots Linux Lab}](https://www.bilibili.com/video/BV1kb1oYJEnL?vd_source=96f5a31680137ac4bd3f08e085e51241)

[{Experiment Application Part=Image Switcher}](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment)

## Install Qt

{Open this link in the browser on the Ubuntu system=[Qt Online Installer](https://www.qt.io/download-qt-installer-oss?hsCtaTracking=99d9dd4f-5681-48d2-b096-470725510d34%7C074ddad0-fdef-4e53-8aa8-5e8a876d6ab4)}

If the webpage is unresponsive, you can **use a VPN**.

Select **Linux x64** and download.

[![image-20240929102932532](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929102932532.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929102932532.png)

Find the downloaded file, open the terminal, input `chmod +x` , then drag the file in, and press Enter to add **executable permissions** to the file.

[![image-20240929103831867](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929103831867.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929103831867.png)

You need to complete the registration of your Qt account on the [Qt official website](https://www.qt.io/). Return to the Qt installer, enter your account username and password, and click next.

[![image-20240929104734859](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929104734859.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929104734859.png)

Please check the box, and then continue to the next step.

[![image-20240929105142680](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929105142680.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929105142680.png)

You can choose **not to send statistics** to Qt, next step.

[![image-20240929105249683](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929105249683.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929105249683.png)

Select **Desktop Development**, next step.

[![image-20240929110118148](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929110118148.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929110118148.png)

After agreeing to the agreement, the next step is to click install, which will bring up the download and installation interface. It can also be downloaded normally in the country; if there are any download issues, you can click retry.

[![image-20240929110307094](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929110307094.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929110307094.png)

After the installation is complete, find **Qt Creator** in the applications at the bottom left and open it.

[![image-20240929103621167](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929103621167.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929103621167.png)

> If the following interface is displayed, it prompts that running Qt requires the installation of dependencies.
> 
> [![image-20240929114220870](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929114220870.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929114220870.png)
> 
> Enter the installation command in the **terminal** and press Enter. After the installation is complete, you can open Qt Creator.
> 
> ```shell
> sudo apt install libxcb-cursor0
> ```

## Create a project

First, open Qt Creator and follow these steps to create a new Qt Widgets application:

1.  In Qt Creator, click "File" -> "New Project".
    
    [![image-20240929124920834](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929124920834.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929124920834.png)
    
2.  In the pop-up window, select "Qt Widgets Application" under "Applications."
    
    [![image-20240929125121259](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929125121259.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929125121259.png)
    
3.  Set the project name, for example, "ButtonCounter," and choose the save path.
    
    [![image-20240929125229402](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929125229402.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929125229402.png)
    
4.  **Keep the subsequent selection page at default** and continue clicking "Next" until the project creation is complete.
    

{After creating the project, Qt will automatically generate several important files, including=null}

-   {**main.cpp**\=the program entry file.}
-   **mainwindow.ui**: The UI design file for the main window.
-   **mainwindow.h** and **mainwindow.cpp**: Header file and implementation file for the main window class.

[![image-20240929125419652](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929125419652.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929125419652.png)

## Design user interface

[![image-20240929125720176](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929125720176.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929125720176.png)

Open `mainwindow.ui`, enter the Qt visual UI designer, and follow the steps below to design the interface:

1.  Drag a **Push Button** from the "Widget Box" on the left side to the central interface, and set the button's `text` property to "ClickMe!".
    
    [![image-20240929130122344](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929130122344.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929130122344.png)
    
2.  Drag another **Label** to display the click count, with the default text showing "Number: 0".
    
    [![image-20240929130445562](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929130445562.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929130445562.png)
    
3.  Adjust the position and size of buttons and labels to ensure a reasonable layout.
    

After completing the design, remember to save the UI design (Ctrl+S).

## Interpretation of the signal and slot mechanism

In Qt programming, the **signal and slot mechanism** is a flexible mechanism used for passing information between objects. Its key role is **decoupling**, meaning that the sender of the signal does not need to know who the receiver is, nor does it need to care about how the receiver handles the signal.

### Why not operate directly?

In many cases, we want different objects to maintain independence from each other. For example, suppose you are developing a complex application where clicking a button needs to trigger many different actions: some update the interface, some save data, and some send notifications. If each button directly controls these actions, it will make the code very complex and difficult to maintain.

The purpose of the signal and slot mechanism is to **simplify the communication process**, allowing objects to operate without directly interacting with each other, but instead informing the system "what happened" in the form of signals, which the system then passes to the corresponding handling function (slot).

### suitable example

Imagine you are waiting for a flight at the airport. The airport has a broadcasting system responsible for notifying passengers about flight information. This broadcasting system can be understood as the transmitter of the "signal." Every passenger at the airport is like a "slot," receiving this information and taking action based on the notifications (for example: boarding).

{the key here is=null}

-   The **broadcast system (signal)** does not need to understand the specific situation of each passenger. It is only responsible for issuing messages.
-   **Passengers (slots)** decide what to do based on the information received, such as going to the boarding gate or continuing to wait.

This example is similar to the signal and slot mechanism: signals are only responsible for transmitting messages, while which object receives the message and how it is processed is entirely determined by the slots. There can be a many-to-many relationship between signals and slots: one signal can connect to multiple slots, and multiple signals can also connect to the same slot.

### Advantages of Signals and Slots

1.  **Flexibility**: Signals and slots make different parts of the program more flexible, allowing for dynamic connection and disconnection of signals and slots at runtime as needed.
2.  **Decoupling**: The object sending the signal does not need to know the internal details of the receiver; it only needs to emit the signal, which will be handled by the receiver (slot).
3.  {**Scalability**\=By using signals and slots, the program can easily add new features without modifying the existing code.}

## Implement signal and slot connections

## Define the counter variable in the header file.

Open `mainwindow.h`, and add an integer type member variable `clickCount` in the private section of the main window class to store the number of button clicks:

```c
private:
    int clickCount;  // 计数器变量
```

[![image-20240929130732316](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929130732316.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929130732316.png)

## Initialize the counter

{Initialize the counter variable in the constructor of `mainwindow.cpp`\=null}

```
<span>MainWindow::MainWindow</span>(QWidget *parent)
    : QMainWindow(parent)
    , ui(<span>new</span> Ui::MainWindow)
    , clickCount(<span>0</span>)  <span><span>//</span> 初始化点击次数</span>
{
    ui-&gt;<span>setupUi</span>(<span>this</span>);
}
```

The red lines in the figure below indicate the modifications:

[![image-20240929163154968](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929163154968.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929163154968.png)

## Write a slot function

{Next, write a slot function in `mainwindow.cpp` that is triggered when the button is clicked, updates the count, and displays it in the label=null}

```
<span>void</span> <span>MainWindow::on_pushButton_clicked</span>()
{
    clickCount++;  <span><span>//</span> 点击次数加1</span>
    ui-&gt;<span>label</span>-&gt;<span>setText</span>(<span><span>"</span>Number: <span>"</span></span> + <span>QString::number</span>(clickCount));  <span><span>//</span> 更新标签显示</span>
}
```

[![image-20240929163243460](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929163243460.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929163243460.png)

After completing the code writing, press Ctrl+S to save the changes.

## Connect signals and slots

In Qt Designer, you can right-click on the button, select "Go to Slot," and then choose the `clicked()` signal. Qt will automatically generate the declaration of the slot function in the code.

[![image-20240929154419028](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929154419028.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929154419028.png)

[![image-20240929154520655](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929154520655.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929154520655.png)

Of course, if you want to manually connect signals and slots, you can use the following code in the constructor:

```c
connect(ui->pushButton, &QPushButton::clicked, this, &MainWindow::on_pushButton_clicked);
```

This piece of code indicates that when the button is clicked, the `clicked()` signal is triggered, which then executes the `on_pushButton_clicked()` slot function.

## Compile and run the project

Qt Creator automatically configures CMake, without the need for manual writing. The run, debug, and compile button in the lower left corner of the author's Creator is gray.

**If your button is colored, there is no need to troubleshoot CMake configuration errors.**

> Upon checking the error message, I found that my Ubuntu is missing the OpenGL-related libraries, which are dependencies for the Qt6Gui and Qt6Widgets components of Qt6.
> 
> [![image-20240929161937702](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929161937702.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929161937702.png)
> 
> Execute in the terminal:
> 
> ```shell
> sudo apt install libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev
> ```
> 
> After the installation is complete, restart the corresponding service, enter `1 2 3 4` and press Enter.
> 
> Reopen Qt, open the file or project, and select the project's CMake file. At this point, Creator will automatically configure CMake, and the three buttons will have turned colorful.
> 
> [![image-20240929162719103](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929162719103.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929162719103.png)

Click the "Run" button, and Qt Creator will compile the project and launch the application. When the button is clicked, the click count in the label will update with each button click.

[![image-20240929163500625](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929163500625.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929163500625.png)

## Experiment Play Section

## Image Switcher

Click the button to switch and display different images in sequence.

### 1\. Create Project

First, create a folder to store the project files.

{Next, open Qt Creator and follow these steps to create a new Qt Widgets application=null}

1.  In Qt Creator, click "File" -> "New Project".
    
2.  In the pop-up window, select "Qt Widgets Application" under "Applications."
    
3.  Set the project name, for example, "PictureSwitcher", choose the save path as the newly created folder, and keep clicking "Next" until the project creation is complete.
    
    [![image](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07111624.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07111624.png)
    
4.  Place the images to be switched in a folder, naming them 1.jpg, 2.jpg, and so on, and move that folder to the project directory.
    

### 2\. Design User Interface

{Open the `mainwindow.ui` file, enter the Qt visual UI designer, and follow the steps below to design the interface=null}

1.  Drag two \*\*buttons (Push Button)\*\* from the "Widget Box" on the left to the center of the interface, setting the `text` property of the buttons to "Previous" and "Next," indicating the previous and next images, respectively. At the same time, set their **ObjectName** to "btnPrev" and "btnNext," making it easier for subsequent code definitions and references.
    
    [![image](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07130303.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07130303.png)
    
2.  Drag another **label** to display the image, and the default text can be deleted.
    
3.  Adjust the position and size of buttons and labels to ensure a reasonable interface layout.
    
    [![image](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07121601.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07121601.png)
    

After completing the design, remember to save (Ctrl+S).

### 3\. Implement signal and slot connections

#### Define variables in the header file.

Open the `mainwindow.h` file and add the definitions for QLabel and QPushButton:

```c
#include <QLabel>
#include <QPushButton>
```

{Add slot functions, QLabel, and QPushButton definitions in the class definition=null}

```
private slots:
    <span>void</span> <span>btnPrev_clicked</span>(); <span><span>//</span> 点击“Previous”按钮的槽函数</span>
    <span>void</span> <span>btnNext_clicked</span>(); <span><span>//</span> 点击“Next”按钮的槽函数</span>

<span>private:</span>
    Ui::MainWindow *ui;
    QLabel *label; <span><span>//</span> 用于显示图片的标签</span>
    QPushButton *btnPrev; <span><span>//</span> “Previous”按钮</span>
    QPushButton *btnNext; <span><span>//</span> “Next”按钮</span>
    <span>int</span> currentImageIndex; <span><span>//</span> 当前显示图片的索引</span>
    <span>void</span> <span>showImage</span>(<span>int</span> index); <span><span>//</span> 显示图片的函数</span>
```

#### Import image resources

In the left sidebar of the project, right-click on the project name **PictureSwitcher**, select "Add New File" --> "Qt" --> "Qt Resources File", and the file name can be named arbitrarily, for example, "Image".

[![image](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07121029.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07121029.png)

After loading the resource file, a **resource folder** will appear on the left side, with a **Image.qrc** file underneath. Right-click on "Resources" --> "Add Existing File" and select the image files you want to add. Make sure these image files are already placed in the folder of the project directory.

[![image](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07121433.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07121433.png)

#### Initialization

{Initialize variables in the `mainwindow.cpp` constructor=null}

```
<span>MainWindow::MainWindow</span>(QWidget *parent)
    : QMainWindow(parent)
    , ui(<span>new</span> Ui::MainWindow)
    , currentImageIndex(<span>0</span>)  <span><span>//</span> 从第一张图片开始</span>
{
    ui-&gt;<span>setupUi</span>(<span>this</span>);
    label = ui-&gt;<span>label</span>; <span><span>//</span> 设置 QLabel 变量</span>
    btnPrev = ui-&gt;<span>btnPrev</span>; <span><span>//</span> 设置“Previous”按钮变量</span>
    btnNext = ui-&gt;<span>btnNext</span>; <span><span>//</span> 设置“Next”按钮变量</span>

    <span><span>//</span> 连接按钮与槽函数</span>
    <span>connect</span>(btnPrev, &amp;QPushButton::clicked, <span>this</span>, &amp;MainWindow::btnPrev_clicked);
    <span>connect</span>(btnNext, &amp;QPushButton::clicked, <span>this</span>, &amp;MainWindow::btnNext_clicked);

    <span>showImage</span>(currentImageIndex); <span><span>//</span> 初始化显示第一张图片</span>
}
```

Red indicates modified lines:

[![image](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07110049.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07110049.png)

#### Write a slot function

Next, write the slot function in the `mainwindow.cpp` file to toggle the image when the button is clicked:

```
<span>void</span> <span>MainWindow::btnPrev_clicked</span>()
{
    <span><span>//</span> 当前索引减1，如果小于0，则变为最后一张图片的索引</span>
    currentImageIndex = (currentImageIndex &gt; <span>0</span>) ? currentImageIndex - <span>1</span> : <span>2</span>;
    <span>showImage</span>(currentImageIndex);
}

<span>void</span> <span>MainWindow::btnNext_clicked</span>()
{
    <span><span>//</span> 当前索引加1，如果大于最后一张图片的索引，则变为0</span>
    currentImageIndex = (currentImageIndex &lt; <span>2</span>) ? currentImageIndex + <span>1</span> : <span>0</span>;
    <span>showImage</span>(currentImageIndex);
}

<span>void</span> <span>MainWindow::showImage</span>(<span>int</span> index)
{
    <span><span>//</span> 构建图片路径</span>
    QString imagePath = <span>QString</span>(<span><span>"</span>:/picSwitch/%1.jpg<span>"</span></span>).<span>arg</span>(<span>index</span> + <span>1</span>); <span><span>//</span> “:/picSwitch/%1.jpg”为图片路径</span>
    <span>qDebug</span>() &lt;&lt; <span><span>"</span>加载图片:<span>"</span></span> &lt;&lt; imagePath;
    QPixmap <span>pixmap</span>(imagePath); <span><span>//</span> 加载图片</span>
    <span>if</span> (!pixmap.<span>isNull</span>()) {
        <span><span>//</span> 调整图片大小以适应 QLabel，保持纵横比</span>
        QPixmap scaledPixmap = pixmap.<span>scaled</span>(label-&gt;<span>size</span>(), Qt::KeepAspectRatio, Qt::SmoothTransformation);
        label-&gt;<span>setPixmap</span>(scaledPixmap); <span><span>//</span> 将图片设置到 QLabel 上</span>
        label-&gt;<span>setAlignment</span>(Qt::AlignCenter); <span><span>//</span> 图片居中显示</span>
    } <span>else</span> {
        <span>qDebug</span>() &lt;&lt; <span><span>"</span>加载图片失败:<span>"</span></span> &lt;&lt; imagePath;
    }
}
```

After completing the code writing, press Ctrl+S to save changes.

{The red part indicates the changes=null}

[![image](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-07%20110058.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-07%20110058.png)

### 4\. Connect Signals and Slots

In the initialization step, the signal and slot have been manually connected. This code indicates that when the button is clicked, the `clicked()` signal is triggered, executing the corresponding slot function.

You can also right-click the button in Qt Designer, select "Go to Slot," and then choose the `clicked()` signal, and Qt will automatically generate the slot function declaration.

### 5\. Compile and Run

Click the green triangle button in the lower left corner to start compiling and running the project.

A window will pop up, click **Previous** to go back to the previous image, and click **Next** to switch to the next image.

[![image](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07121601.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07121601.png)

The following is the revised document, ensuring that the title hierarchy does not exceed three levels, and the content is more accessible while retaining the operational sequence and Chinese comments:

## Synchronization between the slider and the progress bar

The value of the slider is reflected in real-time on the progress bar and updates synchronously while sliding.

### 1\. Create Project

First, create a folder to store the project files.

Then, open Qt Creator and follow these steps to create a new Qt Widgets application:

1.  In Qt Creator, click "File" -> "New Project".
    
    [![](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/a60f58d6cc469a0960a629253d829ed.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/a60f58d6cc469a0960a629253d829ed.png)
    
2.  In the pop-up window, select "Qt Widgets Application" under "Applications."
    
    [![](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/4c2bf56deae274050e65195bd7f5823.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/4c2bf56deae274050e65195bd7f5823.png)
    
3.  Set the project name, for example, "slide", choose the save path as the newly created folder, and keep clicking "Next" until the project creation is complete.
    
    [![](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/579da2736515b8cf1807b2a6bc06cf8.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/579da2736515b8cf1807b2a6bc06cf8.png)
    

### 2\. Design User Interface

1.  Click `mainwindow.ui` to enter the Qt visual UI designer and start setting up the interface.
    
    [![](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/bab35ee5a0409753e6f573783df911e.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/bab35ee5a0409753e6f573783df911e.png)
    
2.  Drag a "Line Edit" into the window to display the percentage of the slider, and a "Horizontal Slider" to represent the slider.
    
    [![](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/56efa21cd2c1ffc71955d181ef2a6ea.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/56efa21cd2c1ffc71955d181ef2a6ea.png)
    

### 3\. Connecting signals and slots

1.  Right-click on "Horizontal Slider," select "Go to Slot," and then choose the signal `valueChanged()`, which will generate and link to the slot function in the code.
    
    [![](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/c11dcd142e93253a312e1aeb3e90d78.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/c11dcd142e93253a312e1aeb3e90d78.png)
    
2.  Right-click on "Line Edit", select "Go to Slot", and then choose the signal `textChanged()` to generate and link to the slot function in the code.
    
    [![](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/0e9b65cc7baa3d108805ea3f7bdaf97.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/0e9b65cc7baa3d108805ea3f7bdaf97.png)
    

### 4\. Writing Slot Functions

1.  The generated slot functions are shown in the figure.
    
    [![](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/f70943065f84e3f6470655be80ac10f.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/f70943065f84e3f6470655be80ac10f.png)
    
2.  Modify the slot function to:
    

```
<span>void</span> <span>MainWindow::on_horizontalSlider_valueChanged</span>(<span>int</span> value)
{
    ui-&gt;<span>lineEdit</span>-&gt;<span>setText</span>(<span>QString</span>(<span><span>"</span>%1<span>"</span></span>).<span>arg</span>(value)); <span><span>//</span> 更新 Line Edit 显示滑块值</span>
}

<span>void</span> <span>MainWindow::on_lineEdit_textChanged</span>(<span>const</span> QString &amp;arg1)
{
    ui-&gt;<span>horizontalSlider</span>-&gt;<span>setValue</span>(arg1.<span>toUInt</span>()); <span><span>//</span> 根据输入更新滑块值</span>
}
```

As shown in the figure:

[![](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/a46a8456e7307953ec64054b037972f.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/a46a8456e7307953ec64054b037972f.png)

### 5\. Compile and Run

Click the run button, and the following dialog box will appear.

[![](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/4af8e539a3763b524acaf05c4a1abc6.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/4af8e539a3763b524acaf05c4a1abc6.png)

As the slider is dragged, the progress of the slider will be displayed in real-time in the box:

[![](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/c8b4c9e42d604b216d0b57bc49d89f9.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/c8b4c9e42d604b216d0b57bc49d89f9.png)

At the same time, if a number is entered in the box, the slider will also move to the corresponding progress.

[![](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/44b1d7b7404df55e3ad626bcbb2c03f.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/44b1d7b7404df55e3ad626bcbb2c03f.png)

## Pop-up dialog box

After clicking the button, a message box or confirmation dialog will pop up.

### 1\. Create Project

First, open Qt Creator and create a new folder.

1.  In Qt Creator, click "File" -> "New Project".
    
2.  In the pop-up window, select "Qt Widgets Application" under "Applications."
    
3.  Set the project name, for example, "inputwin," and choose the save path.
    
    **Keep the subsequent selection page at default** and continue clicking "Next" until the project creation is complete.
    

### 2\. Design User Interface

Open `mainwindow.ui`, enter the Qt visual UI designer, and follow the steps below to design the interface:

1.  Drag a **Push Button** from the "Widget Box" on the left to the central interface, and set the button's `text` property to "inputwin".
    
2.  Drag another **Label** again.
    
3.  Adjust the position and size of buttons and labels to ensure a reasonable layout.
    

After completing the design, remember to save the UI design (Ctrl+S).

[![image](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07183547.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07183547.png)

[![image](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07184128.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07184128.png)

### 3\. Compile and Run

[![image](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07184150.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE2024-10-07184150.png)

## Multi-button color switch

Change the window color when clicking different buttons.

### 1\. Create Project

1.  Open Qt and select "Qt Widgets Application" to create a new project.
    
    [![](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20185848.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20185848.png)
    
2.  Set the project name to "PushButton\_SwitchColor" and choose the save path.
    
    [![命名](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20190058.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20190058.png)
    
3.  Keep the following options default and click "Next" until the project is successfully created.
    

### 2\. Design User Interface

1.  Click `mainwindow.ui` to enter the Qt visual UI designer.
    
    [![UI设计](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20190524.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20190524.png)
    
2.  Click the window title bar to modify the window name for a clearer description of its function.
    
    [![设置窗口名称](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20191239.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20191239.png)
    
3.  Drag several **Push Buttons** from the "Widget Box" to the central interface, and modify the button names in the properties editing bar.
    
    [![功能按键](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20191456.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20191456.png)
    
4.  In the "Object Viewer," find the component for each button and rename it to the corresponding color to facilitate writing the slot functions.
    
    [![对象命名](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20191854.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20191854.png)
    

### 3\. Connecting signals and slots

1.  Right-click the button, select "Go to Slot," and then choose the `clicked()` signal to generate and link to the slot function.
    
    [![信号与槽](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20192148.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20192148.png)
    
    [![槽](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929154520655.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/image-20240929154520655.png)
    

### 4\. Writing Slot Functions

1.  The generated slot function is as follows, with the corresponding color names shown in the function declaration.
    
    [![槽函数](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20192449.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20192449.png)
    
2.  Write a slot function to change the background color when the button is pressed:
    

```c
this->setStyleSheet("QMainWindow{background-color:rgba( , , , );}"); // 填入颜色参数
```

After completion, remember to press Ctrl+S to save changes.

[![代码](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20192704.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20192704.png)

### 5\. Compile and Run

{Click the run button to display a window with prompts=null}

[![窗口](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20192914.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20192914.png)

{Press the button, and the background will change to the corresponding color=null}

[![](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20192925.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20192925.png)

[![](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20192939.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE%202024-10-05%20192939.png)

## Timer countdown

Implement the countdown function through signal and slot connections, and issue a prompt when the time is up.

### 1\. Create Project

First, create a new folder, then open Qt Creator and follow the steps below to create a new Qt Widgets application:

1.  In Qt Creator, click "File" -> "New Project".
    
2.  Select "Qt Widgets Application" under "Applications".
    
3.  Set the project name to "Timer0", select the save path, and click "Next" to complete the creation.
    
    [![image](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E7%A7%A6%E6%99%A8%E9%98%B3/Qcy1.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E7%A7%A6%E6%99%A8%E9%98%B3/Qcy1.png)
    

### 2\. Design User Interface

Open `mainwindow.ui` to enter the Qt visual UI designer and follow the steps below to design the interface:

1.  Drag a **Push Button** to start the timer, and when the timer counts down to 0, display "Time up" to alert the user.
    
2.  Drag another **LcdNumber** to display the timer number, with a default initial value of 10.
    
3.  Adjust the position and size of the buttons and labels to ensure a reasonable layout.
    
    [![image](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E7%A7%A6%E6%99%A8%E9%98%B3/Qcy2.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E7%A7%A6%E6%99%A8%E9%98%B3/Qcy2.png)
    

After completing the design, remember to save (Ctrl+S).

### 3\. Implement signal and slot connections

#### Add definitions in the header file

Add the declaration of slots in the class definition

```
<span>class</span> <span>MainWindow</span> : <span>public</span> <span>QMainWindow</span>
{
    Q_OBJECT

<span>public:</span>
    <span>MainWindow</span>(QWidget *parent = <span>nullptr</span>);
    <span>~MainWindow</span>();

    QTimer *timer1 = <span>new</span> QTimer(<span>this</span>);
    QTimer *timer2 = <span>new</span> QTimer(<span>this</span>);

<span>private:</span>
    Ui::MainWindow *ui;

private slots:
    <span>void</span> <span>currentTimerUpdate</span>();
    <span>void</span> <span>timer1Update</span>();
    <span>void</span> <span>on_pushButton_clicked</span>();
};
```

#### Initialization

{Initialize variables in the constructor of `mainwindow.cpp`\=null}

```
<span>MainWindow::MainWindow</span>(QWidget *parent)
    : QMainWindow(parent)
    , ui(<span>new</span> Ui::MainWindow)
{
    ui-&gt;<span>setupUi</span>(<span>this</span>);
    ui-&gt;<span>lineEdit</span>-&gt;<span>setReadOnly</span>(<span>true</span>);

    <span>connect</span>(timer1, <span>SIGNAL</span>(<span>timeout</span>()), <span>this</span>, <span>SLOT</span>(<span>timer1Update</span>()));
    timer1-&gt;<span>setInterval</span>(<span>1000</span>);
}
```

#### Write a slot function

{Write a slot function that is triggered when the button is clicked to update the number=null}

```
<span>void</span> <span>MainWindow::currentTimerUpdate</span>()
{
    QDateTime currenttime = <span>QDateTime::currentDateTime</span>();
    ui-&gt;<span>lineEdit</span>-&gt;<span>setText</span>(currenttime.<span>toString</span>(<span><span>"</span>yyyy.MM.dd  hh:mm:ss  dddd<span>"</span></span>));
}

<span>void</span> <span>MainWindow::timer1Update</span>()
{
    <span>int</span> num = ui-&gt;<span>lcdNumber</span>-&gt;<span>value</span>();
    num += <span>1</span>;
    ui-&gt;<span>lcdNumber</span>-&gt;<span>display</span>(num);
}

<span>void</span> <span>MainWindow::on_pushButton_clicked</span>()
{
    <span>if</span> (!timer1-&gt;<span>isActive</span>())
    {
        timer1-&gt;<span>start</span>();
        ui-&gt;<span>pushButton</span>-&gt;<span>setText</span>(<span><span>"</span>stop<span>"</span></span>);
    }
    <span>else</span>
    {
        timer1-&gt;<span>stop</span>();
        ui-&gt;<span>pushButton</span>-&gt;<span>setText</span>(<span><span>"</span>continue<span>"</span></span>);
    }
}
```

After completion, remember to press Ctrl+S to save changes.

#### Connect signals and slots

In Qt Designer, right-click on the button, select "Go to Slot," and then choose the `clicked()` signal. Qt will automatically generate the declaration for the slot function.

### 4\. Compilation and Execution

Click the run button on the lower left side to compile and run the program.

After clicking the button, the timer starts, and the button text changes to "stop".

[![image](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E7%A7%A6%E6%99%A8%E9%98%B3/Qcy7.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E7%A7%A6%E6%99%A8%E9%98%B3/Qcy7.png)

When the number on **lcdNumber** jumps to 0, a "Time up" message pops up to inform the user that the timer has completed.

[![image](https://github.com/wangsaidi/Lecture/raw/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E7%A7%A6%E6%99%A8%E9%98%B3/Qcy8.png)](https://github.com/wangsaidi/Lecture/blob/main/undergraduate/2024nd/class2022/EmbeddedSystemDevelopment/6th_Experiment/README.assets/%E7%A7%A6%E6%99%A8%E9%98%B3/Qcy8.png)

## Team Collaboration

{Liu Feifan=Team Leader, responsible for document merging, git management, video recording, and task distribution.}

{The group learned through task-driven learning, acquiring knowledge and dividing the work to complete the experiment. The division of labor and completion status for each part=null}

| Name | Install Ubuntu | Git collaboration | Markdown Syntax | Linux Basics | Qt Installation | Signals and Slots | Independent Play |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Tao Lin | √ | √ | √ | √ | √ | √ | √ |
| Xi Peidong | √ | √ | √ | √ | √ | √ | √ |
| Chen Zhuo | √ | √ | √ |  |  |  |  |
| Li Haoze | √ | √ | √ |  | √ | √ |  |
| Zhou Jingwen | √ | √ | √ | √ | √ | √ | √ |
| Qin Chenyang | √ | √ | √ | √ | √ | √ | √ |
| Sun Yikang | √ | √ | √ |  |  |  |  |
| Gao Jiaxin | √ | √ | √ | √ | √ | √ | √ |
| Zhao Chenran | √ | √ | √ | √ | √ | √ |  |

{Experiment Contribution=null}

-   {Gao Jiaxin=Image Switcher (Tutorial includes video)}
    
-   {Xi Peidong=Synchronization of slider and progress bar}
    
-   {Zhou Jingwen=Pop-up dialog box}
    
-   {Tao Lin=Multi-button color switching}
    
-   Qin Chenyang: Timer countdown