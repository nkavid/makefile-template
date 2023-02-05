include build/config.mk
include compiler.mk

APPLICATIONS :=
LIBRARIES :=

include make_target_recipes.mk

include src/app/app.mk
include src/logging/logging.mk

include standard_targets.mk
