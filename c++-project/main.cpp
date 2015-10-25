#include <iostream>
#include "lib/Demo.h"

int main(int argc, char *argv[])
{
    Demo obj;
    obj.print();

    Demo* obj2 = new Demo;
    obj2->sayHello("zilongshanren");

    obj2->xxx();
    return 0;
}
