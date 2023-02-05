#include "logging.h"

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
  logging_error("first message");
  logging_warning("second message");
  logging_success("third message");
  return EXIT_SUCCESS;
}
