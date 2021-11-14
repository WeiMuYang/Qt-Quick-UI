#include "test.h"

test::test(QObject *parent) : QObject(parent)
{

}

test::test(int value)
{
    m_value = value;
}

void test::set_value(int value)
{
    m_value = value;
}

int test::get_value()
{
    return m_value;
}
