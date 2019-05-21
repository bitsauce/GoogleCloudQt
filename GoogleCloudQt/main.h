#ifndef MAIN_H
#define MAIN_H

#include <QtCore>

class Task : public QObject
{
    Q_OBJECT
public:
    Task(QObject *parent);

public slots:
    void run();
};

#endif // MAIN_H
