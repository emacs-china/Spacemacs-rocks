#include"Demo.h"
#include<iostream>

void Demo::sayHello(const std::string& name)
{
    std::cout<<"Hello!" << name <<std::endl;
}

void Demo::print()
{
    std::cout<<"print"<<std::endl;
}
