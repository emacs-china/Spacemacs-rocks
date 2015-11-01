#include <iostream>
#include "lib/Demo.h"

int main(int argc, char *argv[])
{
    Demo obj;
    obj.print();

    Demo* obj2 = new Demo;
    obj2->sayHello("zilongshanren");

    obj2->xxx();
    obj2->guanghui();
    obj2->ggmm();
    obj2->mmmm();
    obj2->xxoo();
    obj2->gagaga();
    obj2->jj();
    return 0;
}
