#include "widget.h"
#include "./ui_widget.h"

Widget::Widget(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::Widget)
{
    ui->setupUi(this);
}

Widget::~Widget()
{
    delete ui;
}

void Widget::on_EnterB_clicked()
{
    qDebug("Successful Login");
}


void Widget::on_BuildB_clicked()
{
    qDebug("Successful Created");
}

