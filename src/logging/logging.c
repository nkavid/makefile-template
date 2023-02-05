#include "logging.h"

#include <stdio.h>

void logging_error(const char* msg)
{
  printf("\033[31;1merror:\033[0m %s\n", msg);
}

void logging_warning(const char* msg)
{
  printf("\033[35;1mwarning:\033[0m %s\n", msg);
}

void logging_success(const char* msg)
{
  printf("\033[32;1msuccess:\033[0m %s\n", msg);
}
